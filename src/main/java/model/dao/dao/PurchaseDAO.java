package model.dao.dao;

import model.vo.PurchaseBookVO;

import java.util.Map;

public interface PurchaseDAO {

    public String insertPurchase(Map purchaseMap);

    public void insertPurchaseBook(PurchaseBookVO purchaseBookVO);

}
