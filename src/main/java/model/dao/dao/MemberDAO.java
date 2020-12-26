package model.dao.dao;

import model.vo.MemberVO;

public interface MemberDAO {

    int memberInsert(MemberVO vo);

    MemberVO memberlogin(MemberVO vo);

    void memberupdate(MemberVO vo);

    public void updateMemberPoint(MemberVO memberVO);
}
