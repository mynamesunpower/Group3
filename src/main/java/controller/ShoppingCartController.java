package controller;

import model.vo.ShoppingCartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.ShoppingCartService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 장바구니 Controller
 */
@Controller
@RequestMapping("/cart/")
public class ShoppingCartController {

    @Autowired
    ShoppingCartService shoppingCartService;

    //TODO isbn db에 number라 long 처리한거 나중에 varchar2로 바꾸면 타입에 맞게 변수 변경할것!

    // 장바구니에 상품 추가
    @RequestMapping("addCart.ing")
    public String addCart(HttpServletRequest request, HttpSession httpSession){ // HttpServletRequest -> 뷰에서 요청을 받음
        String strIsbn =request.getParameter("isbn");
        long isbn = Long.parseLong(strIsbn);

        shoppingCartService.insertCart((String)httpSession.getAttribute("memberTel"),isbn);

        return "redirect:cartList.ing";
    }

    // 장바구니 목록 불러오기
    @RequestMapping("cartList.ing")
    public String cartList(HttpSession httpSession, Model model){
        List cart = shoppingCartService.selectCart((String)httpSession.getAttribute("memberTel"));

        model.addAttribute("cart",cart);
        return "cart/cartList";
    }

    // 장바구니 전체삭제제
   @RequestMapping("deleteCartList.ing")
    public String deleteCartList(HttpSession httpSession){
        shoppingCartService.deleteCartList((String)httpSession.getAttribute("memberTel"));

        return "redirect:../start.ing";
    }

    // 특정 상품 삭제
    @RequestMapping(value = "deleteBook.ing", produces = "application/text;charset=utf-8")
    @ResponseBody // AJAX 처리를 해주는 어노테이션
    public String deleteBook(ShoppingCartVO shoppingCartVO,HttpSession httpSession,Model model){
        System.out.println("deleteBook() 49Line" +  shoppingCartVO.getIsbn() );
        shoppingCartService.deleteCart((String)httpSession.getAttribute("memberTel"),shoppingCartVO.getIsbn());

        return "";
    }

}
