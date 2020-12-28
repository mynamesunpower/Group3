package service.impl;

import model.dao.impl.MemberDAOImpl;
import model.vo.MemberVO;
import model.vo.PurchaseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.service.MemberService;

import java.util.List;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDAOImpl memberDao;

    @Override
    public int memberInsert(MemberVO vo) {
        return memberDao.memberInsert(vo);
    }

    @Override
    public MemberVO memberLogin(MemberVO vo) {
        return memberDao.memberLogin(vo);
    }

    @Override
    public int memberUpdate(MemberVO vo) {
        return memberDao.memberUpdate(vo);
    }

    @Override
    public int idCheck(MemberVO vo) {
        return memberDao.idCheck(vo);
    }

    @Override
    public int telCheck(MemberVO vo) {
        return memberDao.telCheck(vo);
    }

    @Override
    public void updateMemberPoint(MemberVO memberVO) {
        memberDao.updateMemberPoint(memberVO);
    }

    @Override
    public List<PurchaseVO> memberOrderList(PurchaseVO purchaseVO) {
        return memberDao.memberOrderList(purchaseVO);
    }

    public int memberDelete(MemberVO membervo){
        return  memberDao.memberDelete(membervo);
    }

    @Override
    public MemberVO memberIdFind(MemberVO membervo) {
        return memberDao.memberIdFind(membervo);
    }
}
