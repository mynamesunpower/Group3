package service;

import model.vo.ShoppingCartVO;

import java.util.List;

public interface ShoppingCartService {

    public List selectCart(String memberTel);
    public void insertCart(String memberTel, long isbn);
    public void deleteCartList(String memberTel);
    public List deleteCart(String memberTel, long isbn);

}
