package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.impl.BookServiceImpl;

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

    //캐러셀 이미지 뽑기
    @RequestMapping("/start.ing")
    public String carousel(Model model){
        System.out.println("helloController에서 hello.ing 요청");
        model.addAttribute("carouselBook",bookService.carouselBook());
        model.addAttribute("bestBook",bookService.bestBook());
        model.addAttribute("hotBook",bookService.hotBook());
        System.out.println("best북 나와라");
        System.out.println(bookService.carouselBook().size());
        System.out.println(bookService.bestBook().size());

        return "hello";

    }

    @RequestMapping("/error.ing")
    public String error(){
        System.out.println("에러 발생");
        return "error";
    }

}
