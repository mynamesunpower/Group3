package model.dao;

import model.vo.ShoppingCartVO;

import java.util.HashMap;
import java.util.List;

public interface ShoppingCartDAO {

    public List selectCart(String memberTel);
    public void insertCart(String memberTel, long isbn);
    public void deleteCartList(String memberTel);
    public void deleteCart(String memberTel, long isbn);
}
