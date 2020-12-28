package controller;

import model.vo.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.impl.ReviewServiceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/review/")
public class ReviewController {

    @Autowired
    HttpSession httpSession;
    @Autowired
    ReviewServiceImpl reviewService;

    @RequestMapping("writeReview.ing")
    public String writeReview(ReviewVO reviewVO, Model model){
        System.out.println("writeReview() 23line : " + reviewVO.getIsbn() + " / " + reviewVO.getOrderNumber());

        model.addAttribute("reviewVO", reviewVO);
        return "review/writeReview";
    }

    @RequestMapping("registReview.ing")
    public String registReview(ReviewVO reviewVO){
        System.out.println("registReview() 오다넘버 : " + reviewVO.getOrderNumber());
        System.out.println("registReview() isbn : " + reviewVO.getIsbn());
        System.out.println("registReview() 별점확인 : " + reviewVO.getScore());
        System.out.println("registReview() 내용 : " + reviewVO.getContent());

        // TODO 디비에 내용 넣기

        return "review/registReview";
    }
}
