package model.dao.dao;

import model.vo.CustomerBoardVO;

import java.util.List;

public interface CustomerBoardDAO {

    List<CustomerBoardVO> customerBoardList(CustomerBoardVO customerBoardvo);

    int customerBoardInsert(CustomerBoardVO customerBoardvo);

    CustomerBoardVO customerBoard(CustomerBoardVO customerBoardvo);

    int customerBoardReadCount(CustomerBoardVO customerBoardvo);

    int customerBoardUpdate(CustomerBoardVO customerBoardvo);

    int customerBoardDelete(CustomerBoardVO customerBoardvo);

    List<CustomerBoardVO> customerBoardSearch(CustomerBoardVO customerBoardvo);
}