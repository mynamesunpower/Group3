package model.dao.impl;

import model.dao.dao.CustomerBoardDAO;
import model.vo.CustomerBoardVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustomerBoardDAOImpl implements CustomerBoardDAO {

    @Autowired
    private SqlSessionTemplate mybatis;

    @Override
    public List<CustomerBoardVO> customerBoardList(CustomerBoardVO customerBoardvo) {
        return mybatis.selectList("customerBoard.customerBoardList", customerBoardvo);
    }

    @Override
    public int customerBoardInsert(CustomerBoardVO customerBoardvo) {
        return mybatis.insert("customerBoard.customerBoardInsert", customerBoardvo);
    }//고객센터게시판 글쓰기.

    @Override
    public CustomerBoardVO customerBoard(CustomerBoardVO customerBoardvo) {
        return mybatis.selectOne("customerBoard.customerBoard", customerBoardvo);
    }
}
