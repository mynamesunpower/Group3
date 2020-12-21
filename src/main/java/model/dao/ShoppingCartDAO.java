package model.dao;

import model.vo.ShoppingCartVO;

import java.util.List;

public interface ShoppingCartDAO {

    public List<ShoppingCartVO> selectCart(ShoppingCartVO shoppingCartVO);
    public void insertCart(ShoppingCartVO shoppingCartVO);
    public void deleteCart(ShoppingCartVO shoppingCartVO);
}
