package service;


import model.dao.BookDAOImpl;
import model.vo.BookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookDAOImpl bookdao;

    //도서등록
    @Override
    public void insertBook(BookVO vo) {

        bookdao.insertBook(vo);
    }

    //선택한 책 정보 불러오기
    @Override
    public BookVO selectBook(BookVO vo) {

        return bookdao.selectBook(vo);
    }


    //도서 정보 삭제
    @Override
    public void deleteBook(BookVO vo) {
        bookdao.deleteBook(vo);
    }

    //도서 정보 수정
    @Override
    public void updateBook(BookVO vo) {
        bookdao.updateBook(vo);
    }

    //등록된 도서 리스트 불러오기
    @Override
    public List<BookVO> bookList(BookVO vo) {

        return bookdao.bookList(vo);
    }

    @Override
    public List<BookVO> searchBook(HashMap map) {

        return bookdao.searchBook(map);
    }
}
