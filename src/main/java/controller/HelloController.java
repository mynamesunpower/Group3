package controller;

import model.vo.BookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.impl.BookServiceImpl;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HelloController {

    @Autowired
    private BookServiceImpl bookService;

//    @RequestMapping("/start2.ing")
//    public String test() {
//
//        System.out.println("start");
//        return "hello";
//    }

    //메인페이지 책 이미지 뽑기
    //메인에 넘기기
    @RequestMapping("/start.ing")
    public String carousel(HttpSession session, Model model){
        System.out.println("helloController에서 hello.ing 요청");
        if(session == null){
            session.setAttribute("memberName","nonMember");
            session.setAttribute("memberTel","nonMember");
        }
        System.out.println("carousel() 회원이름 : " + session.getAttribute("memberName"));
        model.addAttribute("carouselBook",bookService.carouselBook());
        model.addAttribute("bestBook",bookService.bestBook());
        List<BookVO> bookkey = bookService.bookTab();
        model.addAttribute("booktap",bookkey);

        if(session.getAttribute("memberJumin1") !=null){
            String genre = "age";
            model.addAttribute("hotBook",bookService.memberBook(session,genre));
            genre = "genre";
            model.addAttribute("genrehotBook",bookService.memberBook(session,genre));
        }else {
            String genre = "age";
            model.addAttribute("hotBook",bookService.hotBook(genre));
            genre = "genre";
            model.addAttribute("genrehotBook",bookService.hotBook(genre));
        }


        return "hello";
    }

    @RequestMapping("/error.ing")
    public String error(){
        System.out.println("에러 발생");
        return "error";
    }

}
