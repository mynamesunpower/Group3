package model.dao;

import model.vo.MemberVO;
import model.vo.PurchaseVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("memberDao")
public class MemberDAOImpl {

    @Autowired
    private SqlSessionTemplate mybatis;


    public int memberInsert(MemberVO vo) {
        System.out.println("===>  MemberMapper memberInsert() 호출");
        return mybatis.insert("member.memberjoin", vo);
    }

    public MemberVO memberlogin(MemberVO vo){
        System.out.println("===>  MemberMapper memberlogin() 호출");
      return mybatis.selectOne("member.login", vo );
    }

    public int memberupdate(MemberVO vo){
        System.out.println("===>  MemberMapper memberlogin() 호출");
        return mybatis.update("member.memberupdate", vo );
    }

    public List<PurchaseVO> memberOrderList(PurchaseVO purchaseVO){
        System.out.println("===>  MemberMapper memberOrderList() 호출");
        return mybatis.selectList("member.memberOrderList",purchaseVO);
    }

    public int memberDelete(MemberVO membervo){
        System.out.println("===>  MemberMapper memberDelete() 호출");
        return mybatis.delete("member.memberDelete",membervo);
    }

    public MemberVO memberIdCheck(MemberVO membervo){
        System.out.println("===>  MemberMapper memberIdCheck() 호출");
        return mybatis.selectOne("member.login", membervo );
    }

}
