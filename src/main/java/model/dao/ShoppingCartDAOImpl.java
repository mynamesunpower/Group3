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

    Map cartMap;

    @Override
    public List selectCart(ShoppingCartVO shoppingCartVO) {
        System.out.println("ShoppingCartDAOImpl selectCart() vo" + shoppingCartVO.getTel());

        return sqlSessionTemplate.selectList("booktrain.cart.cartList", shoppingCartVO);
    }

    @Override
    public void insertCart(String memberTel,long isbn) {
        System.out.println("ShoppingCartDAOImpl insertCart()" + isbn );

        cartMap = new HashMap<>();
        cartMap.put("memberTel",memberTel);
        cartMap.put("isbn",isbn);

        if (sqlSessionTemplate.selectOne("booktrain.cart.isContainList", cartMap) != null) {   // 장바구니에 있다면 1개 추가
            //TODO 이미 있으면 사용자에게 이미 장바구니에 있다고 알려주면서 추가여부 띄워주기
            sqlSessionTemplate.update("booktrain.cart.plusCart", cartMap);
        }else{  // 기존에 상품이 카트에없으면 추가
            sqlSessionTemplate.insert("booktrain.cart.addCart",cartMap);
        }
    }

    @Override
    public void modifyCart(ShoppingCartVO shoppingCartVO) {

        // 수량이 0이되면 DB삭제 쿼리 실행
        if (shoppingCartVO.getQuantity() == 0) {
            cartMap = new HashMap();
            cartMap.put("memberTel", shoppingCartVO.getTel());
            cartMap.put("isbn",shoppingCartVO.getIsbn());
            sqlSessionTemplate.delete("booktrain.cart.deleteBook",cartMap);
        }else{
            sqlSessionTemplate.update("booktrain.cart.modifyCount", shoppingCartVO);
        }
    }

    @Override
    public void deleteCartList(String memberTel) {
        sqlSessionTemplate.delete("deleteCartList",memberTel);
    }

    @Override
    public void deleteCart(String memberTel, long isbn) {
        cartMap = new HashMap<>();
        cartMap.put("memberTel",memberTel);
        cartMap.put("isbn",isbn);
        sqlSessionTemplate.delete("booktrain.cart.deleteBook",cartMap);
    }
}
