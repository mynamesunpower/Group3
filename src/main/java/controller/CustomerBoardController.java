package controller;

import model.vo.CustomerBoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import service.service.CustomerBoardService;

@Controller
public class CustomerBoardController {

    @Autowired
    private CustomerBoardService customerBoardService;

    @RequestMapping(value = "/customerBoardList.ing")
    public String customerBoard(CustomerBoardVO customerBoardvo, Model model) {

        System.out.println("고객문의게시판이동.");
        model.addAttribute("customerBoardList", customerBoardService.customerBoardList(customerBoardvo));
        return "/customerBoardList";
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


}
