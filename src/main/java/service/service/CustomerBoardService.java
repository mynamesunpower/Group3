package service.service;


import model.vo.CustomerBoardVO;

import java.util.List;


public interface CustomerBoardService {

    List<CustomerBoardVO> customerBoardList(CustomerBoardVO customerBoardvo);

    int customerBoardInsert(CustomerBoardVO customerBoardvo);

    CustomerBoardVO customerBoard(CustomerBoardVO customerBoardvo);
}
