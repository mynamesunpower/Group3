package service;

import model.vo.BookVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BookService {

    void insertBook(BookVO vo);
    void deleteBook(BookVO vo);
    void updateBook(BookVO vo);

    BookVO selectBook(BookVO vo);
    List<BookVO> bookList(BookVO vo);

    List<BookVO> searchBook(Map<String, Object> map);
}
