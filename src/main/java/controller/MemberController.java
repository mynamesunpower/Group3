package controller;

import model.dao.dao.MemberDAO;
import model.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.service.MemberService;

import javax.servlet.http.HttpSession;

@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    @RequestMapping("/main.ing")
    public void main() {
        System.out.println("메인페이지 이동스");
    }//end  main이동

    @RequestMapping("/memberupdate.ing")
    public void update() {
        System.out.println("회원정보수정 페이지로 이동스");
    }//end  회원정보수정

    @RequestMapping("/login.ing")
    public String test() {
        System.out.println("로그인 요청가나요??");
        return "/login";
    }//end login

    @RequestMapping("/hello.ing")
    public void hello(){
        System.out.println("hello이동하나요????????");
    }//end hello


    @RequestMapping("/logout.ing")
        public String logout(HttpSession session) {
            System.out.println("로그아웃페이지로 이동~~~~");
            session.removeAttribute("name");
            return "/hello";
    }//end logout

    @RequestMapping("/memberjoin.ing")
    public String memberjoin() {
        System.out.println("회원가입페이지로 이동");
        return "/memberjoin";
    }//end memberlogin

    @RequestMapping("/userok.ing")
    public String userok(MemberVO vo, Model m, HttpSession session) {
        System.out.println("회원가입 성공페이지로 이동");
        int result = memberService.memberInsert(vo);

        String message = "제대로 된 정보를 입력해주세요";
        if (result > 0) {
            message = vo.getName() + " 님, Booktrain.ing에서 공부할 준비 되셨나요?";
        }
        memberlogin(vo, session);
        m.addAttribute("message", message);
        return "/userok";
    }//end userok

    @RequestMapping("idCheck.ing")
    @ResponseBody
    public String idCheck(MemberVO vo) {
        System.out.println("Controller ID 체크 ->" + vo.getId());
        int result = memberService.idCheck(vo);
        String message = "이미 사용중인 아이디입니다.";
        if (result == 0) {
            message = "사용 가능한 아이디입니다.";
        }
        return message;
    }

    @RequestMapping("telCheck.ing")
    @ResponseBody
    public String telCheck(MemberVO vo) {
        System.out.println("Controller TEL 체크 ->" + vo.getTel());
        int result = memberService.telCheck(vo);
        String message = "이미 사용 중인 전화번호입니다.";
        if (result == 0) {
            message = "사용 가능한 전화번호입니다.";
        }
        return message;
    }

    @RequestMapping("/updateok.ing")
    public String updateok(MemberVO vo){

        memberService.memberupdate(vo);

        System.out.println("회원정보수정 완료페이지~~");
        return "redirect:/start.ing";

    }//end  회원정보수정


    @RequestMapping("/memberlogin.ing")
    public String memberlogin(MemberVO vo, HttpSession session) {
        MemberVO result = memberService.memberlogin(vo);

        if (result == null) {
            System.out.println("로그인실패~~~~~");
            return "redirect:/login.ing";

        } else {
            System.out.println("로그인성공~~~~~~");
            session.setAttribute("memberId",result.getId());
            session.setAttribute("memberName", result.getName());
            session.setAttribute("memberTel", result.getTel());
            session.setAttribute("memberEmail", result.getEmail());
            session.setAttribute("domain", result.getDomain());
            session.setAttribute("memberAddr1", result.getAddr1());
            session.setAttribute("memberAddr2", result.getAddr2());
            session.setAttribute("memberAddr3", result.getAddr3());
            session.setAttribute("memberPoint", result.getPoint());
            return "redirect:/start.ing";
        }
    }//end memberlogin


}//end MemberController
