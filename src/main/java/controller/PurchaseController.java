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
    @RequestMapping("orderBook.ing")
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
    @RequestMapping("orderBooks.ing")
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
    @RequestMapping("payOrder.ing")
    public String payOrder(PurchaseVO purchaseVO, MemberVO memberVO,
                           @RequestParam(value = "bookTitle") String bookTitle,
                           @RequestParam(value = "bookKind") String bookKind, Model model) {

        memberVO.setTel((String)httpSession.getAttribute("memberTel"));

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
    @RequestMapping("payComplete.ing")
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
        purchaseMap.put("shipAddress",purchaseVO.getShipAddress());

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


    //주문 조회
    @RequestMapping("orderList.ing")
    public String orderList(PurchaseVO purchaseVO, Model model){
        String memberTel = (String)httpSession.getAttribute("memberTel");
        purchaseVO.setMemberTel(memberTel);
        // 결제완료된 상품을 불러오기위함
        List<List> orderList = new ArrayList<>();

        // 해당 회원의 주문번호들을 리스트에 저장
        List<String> orderNumberList = purchaseService.selectOrderNumber(purchaseVO);

        // 각각의 주문번호를 통해 얻은 쿼리값을 orderList에 저장
        for(String orderNumber : orderNumberList){
            purchaseVO.setOrderNumber(orderNumber);
            orderList.add(purchaseService.selectOrderList(purchaseVO));
        }

        model.addAttribute("orderList", orderList);

        return "purchase/orderList";
    }


    /**
     * 주문 상세조회
     * @param orderNumber : 해당 주문번호
     * @param state : 주문 번호의 상태 - '결제완료', '결제취소'로 나뉨
     */
    @RequestMapping("detailOrderList.ing")
    public String detailOrderList(@RequestParam("orderNumber")String orderNumber,
                                  @RequestParam("state")String state, Model model){
        PurchaseVO purchaseVO = new PurchaseVO();
        purchaseVO.setOrderNumber(orderNumber);
        purchaseVO.setState(state);
//        List<List> detailOrder_List = new ArrayList<>();


        // 주문 상품과 수량을 가져옴
        List<PurchaseVO> detailOrder_List = purchaseService.selectDetailOrder(purchaseVO);
        for(PurchaseVO result : detailOrder_List){
            System.out.println("isbn 확인만 하고 빠질게용  : " + result.getPurchaseBookVO().getIsbn());
        }
        purchaseVO = purchaseService.purchaseInfo(purchaseVO);
        purchaseVO.setOrderNumber(orderNumber);


        model.addAttribute("detailOrder_List", detailOrder_List);
        model.addAttribute("purchaseInfo", purchaseVO);

        return "purchase/detailOrderList";
    }

    // 결제 취소
    @RequestMapping("cancelOrder")
    public String cancelOrder(PurchaseVO purchaseVO){
        System.out.println("cancelOrder() 오다넘버 : " + purchaseVO.getOrderNumber());
        purchaseVO.setMemberTel((String)httpSession.getAttribute("memberTel"));
        PurchaseBookVO purchaseBookVO = new PurchaseBookVO();
        purchaseBookVO.setOrderNumber(purchaseVO.getOrderNumber());

        // Sales_Data 테이블에서 업데이트할 isbn을 얻어옴
        List<PurchaseBookVO> isbnList = purchaseService.selectIsbn(purchaseVO);
        for(PurchaseBookVO list : isbnList){
            purchaseBookVO.setQuantity(list.getQuantity());
            purchaseBookVO.setIsbn(list.getIsbn());
            // 각가의 isbn 상품의 총 수량 및 가격 수정
            purchaseService.insertCancelBook(purchaseBookVO);
            purchaseService.cancel_salesData(purchaseBookVO);
        }

        // Purchase_Book & Member Point 수정
        purchaseService.cancelOrder(purchaseVO);

        System.out.println("결제 취소 완료");
        return "redirect:../start.ing";
    }
}