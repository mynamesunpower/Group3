package service.service;

import model.vo.BookVO;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BookService {

    void insertBook(BookVO vo);
    void deleteBook(BookVO vo);
    void updateBook(BookVO vo);
    BookVO selectBook(BookVO vo);
    List<BookVO> bookList(BookVO vo);
    List<BookVO> genrebookList(String genre);
    List<BookVO> searchBook(Map map);
    List<Map<String, Object>> getGenreList();
    List<BookVO> carouselBook();
    List<BookVO> bestBook();
    List<BookVO> hotBook(String genre);
    HashMap<Integer,Integer> salesList();
    HashMap<Integer,Integer> ageList();
    HashMap<Integer,Integer> twentypriceList();
    HashMap<Integer,Integer> teenageList(String age);
    HashMap<Integer,Integer> daychart();
    List<BookVO> bestbookList();
    List<BookVO> newbookList();
    List<BookVO> bookTab();
    List<BookVO> memberBook(HttpSession session,String genre);
}
