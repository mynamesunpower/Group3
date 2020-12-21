package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import service.MemberService;

    @Controller
    public class MemberController {

        @Autowired
        private MemberService memberService;

        @RequestMapping("/login.ing")//이거때문인가?
        public void test() {
            System.out.println("로그인 요청가나요??");
        }

}
