package service;

import model.dao.MemberDAO;
import model.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

    @Autowired
    MemberDAO memberDAO;

    @Override
    public MemberVO login(MemberVO memberVO) {

        return memberDAO.login(memberVO);
    }
}
