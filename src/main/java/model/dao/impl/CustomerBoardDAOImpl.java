package model.dao.impl;

import model.dao.dao.CustomerBoardDAO;
import model.vo.CustomerBoardPagingVO;
import model.vo.CustomerBoardVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CustomerBoardDAOImpl implements CustomerBoardDAO {

    @Autowired
    private SqlSessionTemplate mybatis;

    @Override
    public List<CustomerBoardVO> customerBoardList(CustomerBoardVO customerBoardvo) {
        return mybatis.selectList("customerBoard.customerBoardList", customerBoardvo);
    }//고객게시판 리스트 불러오기

    @Override
    public int customerBoardInsert(CustomerBoardVO customerBoardvo) {
        return mybatis.insert("customerBoard.customerBoardInsert", customerBoardvo);
    }//고객센터게시판 글쓰기.

    @Override
    public CustomerBoardVO customerBoard(CustomerBoardVO customerBoardvo) {
        CustomerBoardVO vo = mybatis.selectOne("customerBoard.customerBoard", customerBoardvo);
        return vo;
    }

    @Override
    public int customerBoardUpdate(CustomerBoardVO customerBoardvo) {
        return mybatis.update("customerBoard.customerBoardUpdate", customerBoardvo);
    }

    @Override
    public int customerBoardReadCount(CustomerBoardVO customerBoardvo) {
        return mybatis.update("customerBoard.customerBoardReadCount", customerBoardvo);
    }//조회수증가

    @Override
    public int customerBoardDelete(CustomerBoardVO customerBoardvo) {
        return mybatis.delete("customerBoard.customerBoardDelete", customerBoardvo);
    }//고객게시판 글 삭제.

    @Override
    public List<CustomerBoardVO> customerBoardSearch(CustomerBoardVO customerBoardvo){
        return mybatis.selectList("customerBoard.customerBoardSearch", customerBoardvo);
    }

    @Override
    public int customerBoardReply(CustomerBoardVO customerBoardvo) {
        return mybatis.update("customerBoard.customerBoardReply",customerBoardvo);
    }

    @Override
    public List<Map> selectPagingList(CustomerBoardPagingVO pagingVO) {
        return mybatis.selectList("customerBoard.selectPagingList", pagingVO);
    }

    @Override
    public HashMap selectPagingListCount(CustomerBoardPagingVO pagingVO) {
        return (HashMap) mybatis.selectMap("selectPagingListCount", pagingVO, "pagingVO");
    }
}
