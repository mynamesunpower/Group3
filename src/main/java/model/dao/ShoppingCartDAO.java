package model.dao;

import model.vo.ShoppingCartVO;

import java.util.HashMap;
import java.util.List;

public interface ShoppingCartDAO {

    public List selectCart(ShoppingCartVO shoppingCartVO);
    public void insertCart(String memberTel, long isbn);
    public void modifyCart(ShoppingCartVO shoppingCartVO);
    public void deleteCartList(String memberTel);
    public void deleteCart(String memberTel, long isbn);
}
