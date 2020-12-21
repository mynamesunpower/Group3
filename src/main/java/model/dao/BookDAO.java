package model.dao;

import model.vo.BookVO;

import java.util.List;

public interface BookDAO {

   public void insertBook(BookVO vo);

    //public void modifyBook(BookVO vo) ;

    public void deleteBook(BookVO vo);

    public void updateBook(BookVO vo);

    public BookVO selectBook(BookVO vo);

    public List<BookVO> bookList(BookVO  vo) ;

    List<BookVO> searchBook(String keyword);
}
