package controller;

import model.vo.MemberVO;
import model.vo.PurchaseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.service.MemberService;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import java.util.Properties;

//import org.springframework.mail.javamail.JavaMailSender;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

    @Autowired
    private MemberService memberService;

    // 암호화 인코더
    @Autowired
    BCryptPasswordEncoder passwordEncoder;

    // 회원정보수정 페이지 이동
    @RequestMapping("/memberupdate.ing")
    public void update() {
        System.out.println("회원정보수정 페이지로 이동스");
    }//end  회원정보수정

    // 로그인 페이지로 이동
    @RequestMapping("/login.ing")
    public String test() {
        return "member/login";
    } // end login

    /// 작업해야할듯 로그아웃
    @RequestMapping("/logout.ing")
    public String logout(HttpSession session) {
        System.out.println(session.getAttribute("memberName") + "님 로그아웃");
        session.invalidate();
        return "redirect:/booktrain.ing";
    } //end logout

    // 회원가입 페이지 이동
    @RequestMapping("/memberjoin.ing")
    public String memberjoin() {
        return "member/memberjoin";
    }

    // 회원가입하기 form의 action
    @RequestMapping("/userok.ing")
    public String userok(MemberVO vo, Model m, HttpSession session) {

        // 유저 입력한 비밀번호
        String inputPassword = vo.getPassword();
        session.setAttribute("inputPassword", inputPassword);

        // 암호화해서 재지정
        String password = passwordEncoder.encode(inputPassword);
        vo.setPassword(password);

        // 회원가입
        int result = memberService.memberInsert(vo);

        String message = "제대로 된 정보를 입력해주세요";
        if (result > 0) {
            message = vo.getName() + " 님, Booktrain.ing에서 공부할 준비 되셨나요?";
        }


        memberlogin(vo, session);
        m.addAttribute("message", message);
        return "member/userok";
    } //end userok

    // focusout 아이디 중복확인 검증 (ajax)
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

    // focusout 전화번호 중복확인 검증 (ajax)
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

    // focusout/select 이메일 중복확인 검증 (ajax)
    @RequestMapping(value = "emailCheck.ing")
    @ResponseBody
    public String emailCheck(MemberVO vo) {

        int result = memberService.emailCheck(vo);

        String message = "이미 사용 중인 메일주소입니다.";
        if (result == 0) {
            message = "사용 가능한 메일주소입니다.";
        }
        return message;
    }

    // 회원 정보 수정 form action
    @RequestMapping("/updateok.ing")
    public String updateok(MemberVO vo, Model m) {
        System.out.println(vo.getId() + " / " + vo.getPassword() + " / "  + vo.getTel() + " / " + vo.getName());

        String inputPassword = vo.getPassword().split(",")[0];
        System.out.println(inputPassword);
        String password = passwordEncoder.encode(inputPassword);
        vo.setPassword(password);

        int result = memberService.memberUpdate(vo);

        String msgUpdate = "";
        if (result > 0) {
            msgUpdate = vo.getName() + " 님의 회원정보가 수정되었습니다.";
        } else {
            msgUpdate = vo.getName() + " 님의 회원정보가 수정되지 않았습니다.";
        }
        m.addAttribute("msgupdate", msgUpdate);
        return "member/updateok";

    }//end  회원정보수정

    // 로그인
    @RequestMapping("/memberlogin.ing")
    @ResponseBody
    public String memberlogin(MemberVO vo, HttpSession session) {

        // 유저가 입력한 비밀번호
        String inputPassword;

        // 일반적인 로그인 시도라면
        if (session.getAttribute("inputPassword") == null) {
            inputPassword = vo.getPassword();
        }
        else { // 회원가입 후 로그인 시도라면
            inputPassword = (String) session.getAttribute("inputPassword");
            session.removeAttribute("inputPassword");
        }


        // id로만 검색한 vo 객체 (비밀번호는 암호화되어있음)
        MemberVO result = memberService.memberLogin(vo);

        System.out.println(inputPassword + "/" + result.getPassword());
        // 비밀번호 검증
        boolean passwordMatch = passwordEncoder.matches(inputPassword, result.getPassword());

        String message = "성공";

        if (!passwordMatch) {
            message = "실패";
        }
        else {
            session.removeAttribute("memberName");

            session.setAttribute("memberId", result.getId());
            session.setAttribute("memberName", result.getName());
            session.setAttribute("memberPassword", result.getPassword());
            session.setAttribute("memberTel", result.getTel());
            session.setAttribute("memberJumin1", result.getJumin1());
            session.setAttribute("memberJumin2", result.getJumin2());
            session.setAttribute("memberEmail", result.getEmail());
            session.setAttribute("domain", result.getDomain());
            session.setAttribute("memberAddr1", result.getAddr1());
            session.setAttribute("memberAddr2", result.getAddr2());
            session.setAttribute("memberAddr3", result.getAddr3());
            session.setAttribute("memberPoint", result.getPoint());
            session.setAttribute("memberGrade", result.getGrade());
        }
        return message;
    } //end memberlogin

    // 주문 확인 페이지로 이동
    @RequestMapping(value = "/orderList.ing")
    public String orderlist(PurchaseVO purchaseVO, Model model) {
        model.addAttribute("memberOrderList", memberService.memberOrderList(purchaseVO));
        return "member/orderList";
    }

    @RequestMapping(value = "/memberDelete.ing")
    public String memberDelete(MemberVO membervo, HttpSession session) {
        System.out.println("회원탈퇴하겟습니다.");
        int result = memberService.memberDelete(membervo);
        String message = "회원탈퇴가 실패하였습니다.";
        if (result > 0) {
            message = "회원탈퇴가 되었습니다. 앞으로는 행복하세요.";
            session.invalidate();
        }

        return "redirect:/booktrain.ing";
    }

    // ID 찾기 페이지로 이동
    @RequestMapping(value = "/memberIdFind.ing")
    public String memberIdFind(MemberVO membervo) {

        System.out.println("아이디찾기 페이지로로 이동");
        return "member/memberIdFind";
    }

    // ID 찾기 -> JS에서 얼러트 창으로 띄워줌.
    @RequestMapping(value = "/memberIdFindOk.ing")
    @ResponseBody
    public String memberIdFindOk(MemberVO membervo, HttpSession session) {

        MemberVO result = memberService.memberIdFind(membervo);

        if (result == null) {
            return "실패";
        } else {
            session.setAttribute("memberId", result.getId());
            return result.getId();
        }
    }

    // 비밀번호 찾기 페이지로 이동
    @RequestMapping(value = "/memberPassFind.ing")
    public String memberPassFind(MemberVO memberVO) {
        return "member/memberPassFind";
    }

    // 비밀번호 찾기 -> 메일로 보내기
    @RequestMapping(value = "/memberPassFindOk.ing")
    @ResponseBody
    public String memberPassFindOK(MemberVO memberVO) {
        final String user = "bitter.lemonseed@gmail.com";
        final String pass = "java12345!";

        MemberVO member = memberService.memberPassFind(memberVO);
        String password = "";
        for (int i = 0; i < 12; i++) {
            password += (char) ((Math.random()*47) + 97);
        }

        // 암호화해서 재지정
        member.setPassword(passwordEncoder.encode(password));
        memberService.memberUpdate(member);

        String email = member.getEmail()+member.getDomain();
        System.out.println(email);

        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com"); // 이메일을 처리해줄 SMTP 서버
        prop.put("mail.smtp.port", 465); // 구글 465 // naver 587
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.ssl.enable", "true");
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator(){
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(user, pass);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress("admin@booktrain.ing"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            message.setSubject("[Booktrain.ing] " + member.getName() + " 회원님의 비밀번호");
            String mailTxt = "";
            mailTxt += "안녕하세요. \n";
            mailTxt += "Booktrain.ing 입니다. \n";
            mailTxt += member.getName() + " 회원님의 비밀번호는 \n";
            mailTxt += password + "로 초기화되었습니다. \n";
            mailTxt += "변경된 비밀번호로 로그인하시고, 새로운 비밀번호로 변경을 부탁드립니다. \n";
            mailTxt += "감사합니다. 즐거운 하루 되세요.\n";
            message.setText(mailTxt);

            Transport.send(message);
            System.out.println("메일을 성공적으로 보냈습니다.");
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("나의 패스워드: " + password);

        if (password == null) password = "실패";
        return password;
    }


}//end MemberController
