package controller;

import model.dao.dao.MemberDAO;
import model.vo.MemberVO;
import model.vo.PurchaseVO;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.mail.javamail.JavaMailSender;
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
    //JavaMailSender mailSender;  //이메일관련.

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
    public void hello() {
        System.out.println("hello이동하나요????????");
    }//end hello*/


    @RequestMapping("/logout.ing")
    public String logout(HttpSession session) {
        System.out.println("로그아웃페이지로 이동~~~~");
//            session.removeAttribute("memberName");
        session.invalidate();
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
    public String updateok(MemberVO vo, Model m) {
        System.out.println("회원정보수정 완료페이지~~");
        int result = memberService.memberUpdate(vo);

        String msgUpdate = vo.getName() + " 님 회원정보가 수정되엇습니다~~~~";
        if (result > 0) {
            msgUpdate = vo.getName() + " 님 회원정보가 수정되엇습니다~~~~다시 로그인해주세요~~~~";
        } else {
            msgUpdate = vo.getName() + " 님 회원정보가 수정되지 않았습니다. 다시 시도해주세요.";
        }
        m.addAttribute("msgupdate", msgUpdate);
        return "/updateok";

    }//end  회원정보수정


    @RequestMapping("/memberlogin.ing")
    public String memberlogin(MemberVO vo, HttpSession session) {
        MemberVO result = memberService.memberLogin(vo);

        if (result == null) {
            System.out.println("로그인실패~~~~~");
            return "redirect:/login.ing";

        } else {
            System.out.println("로그인성공~~~~~~");
            session.setAttribute("memberId", result.getId());
            session.setAttribute("memberName", result.getName());
            session.setAttribute("memberPassword", result.getPassword());
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


    @RequestMapping(value = "/orderList.ing")
    public void orderlist(PurchaseVO purchaseVO, Model model) {
        System.out.println("주문확인페이지입니다.");
        model.addAttribute("memberOrderList", memberService.memberOrderList(purchaseVO));
//        return "/orderList";
    }

    @RequestMapping(value = "/memberDelete.ing")
    public String memberDelete(MemberVO membervo, HttpSession session) {
        System.out.println("회원탈퇴하겟습니다.");
        int result = memberService.memberDelete(membervo);
        session.invalidate();
        return "/hello";
    }

    @RequestMapping(value = "/memberIdFind.ing")
    public String memberIdFind(MemberVO membervo) {

        System.out.println("아이디찾기 페이지로로 이동");
        return "/memberIdFind";
    }

    @RequestMapping(value = "/memberIdFindOk.ing")
    public String memberIdFindOk(MemberVO membervo, HttpSession session) {
        System.out.println("아이디찾기성공 페이지로로 이동");

        MemberVO result = memberService.memberIdFind(membervo);

        if (result == null) {
            System.out.println("전화번호를 입력실패");
            return "/memberIdFindNo";
        } else {
            System.out.println("전화번호입력성공");
            session.setAttribute("memberId", result.getId());
            return "/memberIdFindOk";
        }
    }

    @RequestMapping(value = "/memberPassFind.ing")
    public String memberPassFind() {
        return "/memberPassFind";
    }

    @RequestMapping(value = "/customerCenter.ing")
    public String cutomerCenter() {

        System.out.println("고객센터페이지이동.");

        return "/customerCenter";
    }

    @RequestMapping(value = "/customerBoard.ing")
    public String cutomerBoard() {

        System.out.println("고객문의게시판이동.");

        return "/customerBoard";
    }

//
//    //    회원 이메일보내기
//    @RequestMapping(value = "/memberPassFind.ing")
//    public ModelAndView memberPassFind(MemberVO membervo, HttpServletRequest request, String e_mail, HttpServletResponse response_email) throws IOException {
//        System.out.println("비밀번호찾기 페이지로 이동");
//        Random r = new Random();
//        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
//
//
//        String setfrom = "final9594@gmail.com";
//        String tomail = request.getParameter("email"); // 받는 사람 이메일
//        String todomain = request.getParameter("domain");
//
//        String title = "비밀번호변경 인증 이메일 입니다."; // 제목
//        String content =
//
//                        System.getProperty("line.separator") + //한줄씩 줄간격을 두기위해 작성
//                        System.getProperty("line.separator") +
//                        "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
//
//                        + System.getProperty("line.separator") +
//                        System.getProperty("line.separator") +
//                        " 인증번호는 " + dice + " 입니다. "
//                        + System.getProperty("line.separator") +
//                        System.getProperty("line.separator") +
//                        "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
//
//        try {
//            MimeMessage message = mailSender.createMimeMessage();
//            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
//                    true, "UTF-8");
//
//            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
//            messageHelper.setTo(tomail+todomain); // 받는사람 이메일
//            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
//            messageHelper.setText(content); // 메일 내용
//
//            mailSender.send(message);
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//        ModelAndView mv = new ModelAndView();
//        mv.setViewName("/memberPassFindOk");     //뷰의이름
//        mv.addObject("dice", dice);
//
//        return mv;
//    }
//    //이메일 인증 페이지 맵핑 메소드
//    @RequestMapping("/memberPassFind.ing")
//    public String email() {
//        return "/memberPassFind";
//    }
//    //이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
//    //내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
//    //틀리면 다시 원래 페이지로 돌아오는 메소드
//    @RequestMapping(value = "/join_injeung.ing{dice}", method = RequestMethod.POST)
//    public ModelAndView join_injeung(String email_injeung, @PathVariable String dice, HttpServletResponse response_equals) throws IOException {
//
//        System.out.println("마지막 : email_injeung : " + email_injeung);
//
//        System.out.println("마지막 : dice : " + dice);
//        //페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음
//
//        ModelAndView mv = new ModelAndView();
//
//        mv.setViewName("/member/join.do");
//
//        mv.addObject("e_mail", email_injeung);
//
//        if (email_injeung.equals(dice)) {
//
//            //인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함
//            mv.setViewName("member/join");
//            mv.addObject("e_mail", email_injeung);
//            //만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
//            //한번더 입력할 필요가 없게 한다.
//
//            response_equals.setContentType("text/html; charset=UTF-8");
//            PrintWriter out_equals = response_equals.getWriter();
//            out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
//            out_equals.flush();
//            return mv;
//
//        } else if (email_injeung != dice) {
//
//            ModelAndView mv2 = new ModelAndView();
//
//            mv2.setViewName("member/email_injeung");
//
//            response_equals.setContentType("text/html; charset=UTF-8");
//            PrintWriter out_equals = response_equals.getWriter();
//            out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
//            out_equals.flush();
//            return mv2;
//        }
//        return mv;
//    }
}//end MemberController
