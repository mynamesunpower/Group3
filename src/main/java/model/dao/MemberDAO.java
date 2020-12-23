package model.dao;

import model.vo.MemberVO;

public interface MemberDAO {

    int memberInsert(MemberVO vo);

    MemberVO memberlogin(MemberVO vo);

    int memberupdate(MemberVO vo);
}
