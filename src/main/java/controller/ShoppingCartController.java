package controller;

import model.vo.BookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.ShoppingCartService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
public class ShoppingCartController {

    @Autowired
    ShoppingCartService shoppingCartService;


    @RequestMapping("addCart.ing")
    public String addCart(HttpServletRequest request, HttpSession httpSession){ // HttpServletRequest -> 뷰에서 요청을 받음
        String strIsbn =request.getParameter("isbn");
        long isbn = Long.parseLong(strIsbn);

        shoppingCartService.insertCart((String)httpSession.getAttribute("memberTel"),isbn);

        return "redirect:cartList.ing";
    }

    @RequestMapping("cartList.ing")
    public String cartList(HttpSession httpSession, Model model){
        List cart = shoppingCartService.selectCart((String)httpSession.getAttribute("memberTel"));
        System.out.println("cart() 리스트 사이즈 : " + cart.size());

        for(Object result : cart){
            System.out.println(result);
        }

        model.addAttribute("cart",cart);
        return "cart/cartList";
    }
}
