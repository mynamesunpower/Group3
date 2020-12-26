package service;

import model.dao.MemberDAOImpl;
import model.vo.MemberVO;
import model.vo.PurchaseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

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
        public int memberUpdate(MemberVO vo){

                return memberDao.memberUpdate(vo);
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

