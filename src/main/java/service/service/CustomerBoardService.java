package service.service;


import model.vo.CustomerBoardPagingVO;
import model.vo.CustomerBoardVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public interface CustomerBoardService {

    List<CustomerBoardVO> customerBoardList(CustomerBoardVO customerBoardvo);

    int customerBoardInsert(CustomerBoardVO customerBoardvo);

    CustomerBoardVO customerBoard(CustomerBoardVO customerBoardvo);

    int customerBoardReadCount(CustomerBoardVO customerBoardvo);

    int customerBoardUpdate(CustomerBoardVO customerBoardvo);//조회수증가

    int customerBoardDelete(CustomerBoardVO customerBoardvo);

    List<CustomerBoardVO> customerBoardSearch(CustomerBoardVO customerBoardvo);

    int customerBoardReply(CustomerBoardVO customerBoardvo);//답글 아이디증가

    List<Map> selectPagingList(CustomerBoardPagingVO pagingVO);

    HashMap selectPagingListCount(CustomerBoardPagingVO pagingVO);
}
