package model.dao.dao;

import model.vo.BookVO;
import model.vo.SalesDataVO;

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

    List<Map<String, String>> getGenreSalesList();

    public List carouselBook();
     List<BookVO> bestBook();
     List<BookVO> hotBook();

}
