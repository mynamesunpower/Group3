package service;

import model.vo.BookVO;

import java.util.List;

public interface BookService {

    void insertBook(BookVO vo);
    void deleteBook(BookVO vo);
    void updateBook(BookVO vo);

    BookVO selectBook(BookVO vo);
    List<BookVO> bookList(BookVO vo);
}
