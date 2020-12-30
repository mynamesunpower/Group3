package service.service;

import model.vo.ShoppingCartVO;

import java.util.List;

public interface ShoppingCartService {

    public List<ShoppingCartVO> selectCart(ShoppingCartVO shoppingCartVO);
    public void insertCart(String memberTel, String isbn);
    public void modifyCart(ShoppingCartVO shoppingCartVO);
    public void deleteCartList(String memberTel);
    public void deleteCart(String memberTel, String isbn);

}
