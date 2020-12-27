package service;

import model.vo.BookVO;
import model.vo.Sales_DateVO;

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

    List<BookVO> carouselBook();
    List<BookVO> bestBook();
    List<BookVO> hotBook();
}
