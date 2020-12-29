package controller;

import model.vo.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.impl.ReviewServiceImpl;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/review/")
public class ReviewController {

    @Autowired
    HttpSession httpSession;
    @Autowired
    ReviewServiceImpl reviewService;

    /**
     * 리뷰 쓰는 화면으로 이동
     * @param reviewVO : 해당 리뷰에 대한 isbn & orderNumber가 포함
     */
    @RequestMapping("writeReview.ing")
    public String writeReview(ReviewVO reviewVO, Model model){
        System.out.println("writeReview() 23line : " + reviewVO.getIsbn() + " / " + reviewVO.getOrderNumber());

        model.addAttribute("reviewVO", reviewVO);
        return "review/writeReview";
    }

    /**
     * 리뷰 등록 컨트롤러
     * @param reviewVO orderNumber,isbn,score,content 포함
     */
    @RequestMapping("registReview.ing")
    public String registReview(ReviewVO reviewVO,Model model){
        System.out.println("registReview() 오다넘버 : " + reviewVO.getOrderNumber());
        System.out.println("registReview() isbn : " + reviewVO.getIsbn());
        System.out.println("registReview() 별점확인 : " + reviewVO.getScore());
        System.out.println("registReview() 내용 : " + reviewVO.getContent());

        // TODO 디비에 내용 넣기
        reviewService.insertReview(reviewVO);
        System.out.println("리뷰 등록 완료");

        model.addAttribute("reviewVO", reviewVO);

        return "redirect:/viewBook.ing?isbn="+reviewVO.getIsbn();
    }

    /**
     * 리뷰 삭제 컨트롤러
     * @param reviewVO 해당 reviewNumber(pk)를 넘겨받아 삭제
     */
    @RequestMapping("deleteReview")
    public String deleteReview(ReviewVO reviewVO){
        System.out.println("deleteReview() 리뷰번호 : " + reviewVO.getReviewNumber());

        reviewService.deleteReview(reviewVO);

        return  "redirect:/viewBook.ing?isbn="+reviewVO.getIsbn();
    }
}