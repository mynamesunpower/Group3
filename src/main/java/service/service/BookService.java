package service.service;

import model.vo.BookVO;
import model.vo.SalesDataVO;

import java.math.BigDecimal;
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
    List<BookVO> hotBook();
    HashMap<Integer,Integer> salesList();
    HashMap<Integer,Integer> ageList();
    HashMap<Integer,Integer> twentypriceList();
    HashMap<Integer,Integer> daychart();

}
