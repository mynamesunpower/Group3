package service.impl;

import model.dao.impl.CustomerBoardDAOImpl;
import model.vo.CustomerBoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.service.CustomerBoardService;

import java.util.List;

@Service
public class CustomerBoardServiceImpl implements CustomerBoardService {

    @Autowired
    private CustomerBoardDAOImpl customerBoardDao;

    @Override
    public List<CustomerBoardVO> customerBoardList(CustomerBoardVO customerBoardvo) {

        return customerBoardDao.customerBoardList(customerBoardvo);
    }

    @Override
     public int customerBoardInsert(CustomerBoardVO customerBoardvo) {

        return customerBoardDao.customerBoardInsert(customerBoardvo);
    }

    @Override
    public CustomerBoardVO customerBoard(CustomerBoardVO customerBoardvo) {
        return customerBoardDao.customerBoard(customerBoardvo);
    }//
}
