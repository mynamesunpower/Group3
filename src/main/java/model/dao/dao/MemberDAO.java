package model.dao.dao;

import model.vo.MemberVO;
import model.vo.PurchaseVO;

import java.util.List;

public interface MemberDAO {

    int memberInsert(MemberVO vo);

    int memberUpdate(MemberVO vo);

    MemberVO memberLogin(MemberVO vo);

    List<PurchaseVO> memberOrderList(PurchaseVO purchaseVO);

    int memberDelete(MemberVO membervo);

    MemberVO memberIdFind(MemberVO membervo);

    void memberupdate(MemberVO vo);

    public void updateMemberPoint(MemberVO memberVO);

}

