package model.dao.impl;
import model.dao.dao.PurchaseDAO;
import model.vo.PurchaseBookVO;
import model.vo.PurchaseVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;
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
    public void usePoint(PurchaseVO purchaseVO) {
        sqlSessionTemplate.update("booktrain.purchase.usePoint", purchaseVO);
    }

    @Override
    public void insertPurchaseBook(PurchaseBookVO purchaseBookVO) {
        sqlSessionTemplate.insert("booktrain.purchase.insertPurchaseBook", purchaseBookVO);
        if(sqlSessionTemplate.selectOne("booktrain.purchase.selectSalesData",purchaseBookVO) == null){
            System.out.println("insertPurchaseBook() salesData 정보가 없음" +  purchaseBookVO.getIsbn());
            sqlSessionTemplate.insert("booktrain.purchase.insertSalesData", purchaseBookVO);
        }else{
            System.out.println("insertPurchaseBook() salesData 정보가 있음" + purchaseBookVO.getIsbn());
            sqlSessionTemplate.update("booktrain.purchase.updateSalesData", purchaseBookVO);
        }
    }
    @Override
    public List<String> selectOrderNumber(PurchaseVO purchaseVO) {
        return sqlSessionTemplate.selectList("booktrain.purchase.selectOrderNumber",purchaseVO);
    }
    @Override
    public List<PurchaseVO> selectOrderList(PurchaseVO purchaseVO) {
        return sqlSessionTemplate.selectList("booktrain.purchase.selectOrderList", purchaseVO);
    }
    @Override
    public PurchaseVO purchaseInfo(PurchaseVO purchaseVO) {
        return sqlSessionTemplate.selectOne("booktrain.purchase.purchaseInfo", purchaseVO);
    }
    @Override
    public List<PurchaseVO> selectDetailOrder(PurchaseVO purchaseVO) {
        return sqlSessionTemplate.selectList("booktrain.purchase.detailOrder", purchaseVO);
    }
    @Override
    public List<PurchaseBookVO> selectIsbn(PurchaseVO purchaseVO) {
        return sqlSessionTemplate.selectList("booktrain.purchase.selectIsbn", purchaseVO);
    }
    // 취소시 sales_data 테이블의 수량 및 총액 조절
    @Override
    public void cancel_salesData(PurchaseBookVO purchaseBookVO) {
        sqlSessionTemplate.update("booktrain.purchase.cancel_salesData", purchaseBookVO);
    }
    // 주문취소
    @Override
    public void cancelOrder(PurchaseVO purchaseVO) {
        // PURCHASE 테이블 state컬럼 주문취소로 변경
        sqlSessionTemplate.update("booktrain.purchase.cancelOrder_purchase",purchaseVO);
        sqlSessionTemplate.update("booktrain.purchase.cancelPoint",purchaseVO);
        // PURCHASE_BOOK 테이블 해당 주문번호 컬럼 삭제
        sqlSessionTemplate.delete("booktrain.purchase.cancelOrder_purchaseBook",purchaseVO);
    }
    @Override
    public void insertCancelBook(PurchaseBookVO purchaseBookVO) {
        sqlSessionTemplate.insert("booktrain.purchase.insertCancelBook",purchaseBookVO);
    }
}