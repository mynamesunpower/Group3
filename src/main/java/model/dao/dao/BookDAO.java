package model.dao.dao;

import model.vo.BookVO;
import model.vo.PurchaseBookVO;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BookDAO {


    public void insertBook(BookVO vo);


    //public void modifyBook(BookVO vo) ;

     void deleteBook(BookVO vo);

     void updateBook(BookVO vo);

    void deleteBook_stock(PurchaseBookVO purchaseBookVO);

    void cancelBook_stock(PurchaseBookVO purchaseBookVO);


    BookVO selectBook(BookVO vo);


    public List<BookVO> bookList(BookVO vo);

    public List<BookVO> genrebookList(String genre);

    List<BookVO> searchBook(Map map);

    List<Map<String, Object>> getGenreSalesList();
    HashMap<Integer,Integer> salesList();



     List carouselBook();
     List<BookVO> bestBook();
     List<BookVO> hotBook( String genre);
     HashMap<Integer,Integer> ageList();
     HashMap<Integer,Integer> twentypriceList();
     HashMap<Integer, Integer> teenageList(String age);
     HashMap<Integer, Integer> daychart();

     //베스트 도서 리스트
     List<BookVO> bestbookList();

     //출간순서 도서 리스트
     List<BookVO> newbookList();

     //동적 책 장르별 탭
     List<BookVO> bookTab();
     List<BookVO> memberBook(HttpSession session,String genre);

}
