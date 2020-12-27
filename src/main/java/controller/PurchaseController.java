package controller;

import model.vo.MemberVO;
import model.vo.PurchaseBookVO;
import model.vo.PurchaseVO;
import model.vo.ShoppingCartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.service.MemberService;
import service.service.PurchaseService;
import service.service.ShoppingCartService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 상품 주문 컨트롤러
 */
@Controller
@RequestMapping("/purchase/")
public class PurchaseController {

    @Autowired
    HttpSession httpSession;
    @Autowired
    ShoppingCartService shoppingCartService;
    @Autowired
    PurchaseService purchaseService;
    @Autowired
    MemberService memberService;


    // 상품 주문
    @RequestMapping("/orderBook.ing")
    public String orderBook(ShoppingCartVO shoppingCartVO, String title, Model model) {
        System.out.println("orderBook() title: " + title);
        List<String> isbnList = new ArrayList<>();
        List<Integer> quantityList = new ArrayList<>();

        shoppingCartVO.setTel((String) httpSession.getAttribute("memberTel"));
        List<ShoppingCartVO> cart = shoppingCartService.selectCart(shoppingCartVO);

        for(ShoppingCartVO cartVO : cart){
            isbnList.add(cartVO.getIsbn());
            quantityList.add(cartVO.getQuantity());
        }

        model.addAttribute("cart", cart);
        model.addAttribute("title", title);

        // 구매 완료 후, purchase_book 테이블에 저장하기위해 쓰일용도
        httpSession.setAttribute("isbnList", isbnList);
        httpSession.setAttribute("quantityList", quantityList);


        return "purchase/orderBook";
    }

    /**
     * @param isbnList 결제시 선택한 책들의 isbn 리스트
     * @param titleList 결제시 선택한 책들의 title 리스트
     * @return
     */
    @RequestMapping("/orderBooks.ing")
    public String orderBooks(@RequestParam(value = "isbn[]") List<String> isbnList,
                             @RequestParam(value = "title[]") List<String> titleList, Model model) {

        // 각 상품의 수량을 담을 리스트 생성
        List<Integer> quantityList = new ArrayList<>();

        System.out.println("PurchaseController orderBooks() size  : " + isbnList.size());

        ShoppingCartVO shoppingCartVO = new ShoppingCartVO();
        shoppingCartVO.setTel((String) httpSession.getAttribute("memberTel"));

        List cartList = new ArrayList();

        // 각각의 isbn을 가지고 장바구니에 있는 해당 isbn 책의 정보를 가져옴
        for (String sIsbn : isbnList) {
            shoppingCartVO.setIsbn(sIsbn);
            List<ShoppingCartVO> cart = shoppingCartService.selectCart(shoppingCartVO);

            // 각 상품의 수량을 저장
            for(ShoppingCartVO result :cart){
                quantityList.add(result.getQuantity());
            }

            cartList.add(cart);
        }
        // 장바구니의 주문목록의 상품명 1개를 보냄
        model.addAttribute("title", titleList.get(0));
        model.addAttribute("cartList", cartList);

        // 구매 완료 후, purchase_book 테이블에 저장하기위해 쓰일용도
        httpSession.setAttribute("isbnList", isbnList);
        httpSession.setAttribute("quantityList", quantityList);

        return "purchase/orderBook";
    }

    /**
     * @param bookTitle : 결제 성공 시, 보여줄 대표 책 이름
     * @param bookKind : 책 종류 권수
     *                 결제 성공시 => JSP2 WEB PROGRAMMING(bookTitle) 외 2(bookKind)
     */
    @RequestMapping("/payOrder.ing")
    public String payOrder(PurchaseVO purchaseVO, MemberVO memberVO,
                           @RequestParam(value = "bookTitle") String bookTitle,
                           @RequestParam(value = "bookKind") String bookKind, Model model) {

        memberVO.setTel((String)httpSession.getAttribute("memberTel"));

        System.out.println("payOrder() 확인 : " + bookTitle + " / " + bookKind);
        System.out.println("PurchaseController payOrder Point: " + memberVO.getPoint());
        System.out.println("PurchaseController payOrder totalPrice: " + purchaseVO.getTotalPrice());
        System.out.println("받는사람 : " + purchaseVO.getReceiver());

        model.addAttribute("bookTitle", bookTitle);
        model.addAttribute("bookKind", bookKind);
        model.addAttribute("purchaseVO", purchaseVO);
        model.addAttribute("memberVO", memberVO);

        // 결제 성공시(PurchaseController payComplete()) 쓰일 세션 정보들
        httpSession.setAttribute("payMember" , memberVO);
        httpSession.setAttribute("payPurchase", purchaseVO);
        if (bookKind.equals("0")) {
            httpSession.setAttribute("payName", bookTitle);
        }else{
            httpSession.setAttribute("payName", bookTitle + " 외 " + bookKind);
        }

        return "purchase/payOrder";
    }

    // TODO 트랜잭션 적용할것
    // 결제 성공시
    @RequestMapping("payComplete")
    public String payComplete(Model model) {
        // payOrder()에서 저장한 세션값을 얻어옴
        MemberVO memberVO = (MemberVO)httpSession.getAttribute("payMember");
        PurchaseVO purchaseVO = (PurchaseVO)httpSession.getAttribute("payPurchase");

        PurchaseBookVO purchaseBookVO = new PurchaseBookVO();

        // sql에 필요한 데이터들을 집어넣기위한 해쉬맵 생성
        Map purchaseMap = new HashMap();

        // 첫 orderNumber초기화
        purchaseMap.put("orderNumber", 0);
        purchaseMap.put("memberTel", memberVO.getTel());
        purchaseMap.put("totalPrice",purchaseVO.getTotalPrice());
        purchaseMap.put("receiver", purchaseVO.getReceiver());

        // 구매 완료시 생성된 orderNumber를 저장
        purchaseBookVO.setOrderNumber(purchaseService.insertPurchase(purchaseMap));

        // 세션으로 저장되어있는 주문하고자 하는 상품의 isbn & 수량
        List<String> isbn = (List<String>)httpSession.getAttribute("isbnList");
        List<Integer> quantity = (List<Integer>)httpSession.getAttribute("quantityList");

        // 각각의 상품 isbn & 갯수를 purchase_book에 저장
        for(int i = 0; i<isbn.size(); i++){
            purchaseBookVO.setIsbn(isbn.get(i));
            purchaseBookVO.setQuantity(quantity.get(i));

            //구매 상품 purchase_book 테이블에 추가
            purchaseService.insertPurchaseBook(purchaseBookVO);
            // 구매상품 장바구니에서 삭제
            shoppingCartService.deleteCart((String)httpSession.getAttribute("memberTel"),purchaseBookVO.getIsbn());
        }
        // 포인트 적립
        memberService.updateMemberPoint((MemberVO) httpSession.getAttribute("payMember"));


        model.addAttribute("purchaseVO",purchaseVO);
        model.addAttribute("purchaseBookVO" , purchaseBookVO);

        return "purchase/payComplete";
    }


}
