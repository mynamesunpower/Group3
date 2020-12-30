package service.impl;

import model.dao.impl.ShoppingCartDAOImpl;
import model.vo.ShoppingCartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.service.ShoppingCartService;

import java.util.List;

@Service("shoppingCartService")
public class ShoppingCartServiceImpl implements ShoppingCartService {

    @Autowired
    ShoppingCartDAOImpl shoppingCartDAO;

    @Override
    public List<ShoppingCartVO> selectCart(ShoppingCartVO shoppingCartVO) {
        return shoppingCartDAO.selectCart(shoppingCartVO);
    }

    @Override
    public void insertCart(String memberTel,String isbn) {
        shoppingCartDAO.insertCart(memberTel,isbn);
    }

    @Override
    public void modifyCart(ShoppingCartVO shoppingCartVO) {
        shoppingCartDAO.modifyCart(shoppingCartVO);
    }

    @Override
    public void deleteCartList(String memberTel) {
        shoppingCartDAO.deleteCartList(memberTel);
    }

    @Override
    public void deleteCart(String memberTel, String isbn) {
        shoppingCartDAO.deleteCart(memberTel,isbn);
    }
}
