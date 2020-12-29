package model.dao.dao;

import model.vo.BookVO;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BookDAO {

   public void insertBook(BookVO vo);

    //public void modifyBook(BookVO vo) ;

    public void deleteBook(BookVO vo);

    public void updateBook(BookVO vo);

    public BookVO selectBook(BookVO vo);

    public List<BookVO> bookList(BookVO  vo) ;


    public List<BookVO> genrebookList(String genre) ;
    List<BookVO> searchBook(Map map);

    List<Map<String, Object>> getGenreSalesList();
    HashMap<Integer,Integer> salesList();

    public List carouselBook();
     List<BookVO> bestBook();
     List<BookVO> hotBook(String genre);
 HashMap<Integer,Integer> ageList();
 HashMap<Integer,Integer> twentypriceList();
 HashMap<Integer, Integer> teenageList(String age);
 HashMap<Integer, Integer> daychart();
}
