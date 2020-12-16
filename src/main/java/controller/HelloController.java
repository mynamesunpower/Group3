package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloController {

    @RequestMapping("/start.ing")
    public String test2(){
        System.out.println("start 요청");

        return "hello";
    }

}
