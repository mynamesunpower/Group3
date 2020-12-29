package controller;

import model.vo.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.impl.ReviewServiceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

        return "review/registReview";
    }

    @RequestMapping("seeReview.ing")
    public String seeReview(ReviewVO reviewVO, Model model){
        System.out.println("seeReview() 오다넘버 : " + reviewVO.getOrderNumber());
        System.out.println("seeReview() isbn : " + reviewVO.getIsbn());

        List<ReviewVO> reviewList = reviewService.seeReview(reviewVO);
        for(ReviewVO list : reviewList){
            System.out.println("seeReview() name: " + list.getMemberVO().getName());
            System.out.println("seeReview() content : " + list.getContent());
            System.out.println("seeReview() writingTime : " + list.getWritingTime());
            System.out.println("seeReview() score: " + list.getScore());
        }

        Map ratingOptions = new HashMap();
        ratingOptions.put(0, "☆☆☆☆☆");
        ratingOptions.put(1, "★☆☆☆☆");
        ratingOptions.put(2, "★★☆☆☆");
        ratingOptions.put(3, "★★★☆☆");
        ratingOptions.put(4, "★★★★☆");
        ratingOptions.put(5, "★★★★★");

        model.addAttribute("ratingOptions", ratingOptions);
        model.addAttribute("reviewList", reviewList);

        return "review/seeReview";
    }
}
