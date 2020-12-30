package controller;

import model.vo.CustomerBoardPagingVO;
import model.vo.CustomerBoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import service.service.CustomerBoardService;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/customerBoard")
public class CustomerBoardController {

    @Autowired
    private CustomerBoardService customerBoardService;

    // Q&A 페이지로 이동
    @RequestMapping(value = "/customerCenter.ing")
    public String cutomerCenter() {
        return "customerBoard/customerCenter";
    }

    @RequestMapping(value = "/customerBoardList.ing")
    public String customerBoardList(CustomerBoardPagingVO pagingVO, ModelMap model, HttpServletRequest request) {
        List<Map> pagingList = customerBoardService.selectPagingList(pagingVO);
        String parsePage = request.getParameter("page");
        if (parsePage == null) parsePage = "1";

        long initPage = Long.parseLong(parsePage);
        pagingVO.setPage(initPage);

        HashMap pagingListCount = customerBoardService.selectPagingListCount(pagingVO);

        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("total", pagingListCount.get("totalPage"));
        resultMap.put("page", pagingVO.getPage());
        resultMap.put("pageScale", pagingVO.getPageScale());

        int pageGroup = (int)Math.ceil((double)pagingVO.getPage()/pagingVO.getPageScale());
        long startPage = (pageGroup - 1) * pagingVO.getPageScale() + 1;
        pagingVO.setStartPage(startPage);

        long endPage = startPage + pagingVO.getPageScale() - 1;
        pagingVO.setEndPage(endPage);

        long previousPage = (pageGroup - 2) * pagingVO.getPageScale() + 1;
        long nextPage = pageGroup * pagingVO.getPageScale() + 1;
        resultMap.put("startPage", pagingVO.getStartPage());
        resultMap.put("endPage", pagingVO.getEndPage());
        resultMap.put("nextPage", nextPage);
        resultMap.put("previousPage", previousPage);
        resultMap.put("pageGroup", pageGroup);

        model.addAttribute("pagingList", pagingList);
        model.addAttribute("resultMap", resultMap);
        return "customerBoard/customerBoardList";
    } //고객문의 게시판으로 이동.

    @RequestMapping(value = "/customerBoardSearch.ing")
    public String customerBoardSearch(CustomerBoardVO customerBoardvo, Model model, HttpServletRequest request) {
        model.addAttribute("customerBoardSearch", customerBoardService.customerBoardSearch(customerBoardvo));
        return "customerBoard/customerBoardSearch";
    }//고객문의 게시판으로 이동.


    @RequestMapping(value = "/customerBoardInsert.ing")
    public String customerBoardInsert(CustomerBoardVO customerBoardvo){
        System.out.println("글등록하는 페이지 이동");
        return "customerBoard/customerBoardInsert";
    }//end customerBoardInsert   글등록 입력하는 페이지

    @RequestMapping(value = "/customerBoardInsertOk.ing")
    public String customerBoardOk(CustomerBoardVO customerBoardvo) {
        System.out.println("글등록한 후 페이지 이동");

        int result = customerBoardService.customerBoardInsert(customerBoardvo);
        if (result > 0) {
            System.out.println("글 등록이 성공했습니다.");
        }
        return "customerBoard/customerBoardInsertOk";
    }//end customerBoardOk 글등록하고 완료햇다는 페이지

    @RequestMapping("/customerBoard.ing")
        public String customerBoard(CustomerBoardVO customerBoardvo , Model model){
        System.out.println("글 제목눌러서 들어가는 페이지 이동");
        model.addAttribute("customerBoard",customerBoardService.customerBoard(customerBoardvo));

        int result = customerBoardService.customerBoardReadCount(customerBoardvo);  //조회수증가

        return "customerBoard/customerBoard";
    }//end customerBoard 글제목 눌러서들어가는

    @RequestMapping("/customerBoardUpdate.ing")
    public String customerBoardUpdate(CustomerBoardVO customerBoardvo, HttpServletRequest request){
        System.out.println("글수정페이지로 이동");
        return "customerBoard/customerBoardUpdate";
    }//글수정 페이지로 이동

    @RequestMapping("/customerBoardUpdateOk.ing")
    public String customerBoardUpdateOk(CustomerBoardVO customerBoardvo,HttpServletRequest request){
        int result = customerBoardService.customerBoardUpdate(customerBoardvo);
        System.out.println("업데이트 됫나???"+result);
        return "customerBoard/customerBoardUpdateOk";
    }//글수정완료 버튼누르면 작동

    @RequestMapping("/customerBoardDelete.ing")
    public String customerBoardDelete(CustomerBoardVO customerBoardvo){
        int result = customerBoardService.customerBoardDelete(customerBoardvo);

        return "customerBoard/customerBoardDelete";
    }//글수정 페이지로 이동


    @RequestMapping("/customerBoardReply.ing")
    public String customerBoardReply(CustomerBoardVO customerBoardvo){
//        customerBoardvo.setOriginId(Integer.parseInt(request.getParameter("originId")));
        System.out.println("답글페이지로 이동");
        return "customerBoard/customerBoardReply";
    }//글수정 페이지로 이동

    @RequestMapping("/customerBoardReplyOk.ing")
    public String customerBoardReplyOk(CustomerBoardVO customerBoardvo,HttpServletRequest request){
//        int result = customerBoardService.customerBoardInsert(customerBoardvo);
        System.out.println("답글등록");
        customerBoardvo.setOriginId(Integer.parseInt(request.getParameter("originId")));
        int reply = customerBoardService.customerBoardReply(customerBoardvo);
        return "customerBoard/customerBoardReplyOk";
    }//답글달기.


}
