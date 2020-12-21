package controller;

import model.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import service.MemberService;

import javax.servlet.http.HttpSession;

@Controller
public class MemberController {

    @Autowired
    MemberService memberService;

    @RequestMapping("login.ing")
    public String login(){
        return "login";
    }
    @RequestMapping("doLogin.ing")
    public String doLogin(MemberVO memberVO, HttpSession session){

        MemberVO member = memberService.login(memberVO);
        if (member == null) {
            System.out.println("회원정보가 틀렸습니다");
            return "login";
        }else{
                session.setAttribute("name", member.getName());
                session.setAttribute("memberTel", member.getTel());
                return "redirect:start.ing";
        }

    }
}
