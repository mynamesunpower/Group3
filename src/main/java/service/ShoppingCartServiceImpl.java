package service;

import model.dao.ShoppingCartDAOImpl;
import model.vo.BookVO;
import model.vo.ShoppingCartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service("shoppingCartService")
public class ShoppingCartServiceImpl implements ShoppingCartService {

    @Autowired
    ShoppingCartDAOImpl shoppingCartDAO;

    @Override
    public List selectCart(String memberTel) {
        return shoppingCartDAO.selectCart(memberTel);
    }

    @Override
    public void insertCart(String memberTel,long isbn) {
        shoppingCartDAO.insertCart(memberTel,isbn);
    }

    @Override
    public void deleteCart(ShoppingCartVO shoppingCartVO) {

    }
}
