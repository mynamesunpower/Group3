package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloController {

    @RequestMapping("/start.ing")
    public String test() {
        System.out.println("start");
        return "hello";
    }

    @RequestMapping("/error.ing")
    public String error(){
        System.out.println("에러 발생");
        return "error";
    }

}
