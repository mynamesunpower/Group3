package controller;

import model.vo.MemberVO;
import model.vo.PurchaseVO;
import model.vo.ShoppingCartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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


    // 상품 주문
    @RequestMapping("/orderBook.ing")
    public String orderBook(ShoppingCartVO shoppingCartVO, String title, Model model) {
        // cartList.jsp로부터 isbn을 넘겨 받음
        System.out.println("PurchaseContoller orderBook() isbn : " + shoppingCartVO.getIsbn());
        System.out.println("PurchaseContoller orderBook() title : " + title);


        shoppingCartVO.setTel((String) httpSession.getAttribute("memberTel"));
        List cart = shoppingCartService.selectCart(shoppingCartVO);
        model.addAttribute("cart", cart);
        model.addAttribute("title", title);
        return "purchase/orderBook";
    }

    @RequestMapping("/orderBooks.ing")
    public String orderBooks(@RequestParam(value = "isbn[]") List<String> isbn,
                             @RequestParam(value = "title[]") List<String> title, Model model) {

        System.out.println("PurchaseController orderBooks() size  : " + isbn.size());

        ShoppingCartVO shoppingCartVO = new ShoppingCartVO();
        shoppingCartVO.setTel((String) httpSession.getAttribute("memberTel"));

        List cartList = new ArrayList();

        // 각각의 isbn을 가지고 장바구니에 있는 해당 isbn 책의 정보를 가져옴
        for (String sIsbn : isbn) {
            shoppingCartVO.setIsbn(sIsbn);
            List cart = shoppingCartService.selectCart(shoppingCartVO);
            cartList.add(cart);
        }
        // 장바구니의 주문목록의 상품명 1개를 보냄
        model.addAttribute("title", title.get(0));

        model.addAttribute("cartList", cartList);

        return "purchase/orderBook";
    }

    // 주문 결제
    @RequestMapping("/payOrder.ing")
    public String payOrder(PurchaseVO purchaseVO, MemberVO memberVO,
                           @RequestParam(value = "bookTitle") String bookTitle,
                           @RequestParam(value = "bookQuantity") String bookQuantity, Model model) {

        System.out.println("payOrder() 확인 : " + bookTitle + " / " + bookQuantity);
        System.out.println("PurchaseController payOrder Point: " + memberVO.getPoint());
        System.out.println("PurchaseController payOrder totalPrice: " + purchaseVO.getTotalPrice());
        System.out.println("받는사람 : " + purchaseVO.getReceiver());

        model.addAttribute("bookTitle", bookTitle);
        model.addAttribute("bookQuantity", bookQuantity);
        model.addAttribute("purchaseVO", purchaseVO);
        model.addAttribute("memberVO", memberVO);

        // 결제 성공시(PurchaseController payComplete()) 쓰일 세션 정보들
        httpSession.setAttribute("payMember" , memberVO);
        httpSession.setAttribute("payPurchase", purchaseVO);
        httpSession.setAttribute("bookTitle",bookTitle);
        httpSession.setAttribute("bookQuantity", bookQuantity);

        return "purchase/payOrder";
    }

    // 결제 성공시
    @RequestMapping("payComplete")
    public String payComplete() {
        MemberVO memberVO = (MemberVO)httpSession.getAttribute("payMember");
        memberVO.setTel((String)httpSession.getAttribute("memberTel"));
        PurchaseVO purchaseVO = (PurchaseVO)httpSession.getAttribute("payPurchase");

        // sql에 필요한 데이터들을 집어넣기위한 해쉬맵 생성
        Map purchaseMap = new HashMap();
        purchaseMap.put("orderNumber", 0);
        purchaseMap.put("memberTel", memberVO.getTel());
        purchaseMap.put("totalPrice",purchaseVO.getTotalPrice());
        purchaseMap.put("receiver", purchaseVO.getReceiver());

        purchaseService.insertPuchase(purchaseMap);

        return "purchase/payComplete";
    }


}
