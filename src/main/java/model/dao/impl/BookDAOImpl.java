package model.dao.impl;

import model.dao.dao.BookDAO;
import model.vo.BookVO;

import model.vo.PurchaseBookVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public void deleteBook_stock(PurchaseBookVO purchaseBookVO) {
        System.out.println("BookDAO 재고 빼주기 완료");
        mybatis.update("BookMapper.deleteStock",purchaseBookVO);
    }

    @Override
    public void cancelBook_stock(PurchaseBookVO purchaseBookVO) {
        mybatis.update("BookMapper.cancelStock", purchaseBookVO);
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
    public List<Map<String, Object>> getGenreSalesList() {
        List<Map<String, Object>> list = mybatis.selectList("BookMapper.getGenreSalesList");

//        for (Map<String, String> map : list) {
//            System.out.println(map.get("GENRE"));
//            System.out.println(map.get("PRICE"));
//        }

        return list;
    }

    //월별 매출 리스트
    @Override
    public HashMap<Integer,Integer> salesList() {
        System.out.println("===> Mybatis salesList() 호출");
        //int[] result = new int[12];


        HashMap<String,Integer> list = new HashMap<String, Integer>();
        HashMap<Integer,Integer> list2 = new HashMap<Integer,Integer>();
        for(int i=1; i<=12; i++){
            System.out.println("for문 시작");

            list.put("month", i); // 맵 "month", 1
            Integer j = mybatis.selectOne("BookMapper.salesList",list);


            list2.put(i, j);
            list.remove("month"); // 맵 "month", 1 삭제

            //result[i-1]= j;

            System.out.println("hashMap: "+ list);
            System.out.println("hashMap2: "+ list2);
        }

//        List<Object> lists =
//        for(Object a : lists) {
//            System.out.println((Integer)a);
//        }


        return list2;
    }

    //연령별 매출
    @Override
    public HashMap<Integer, Integer> ageList() {
        System.out.println("===> Mybatis ageList() 호출");

        HashMap<String, Integer> list = new HashMap<String, Integer>();
        HashMap<Integer, Integer> list2 = new HashMap<Integer, Integer>();
        for (int i = 1; i <= 12; i++) {
            System.out.println("for문 시작");

            list.put("month", i); // 맵 "month", 1
            Integer j = mybatis.selectOne("BookMapper.ageList", list);


            list2.put(i, j);
            list.remove("month"); // 맵 "month", 1 삭제

            //result[i-1]= j;

            System.out.println("hashMap: " + list);
            System.out.println("hashMap2: " + list2);
        }
            return list2;
        }

        //20대
    @Override
    public HashMap<Integer, Integer> twentypriceList() {
        HashMap<String,Integer> list = new HashMap<String, Integer>();
        HashMap<Integer,Integer> list2 = new HashMap<Integer, Integer>();

        for(int i=1; i<=12; i++){
            list.put("month",i);
            Integer j = mybatis.selectOne("BookMapper.twentypriceList",list);
            list2.put(i,j);
        }

        return list2;
    }

    //최근 30일 매출
    @Override
    public HashMap<Integer, Integer> daychart() {
        System.out.println("=====>지금부터 mybatis daychart() 시작");
        HashMap<String,Integer> list = new HashMap<String, Integer>();
        HashMap<Integer,Integer> list2 = new HashMap<Integer, Integer>();

        for(int i=30; i>=0; i--){
            list.put("day",i);
            System.out.println(i);
            Integer j = mybatis.selectOne("BookMapper.daychart",list);
            list2.put(i,j);
        }

        System.out.println("=====>여기까지 mybatis daychart() 끝 리턴!");
        return list2;
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
