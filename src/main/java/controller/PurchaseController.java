package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/purchase/")
public class PurchaseController {

    // 주문 하기
    @RequestMapping("/orderBook.ing")
    public String orderBook(){

        return "purchase/orderBook";
    }

    // 주문 결제
    @RequestMapping("/payOrder.ing")
    public String payOrder(){

        return "purchase/payOrder";
    }
}
