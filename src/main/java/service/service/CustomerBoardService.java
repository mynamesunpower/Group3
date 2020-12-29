package service.service;


import model.vo.CustomerBoardVO;

import java.util.List;


public interface CustomerBoardService {

    List<CustomerBoardVO> customerBoardList(CustomerBoardVO customerBoardvo);

    int customerBoardInsert(CustomerBoardVO customerBoardvo);

    CustomerBoardVO customerBoard(CustomerBoardVO customerBoardvo);

    int customerBoardReadCount(CustomerBoardVO customerBoardvo);

    int customerBoardUpdate(CustomerBoardVO customerBoardvo);//조회수증가

    int customerBoardDelete(CustomerBoardVO customerBoardvo);

    List<CustomerBoardVO> customerBoardSearch(CustomerBoardVO customerBoardvo);

}
