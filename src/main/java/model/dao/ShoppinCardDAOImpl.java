package model.dao;

import model.vo.ShoppingCartVO;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Repository("shoppingCardDAO")
public class ShoppinCardDAOImpl implements ShoppingCartDAO{

    @Override
    public List<ShoppingCartVO> selectCart(ShoppingCartVO shoppingCartVO) {
        return null;
    }

    @Override
    public void insertCart(ShoppingCartVO shoppingCartVO) {

    }

    @Override
    public void deleteCart(ShoppingCartVO shoppingCartVO) {

    }
}
