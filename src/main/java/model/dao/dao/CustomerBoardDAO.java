package model.dao.dao;

import model.vo.CustomerBoardVO;

import java.util.List;

public interface CustomerBoardDAO {

    List<CustomerBoardVO> customerBoardList(CustomerBoardVO customerBoardvo);

    int customerBoardInsert(CustomerBoardVO customerBoardvo);

    CustomerBoardVO customerBoard(CustomerBoardVO customerBoardvo);

}