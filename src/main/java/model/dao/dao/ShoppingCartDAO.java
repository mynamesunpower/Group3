package model.dao.dao;

import model.vo.ShoppingCartVO;

import java.util.HashMap;
import java.util.List;

public interface ShoppingCartDAO {

    public List<ShoppingCartVO> selectCart(ShoppingCartVO shoppingCartVO);
    public void insertCart(String memberTel, String isbn);
    public void modifyCart(ShoppingCartVO shoppingCartVO);
    public void deleteCartList(String memberTel);
    public void deleteCart(String memberTel, String isbn);
}
