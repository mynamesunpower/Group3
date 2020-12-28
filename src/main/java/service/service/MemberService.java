package service.service;

import model.vo.MemberVO;
import model.vo.PurchaseVO;

import java.util.List;

public interface MemberService {
//    public MemberVO idCheck_Login(MemberVO vo);

    public int memberInsert(MemberVO vo );

    public MemberVO memberLogin(MemberVO vo );

    public int memberUpdate(MemberVO vo);


    public int idCheck(MemberVO vo);

    public int telCheck(MemberVO vo);

    public void updateMemberPoint(MemberVO memberVO);

    public List<PurchaseVO> memberOrderList(PurchaseVO purchaseVO);

    public int memberDelete(MemberVO membervo);

    public MemberVO memberIdFind(MemberVO membervo );

}
