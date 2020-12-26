package service.service;

import model.vo.MemberVO;

public interface MemberService {
//    public MemberVO idCheck_Login(MemberVO vo);

    public int memberInsert(MemberVO vo );

    public MemberVO memberlogin(MemberVO vo );

    public void memberupdate(MemberVO vo);

    public void updateMemberPoint(MemberVO memberVO);
}

