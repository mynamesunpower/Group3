package controller;

import model.vo.BookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.impl.BookServiceImpl;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
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
        model.addAttribute("carouselBook",bookService.carouselBook());
        model.addAttribute("bestBook",bookService.bestBook());
        List<BookVO> bookkey = bookService.bookTab();
        model.addAttribute("booktap",bookkey);



        if(session.getAttribute("memberJumin1") !=null){
            String genre = "age";
            model.addAttribute("hotBook",bookService.memberBook(session,genre));
            genre = "genre";
            model.addAttribute("genrehotBook",bookService.memberBook(session,genre));

            String jumin1 = (String) session.getAttribute("memberJumin1");
            String jumin2 = (String) session.getAttribute("memberJumin2");
            String ju1 = jumin1.substring(0,2);
            String ju2 = jumin2.substring(0,1);
            int j1 = Integer.parseInt(ju1);
            int j2 = Integer.parseInt(ju2);

            SimpleDateFormat format = new SimpleDateFormat ( "yyyy");
            Date time = new Date();
            String time1 = format.format(time);
            int time2 = Integer.parseInt(time1);

            if(j2==1 || j2==2){
                int j3 = j1+1900;
                int ages= time2 - j3 +1;
                System.out.println("고객의 나이:"+ages);
                if( ages>=10 && ages<=19){
                    String myage= "10대";
                    model.addAttribute("age",myage);
                }else if( ages>=20 && ages<=29){
                    String myage= "20대";
                    model.addAttribute("age",myage);
                }else if(ages>=30 && ages<=39){
                    String myage= "30대";
                    model.addAttribute("age",myage);
                }else if(ages>=40 && ages<=49){
                    String myage= "40대";
                    model.addAttribute("age",myage);
                }else {
                    String myage= "나의 연령대";
                    model.addAttribute("age",myage);
                }
            }else {
                int j3 = j1 + 2000;
                int ages = time2 - j3 + 1;
                System.out.println("고객의 나이:" + ages);
                if (ages >= 10 && ages <= 19) {
                    String myage= "10대";
                    model.addAttribute("age",myage);
                } else if (ages >= 20 && ages <= 29) {
                    String myage= "20대";
                    model.addAttribute("age",myage);
                } else if (ages >= 30 && ages <= 39) {
                    String myage= "30대";
                    model.addAttribute("age",myage);
                } else if (ages >= 40 && ages <= 49) {
                    String myage= "40대";
                    model.addAttribute("age",myage);
                } else {
                    String myage= "나의 연령대";
                    model.addAttribute("age",myage);
                }
            }
        }else {
            String myage= "30대";
            model.addAttribute("age",myage);
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
