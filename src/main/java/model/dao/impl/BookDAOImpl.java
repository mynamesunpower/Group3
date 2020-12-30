package model.dao.impl;

import model.dao.dao.BookDAO;
import model.vo.BookVO;

import model.vo.PurchaseBookVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
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

    //월별 매출 리스트(총매출))
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
            j = j == null ? j = 0 : j;

            list2.put(i, j);
            list.remove("month"); // 맵 "month", 1 삭제

            //result[i-1]= j;

            //System.out.println("hashMap: "+ list);
            //System.out.println("hashMap2: "+ list2);
        }

//        List<Object> lists =
//        for(Object a : lists) {
//            System.out.println((Integer)a);
//        } 결과는 저렇게 나오는게 맞아??네


        return list2;
    }

    //연령별 매출(30대 매출)
    @Override
    public HashMap<Integer, Integer> ageList() {
        System.out.println("===> Mybatis ageList() 호출");

        HashMap<String, Integer> list = new HashMap<String, Integer>();
        HashMap<Integer, Integer> list2 = new HashMap<Integer, Integer>();
        for (int i = 1; i <= 12; i++) {
//            System.out.println("for문 시작");

            list.put("month", i); // 맵 "month", 1
            Integer j = mybatis.selectOne("BookMapper.ageList", list);

            j = j == null ? j = 0 : j;
            list2.put(i, j);
            list.remove("month"); // 맵 "month", 1 삭제

            //result[i-1]= j;

            //System.out.println("hashMap: " + list);
            //System.out.println("hashMap2: " + list2);
        }
            return list2;
        }
//지금 30대 매출이랑 장르하고 그래프 10대 40대 추가했는데 그래프가 안나와요
        //20대
    @Override
    public HashMap<Integer, Integer> twentypriceList() {
        HashMap<String,Integer> list = new HashMap<String, Integer>();
        HashMap<Integer,Integer> list2 = new HashMap<Integer, Integer>();

        for(int i=1; i<=12; i++){
            list.put("month",i);
            Integer j = mybatis.selectOne("BookMapper.twentypriceList",list);
            j = j == null ? j = 0 : j;
            list2.put(i,j);

        }

        return list2;
    }

    @Override
    public HashMap<Integer, Integer> teenageList(String age) {
        System.out.println("10대 40대 mybatis 시작 " + age);
        HashMap<String, Integer> list = new HashMap<String, Integer>();
        HashMap<Integer,Integer> list2 = new HashMap<Integer, Integer>();
        if(age =="1"){
            for(int i=1;i<=12;i++){
                System.out.println("10대 시작");
                list.put("month",i);
                list.put("age",1);
                Integer j = mybatis.selectOne("BookMapper.teenageList",list);
                System.out.println("10대 j :" + j);
                j = j == null ? 0 : j;
                list2.put(i,j);
            }
        }//아니구나 타입이 다른가.. Hashmap은 바깥에 있어도 되는거죠? 나 이거 코드 모르겠어 ㅋㅋㅋㅋ전화 가능하신가용ㅋㅇㅋ
        else if(age=="4"){

            for(int i=1;i<=12;i++){
                System.out.println("40대 시작");
                list.put("month",i);
                list.put("age",4);
                Integer j =mybatis.selectOne("BookMapper.teenageList",list);
                System.out.println("40대 j :" + j);
                j = j == null ? 0 : j;
                list2.put(i,j);
            }
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
    public List<BookVO> hotBook(String genre) {
        System.out.println("===> Mybatis hotBook() 호출");
        return mybatis.selectList("BookMapper.hotBook",genre);
    }

    @Override
    public List<BookVO> bestbookList() {
        return mybatis.selectList("BookMapper.bestbookList");
    }

    //출간일 순서 도서 리스트
    @Override
    public List<BookVO> newbookList() {
        return mybatis.selectList("BookMapper.newbookList");
    }

    //동적 장르별 도서 탭
    @Override
    public List<BookVO> bookTab() {
        return mybatis.selectList("BookMapper.bookTab");
    }

    //동적 메인 베스트북

    @Override
    public List<BookVO> memberBook(HttpSession session,String genre) {
        System.out.println("===> Mybatis memberBook() 호출");
        if(session.getAttribute("memberJumin1") != null){
            String jumin1 = (String) session.getAttribute("memberJumin1");
            String jumin2 = (String) session.getAttribute("memberJumin2");
            String ju1 = jumin1.substring(0,2);
            String ju2 = jumin2.substring(0,1);
            int j1 = Integer.parseInt(ju1);
            int j2 = Integer.parseInt(ju2);

            SimpleDateFormat format = new SimpleDateFormat ( "yyyy");
            Date time = new Date();
            String time1 = format.format(time);
            int time2 = Integer.parseInt(time1);

            HashMap<String,Integer> map = new HashMap<String, Integer>();
            if(j2==1 || j2==2){
                int j3 = j1+1900;
                int ages= time2 - j3 +1;
                System.out.println("고객의 나이:"+ages);
                if( ages>=10 && ages<=19){
                    map.put("member",10);
                }else if( ages>=20 && ages<=29){
                    map.put("member",20);
                }else if(ages>=30 && ages<=39){
                    map.put("member",30);
                }else if(ages>=40 && ages<=49){
                    map.put("member",40);
                }else {
                    map.put("member",99);
                }

                switch (genre) {
                    case "age":
                     map.put("genre",1);
                        System.out.println("age일떄:"+map.get("genre"));
                    break;
                    case "genre":
                        map.put("genre",2);
                        System.out.println("genre일떄:"+map.get("genre"));
                    break;
                    default: // 모두 해당이 안되는 경우
                             System.out.println("기타");
                             break;
                }

                return mybatis.selectList("BookMapper.memberBook",map);
            }else {
                int j3= j1+2000;
                int ages= time2 - j3 +1;
                System.out.println("고객의 나이:"+ages);
                if( ages>=10 && ages<=19){
                    map.put("member",10);
                }else if( ages>=20 && ages<=29){
                    map.put("member",20);
                }else if(ages>=30 && ages<=39){
                    map.put("member",30);
                }else if(ages>=40 && ages<=49){
                    map.put("member",40);
                }else {
                    map.put("member",99);
                }

                switch (genre) {
                    case "age":
                        map.put("genre",1);
                        System.out.println("age일떄:"+map.get("genre"));
                        break;
                    case "genre":
                        map.put("genre",2);
                        System.out.println("genre일떄:"+map.get("genre"));
                        break;
                    default: // 모두 해당이 안되는 경우
                        System.out.println("기타");
                        break;
                }

                return mybatis.selectList("BookMapper.memberBook",map);
            }
        }

        return mybatis.selectList("BookMapper.memberBook");
    }
}
