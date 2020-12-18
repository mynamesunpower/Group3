package service;

import model.vo.ShoppingCartVO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("shoppingCartService")
public class ShoppingCartServiceImpl implements ShoppingCartService {
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
