package model.dao.impl;

import model.dao.dao.BookDAO;
import model.vo.BookVO;

import org.apache.ibatis.annotations.Mapper;
import model.vo.SalesDataVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
import java.util.Set;

@Repository
public class BookDAOImpl implements BookDAO {

    @Autowired
    private SqlSessionTemplate mybatis;

    public BookDAOImpl() {
        super();
    }

    @Override
    public void insertBook(BookVO vo) {
        System.out.println("===> Mybatis insertBook() 호출");
        mybatis.insert("BookMapper.insertBook",vo);
    }

    @Override
    public void updateBook(BookVO vo) {
        System.out.printf("===Mybatis updateBook() 호출");
        mybatis.update("BookMapper.updateBook",vo);
   }

    @Override
    public void deleteBook(BookVO vo) {
        System.out.println("===> Mybatis deleteBook() 호출");
        mybatis.delete("BookMapper.deleteBook",vo);
    }

//    @Override
//    public void modifyBook(BookVO vo) {
//
//    }

    @Override
    public BookVO selectBook(BookVO vo) {
        System.out.println("===> Mybatis selectBook() 호출");
        return mybatis.selectOne("BookMapper.selectBook",vo);
    }

    @Override
    public List<BookVO> bookList(BookVO vo) {
        System.out.println("===> Mybatis bookList() 호출");
        return mybatis.selectList("BookMapper.bookList", vo);
    }

    @Override
    public List<BookVO> searchBook(Map map) {
        System.out.println("searchBookDao searchBook() : " + map.get("sbox"));
        return mybatis.selectList("BookMapper.searchBook",map);
    }

    @Override
    public List<Map<String, String>> getGenreSalesList() {
        List<Map<String, String>> list = mybatis.selectList("BookMapper.getGenreSalesList");

//        for (Map<String, String> map : list) {
//            System.out.println(map.get("GENRE"));
//            System.out.println(map.get("PRICE"));
//        }

        return list;
    }

    public List<BookVO> genrebookList(String genre) {
        System.out.println("===> Mybatis genrebookList() 호출");
        return mybatis.selectList("BookMapper.genrebookList",genre);
    }

    @Override
    public List<BookVO> carouselBook() {
        System.out.println("===> Mybatis carouselBook() 호출");
        return mybatis.selectList("BookMapper.carouselBook");
    }

    @Override
    public List<BookVO> bestBook() {
        System.out.println("===> Mybatis bestBook() 호출");
        return mybatis.selectList("BookMapper.bestBook");
    }

    @Override
    public List<BookVO> hotBook() {
        System.out.println("===> Mybatis hotBook() 호출");
        return mybatis.selectList("BookMapper.hotBook");
    }
}
