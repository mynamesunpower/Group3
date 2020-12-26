package service.impl;

import model.dao.impl.MemberDAOImpl;
import model.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.service.MemberService;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDAOImpl memberDao;

    @Override
    public int memberInsert(MemberVO vo) {
        return memberDao.memberInsert(vo);
    }

    @Override
    public MemberVO memberlogin(MemberVO vo) {
        return memberDao.memberlogin(vo);
    }

    @Override
    public void memberupdate(MemberVO vo) {
        memberDao.memberupdate(vo);
    }

    @Override
    public void updateMemberPoint(MemberVO memberVO) {
        memberDao.updateMemberPoint(memberVO);
    }
}
