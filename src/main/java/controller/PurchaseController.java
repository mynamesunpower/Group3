package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * 상품 주문 컨트롤러
 */
@Controller
@RequestMapping("/purchase/")
public class PurchaseController {

    @Autowired
    HttpSession httpSession;



    // 주문 하기
    @RequestMapping("/orderBook.ing")
    public String orderBook(){
        System.out.println("PurchaseContoller orderBook()");

        return "purchase/orderBook";
    }

    // 주문 결제
    @RequestMapping("/payOrder.ing")
    public String payOrder(){

        return "purchase/payOrder";
    }
}
