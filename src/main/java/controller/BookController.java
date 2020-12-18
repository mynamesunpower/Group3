package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookController {

    @RequestMapping("showBook.ing")
    public String showBook(){
        System.out.println("showBook.ing 요청");

        return "showBook";
    }
}
