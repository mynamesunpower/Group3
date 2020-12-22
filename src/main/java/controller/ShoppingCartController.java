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
 * TODO isbn db에 number라 long 처리한거 나중에 varchar2로 바꾸면 타입에 맞게 변수 변경할것!
 * 장바구니 Controller
 */
@Controller
@RequestMapping("/cart/")
public class ShoppingCartController {

    @Autowired
    ShoppingCartService shoppingCartService;
    @Autowired
    HttpSession httpSession;

    // 장바구니 목록 불러오기
    @RequestMapping("cartList.ing")
    public String cartList(Model model) {
        String memberTel = (String) httpSession.getAttribute("memberTel");

        if (memberTel != null) {
            List cart = shoppingCartService.selectCart((String) httpSession.getAttribute("memberTel"));
            model.addAttribute("cart", cart);
            return "cart/cartList";
        } else {
            model.addAttribute("alert", "로그인을 해주세요");
            return "redirect:../start.ing";
        }
    }

    // 장바구니에 상품 추가
    @RequestMapping("addCart.ing")
    public String addCart(HttpServletRequest request) { // HttpServletRequest -> 뷰에서 요청을 받음
        String strIsbn = request.getParameter("isbn");
        long isbn = Long.parseLong(strIsbn);

        shoppingCartService.insertCart((String) httpSession.getAttribute("memberTel"), isbn);

        return "redirect:/cart/cartList.ing";
    }

    // 장바구니 상품 수량 변경
    @RequestMapping("modifyCart.ing")
//    @ResponseBody
    public String modifyCart(ShoppingCartVO shoppingCartVO) {
        shoppingCartVO.setTel((String) httpSession.getAttribute("memberTel"));
        shoppingCartService.modifyCart(shoppingCartVO);

        return "redirect:/cart/cartList.ing";
    }

    // 장바구니 전체삭제
    @RequestMapping("deleteCartList.ing")
    public String deleteCartList() {
        shoppingCartService.deleteCartList((String) httpSession.getAttribute("memberTel"));

        return "redirect:../start.ing";
    }

    // 특정 상품 삭제
    @RequestMapping(value = "deleteBook.ing", produces = "application/text;charset=utf-8")
    public String deleteBook(ShoppingCartVO shoppingCartVO) {
        shoppingCartService.deleteCart((String) httpSession.getAttribute("memberTel"), shoppingCartVO.getIsbn());

        return "redirect:/cart/cartList.ing";
    }

}
