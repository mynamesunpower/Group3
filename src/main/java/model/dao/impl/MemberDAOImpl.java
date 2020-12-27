package model.dao.impl;

import model.dao.dao.MemberDAO;
import model.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("memberDao")
public class MemberDAOImpl implements MemberDAO {

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

    public void memberupdate(MemberVO vo){
        System.out.println("===>  MemberMapper memberlogin() 호출");
        mybatis.update("member.memberupdate", vo );
    }

    @Override
    public int idCheck(MemberVO vo) {
        System.out.println("dao ID 체크 ->" + vo.getId());
        int result = mybatis.selectList("member.idCheck", vo).size();
        System.out.println(result);
        return result;
    }

    @Override
    public int telCheck(MemberVO vo) {
        System.out.println("DAO tel 체크 ->" + vo.getTel());
        return mybatis.selectList("member.telCheck", vo).size();
    }
}