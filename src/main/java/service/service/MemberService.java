package service.service;

import model.vo.MemberVO;
import model.vo.PurchaseVO;

import java.util.List;

public interface MemberService {
//    public MemberVO idCheck_Login(MemberVO vo);

    public int memberInsert(MemberVO vo );

    public MemberVO memberLogin(MemberVO vo );

    public int memberUpdate(MemberVO vo);


    public void memberupdate(MemberVO vo);

    public void updateMemberPoint(MemberVO memberVO);
}

