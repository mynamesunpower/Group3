package model.dao.impl;

import model.dao.dao.PurchaseDAO;
import model.vo.PurchaseBookVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository("purchaseDAO")
public class PurchaseDAOImpl implements PurchaseDAO {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public String insertPurchase(Map purchaseMap) {

        sqlSessionTemplate.insert("booktrain.purchase.insertPurchase", purchaseMap);
        // 동시에 purchase_Book 테이블에도 추가해주기

        //TODO 주문번호까지 동시에 뽑아옴 여기서부터 하기
        System.out.println("구매 DB 삽입완료 주문번호 : " + purchaseMap.get("orderNumber"));
        return String.valueOf(purchaseMap.get("orderNumber"));
    }

    @Override
    public void insertPurchaseBook(PurchaseBookVO purchaseBookVO) {
        sqlSessionTemplate.insert("booktrain.purchase.insertPurchaseBook", purchaseBookVO);
    }
}
