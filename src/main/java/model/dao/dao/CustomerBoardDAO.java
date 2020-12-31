package model.dao.dao;

import model.vo.CustomerBoardPagingVO;
import model.vo.CustomerBoardVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface CustomerBoardDAO {

    List<CustomerBoardVO> customerBoardList(CustomerBoardVO customerBoardvo);

    int customerBoardInsert(CustomerBoardVO customerBoardvo);

    CustomerBoardVO customerBoard(CustomerBoardVO customerBoardvo);

    int customerBoardReadCount(CustomerBoardVO customerBoardvo);

    int customerBoardUpdate(CustomerBoardVO customerBoardvo);

    int customerBoardDelete(CustomerBoardVO customerBoardvo);

    List<CustomerBoardVO> customerBoardSearch(CustomerBoardVO customerBoardvo);

    int customerBoardReply(CustomerBoardVO customerBoardvo);

    List<Map> selectPagingList(CustomerBoardPagingVO pagingVO);

    HashMap selectPagingListCount(CustomerBoardPagingVO pagingVO);
}