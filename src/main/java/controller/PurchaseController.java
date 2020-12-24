package controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import model.vo.MemberVO;
import model.vo.PurchaseVO;
import model.vo.ShoppingCartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.ShoppingCartService;

import javax.servlet.http.HttpSession;
import java.util.List;

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

    // 상품 주문
    @RequestMapping("/orderBook.ing")
    public String orderBook(ShoppingCartVO shoppingCartVO, Model model) {
        // cartList.jsp로부터 isbn을 넘겨 받음
        System.out.println("PurchaseContoller orderBook() isbn : " + shoppingCartVO.getIsbn());

        shoppingCartVO.setTel((String) httpSession.getAttribute("memberTel"));
        List cart = shoppingCartService.selectCart(shoppingCartVO);
        model.addAttribute("cart", cart);
        return "purchase/orderBook";
    }

    // TODO 아침에 일어나자마자 할것
    @RequestMapping("/orderBooks.ing")
    public String orderBooks(String isbn, Model model) {
        System.out.println("PurchaseController orderBooks() 시발 : " + isbn);
        return "purchase/orderBook";
    }

    // 주문 결제
    @RequestMapping("/payOrder.ing")
    public String payOrder(PurchaseVO purchaseVO, MemberVO memberVO, Model model) {
        System.out.println("PurchaseController payOrder total: " + purchaseVO.getTotalPrice());
        System.out.println("PurchaseController payOrder Point: " + memberVO.getPoint());

        // 포인트를 로그인할때 세션으로 가져올까 아니면 디비쿼리를 훑을까

        model.addAttribute("purchaseVO", purchaseVO);
        model.addAttribute("memberVO", memberVO);


        return "purchase/payOrder";
    }


}
