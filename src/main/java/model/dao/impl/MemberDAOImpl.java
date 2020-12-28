package model.dao.impl;

import model.dao.dao.MemberDAO;
import model.vo.MemberVO;
import model.vo.PurchaseVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("memberDao")

public class MemberDAOImpl implements MemberDAO {

    @Autowired
    private SqlSessionTemplate mybatis;

    @Override
    public int memberInsert(MemberVO vo) {
        System.out.println("===>  MemberMapper memberInsert() 호출");
        return mybatis.insert("member.memberJoin", vo);
    }

    @Override
    public MemberVO memberlogin(MemberVO vo){
        System.out.println("===>  MemberMapper memberlogin() 호출");
      return mybatis.selectOne("member.login", vo );
    }


    @Override
    public void memberupdate(MemberVO vo){
        System.out.println("===>  MemberMapper memberUpdate() 호출");
        mybatis.update("member.memberupdate", vo );
    }

    @Override
    public void updateMemberPoint(MemberVO memberVO) {
        mybatis.update("member.updateMemberPoint",memberVO);
        System.out.println("updateMemberPoint 적립완료 : " +  memberVO.getPoint());
    }

}
