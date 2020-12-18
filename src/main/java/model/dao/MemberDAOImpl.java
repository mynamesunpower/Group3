package model.dao;

import model.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {

    @Autowired
    SqlSessionTemplate mybatis;

    @Override
    public MemberVO login(MemberVO memberVO) {
        System.out.println("MemberDaoImpl login메소드 실행");
        return mybatis.selectOne("member.login",memberVO);
    }
}
