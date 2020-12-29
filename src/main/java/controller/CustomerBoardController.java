package controller;

import model.vo.CustomerBoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.service.CustomerBoardService;

import javax.servlet.http.HttpServletRequest;

@Controller
public class CustomerBoardController {

    @Autowired
    private CustomerBoardService customerBoardService;

    @RequestMapping(value = "/customerBoardList.ing")
    public String customerBoardList(CustomerBoardVO customerBoardvo, Model model) {
        model.addAttribute("customerBoardList", customerBoardService.customerBoardList(customerBoardvo));
        return "/customerBoardList";
    }//고객문의 게시판으로 이동.

    @RequestMapping(value = "/customerBoardSearch.ing")
    public String customerBoardSearch(CustomerBoardVO customerBoardvo, Model model, HttpServletRequest request) {
        model.addAttribute("customerBoardSearch", customerBoardService.customerBoardSearch(customerBoardvo));
        return "/customerBoardSearch";
    }//고객문의 게시판으로 이동.


    @RequestMapping(value = "/customerBoardInsert.ing")
    public String customerBoardInsert(CustomerBoardVO customerBoardvo){
        System.out.println("글등록하는 페이지 이동");
        return "/customerBoardInsert";
    }//end customerBoardInsert   글등록 입력하는 페이지

    @RequestMapping(value = "/customerBoardInsertOk.ing")
    public String customerBoardOk(CustomerBoardVO customerBoardvo) {
        System.out.println("글등록한 후 페이지 이동");

        int result = customerBoardService.customerBoardInsert(customerBoardvo);
        return "/customerBoardInsertOk";
    }//end customerBoardOk 글등록하고 완료햇다는 페이지

    @RequestMapping("/customerBoard.ing")
        public String customerBoard(CustomerBoardVO customerBoardvo , Model model, HttpServletRequest request){
        customerBoardvo.setArticleId(Integer.parseInt(request.getParameter("articleId")));
        System.out.println("글 제목눌러서 들어가는 페이지 이동");
        model.addAttribute("customerBoard",customerBoardService.customerBoard(customerBoardvo));

        int result = customerBoardService.customerBoardReadCount(customerBoardvo);  //조회수증가

        return "/customerBoard";
    }//end customerBoard 글제목 눌러서들어가는

    @RequestMapping("/customerBoardUpdate.ing")
    public String customerBoardUpdate(CustomerBoardVO customerBoardvo,HttpServletRequest request){
        customerBoardvo.setArticleId(Integer.parseInt(request.getParameter("articleId")));
        System.out.println("글수정페이지로 이동");
        return "/customerBoardUpdate";
    }//글수정 페이지로 이동

    @RequestMapping("/customerBoardUpdateOk.ing")
    public String customerBoardUpdateOk(CustomerBoardVO customerBoardvo){

//      ,HttpServletRequest request   customerBoardvo.setArticleId(Integer.parseInt(request.getParameter("articleId")));
        int result = customerBoardService.customerBoardUpdate(customerBoardvo);
        System.out.println("업데이트 됫나???"+result);
        return "/customerBoardUpdateOk";
    }//글수정완료 버튼누르면 작동

    @RequestMapping("/customerBoardDelete.ing")
    public String customerBoardDelete(CustomerBoardVO customerBoardvo){
        int result = customerBoardService.customerBoardDelete(customerBoardvo);

        return "/customerBoardDelete";
    }//글수정 페이지로 이동

}
