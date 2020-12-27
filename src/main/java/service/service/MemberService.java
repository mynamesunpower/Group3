package service.service;

import model.vo.MemberVO;

public interface MemberService {
//    public MemberVO idCheck_Login(MemberVO vo);

    public int memberInsert(MemberVO vo );

    public MemberVO memberlogin(MemberVO vo );


    void memberupdate(MemberVO vo);

    public int idCheck(MemberVO vo);

    public int telCheck(MemberVO vo);

    public void memberupdate(MemberVO vo);

    public void updateMemberPoint(MemberVO memberVO);

}
