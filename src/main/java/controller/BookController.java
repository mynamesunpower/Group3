package controller;

import model.vo.BookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import service.BookServiceImpl;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

@Controller
public class BookController {

    @Autowired
    private BookServiceImpl bookService;

    @RequestMapping("showBook.ing")
    public String showBook(HttpServletRequest request, Model model) {
        model.addAttribute("isbn", request.getParameter("isbn"));   // 선택한 책에 맞는 isbn 넘겨줌
        return "showBook";
    }

    @RequestMapping("/searchBook.ing")

    public String searchBook(String keyword,
                             @RequestParam(defaultValue = "false") String sbox,
                             Model model) {
        HashMap map = new HashMap<>();

        map.put("find", keyword);

        if (!sbox.equals("false")) {
            System.out.println("sbox " + sbox);
            map.put("sbox", sbox);
        } else {
            System.out.println("sbox null");
            map.put("sbox", null);
        }

        List<BookVO> bookList = bookService.searchBook(map);
        System.out.println(bookList.size());

        model.addAttribute("keyword", keyword);
        model.addAttribute("result", bookList.size());
        model.addAttribute("bookList", bookList);
        return "book/bookList";
    }

    //페이지 넘김
    @RequestMapping("/{ing}")
    public String ing(@PathVariable String ing) {
        System.out.println("BookController에서" +ing + "요청");
        return ing;
        //return "book/" + ing;
    }

    @RequestMapping("/insertBook.ing")
    public String insertBook(){
        return "book/insertBook";
    }

    //도서 입력 성공 페이지에서 도서목록보기
    @RequestMapping("/rbookList.ing")
    public String listBook() {
        System.out.println("listBook.ing 요청");
        return "redirect:bookList.ing";
    }

    // 도서입력
    @RequestMapping("/insertBook_success.ing")
    public String insertBook_success(BookVO vo) {
        System.out.println("insertBook_success.ing 요청");
        System.out.println(vo.getPublicationDate());
        bookService.insertBook(vo);
        System.out.println("성공");
        return "book/insertBook_success";
    }

    //도서 삭제하기
    @RequestMapping("/deleteBook_success.ing")
    public String deleteBook_success(BookVO vo) {
        System.out.println("deleteBook_success.ing 요청");
        bookService.deleteBook(vo);

        return "book/deleteBook_success";
    }

    //도서정보 수정하기
    @RequestMapping("/updateBook.ing")
    public String updateBook(BookVO vo) {
        System.out.printf("updateBook.ing");
        bookService.updateBook(vo);
        return "redirect:selectBook.ing?isbn=" + vo.getIsbn();
    }

    //도서 목록보기
    @RequestMapping("/bookList.ing")
    public String bookList(BookVO vo, Model model) {
        model.addAttribute("bookList", bookService.bookList(vo));
        return "book/bookList";
    }

    //선택한 ISBN의 도서정보 보기
    @RequestMapping("/selectBook.ing")
    public String selectBook(BookVO vo, Model model) {
        model.addAttribute("selectBook", bookService.selectBook(vo));
        return "book/selectBook";
    }

    @RequestMapping("/genrebookList.ing")
    public String genrebookList(HttpServletRequest request, Model model){
        model.addAttribute("bookList",bookService.genrebookList(request.getParameter("genre")));
        return  "book/bookList";
    }



}
