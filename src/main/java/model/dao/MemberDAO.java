package model.dao;

import model.vo.MemberVO;
import model.vo.PurchaseVO;

import java.util.List;

public interface MemberDAO {

    int memberInsert(MemberVO vo);

    int memberupdate(MemberVO vo);

    MemberVO memberlogin(MemberVO vo);

    List<PurchaseVO> memberOrderList(PurchaseVO purchaseVO);

    int memberDelete(MemberVO membervo);

    MemberVO memberIdCheck(MemberVO membervo);

}

