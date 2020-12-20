package model.dao;

import model.vo.ShoppingCartVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository("shoppingCardDAO")
public class ShoppingCartDAOImpl implements ShoppingCartDAO{

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public List selectCart(String memberTel) {
        System.out.println("ShoppingCartDAOImpl selectCart()" + memberTel);

        return sqlSessionTemplate.selectList("booktrain.cart.cartList", memberTel);
    }

    @Override
    public void insertCart(String memberTel,long isbn) {
        System.out.println("ShoppingCartDAOImpl insertCart()" );

        Map cartMap = new HashMap<>();
        cartMap.put("memberTel",memberTel);
        cartMap.put("isbn",isbn);
        sqlSessionTemplate.insert("booktrain.cart.addCart",cartMap);
    }

    @Override
    public void deleteCart(ShoppingCartVO shoppingCartVO) {

    }
}
