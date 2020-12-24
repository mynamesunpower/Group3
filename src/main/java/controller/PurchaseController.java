package controller;

import model.vo.ShoppingCartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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


    // 주문 하기
    @RequestMapping("/orderBook.ing")
    public String orderBook(ShoppingCartVO shoppingCartVO, Model model){
        // cartList.jsp로부터 isbn을 넘겨 받음
        System.out.println("PurchaseContoller orderBook() isbn : " + shoppingCartVO.getIsbn());

        shoppingCartVO.setTel((String)httpSession.getAttribute("memberTel"));
        List cart = shoppingCartService.selectCart(shoppingCartVO);
        model.addAttribute("cart",cart);
        return "purchase/orderBook";
    }

    // 주문 결제
    @RequestMapping("/payOrder.ing")
    public String payOrder(){

        return "purchase/payOrder";
    }
}
