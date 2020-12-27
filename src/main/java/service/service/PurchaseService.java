package service.service;

import model.vo.PurchaseBookVO;

import java.util.Map;

public interface PurchaseService {
    public String insertPurchase(Map purchaseMap);

    public void insertPurchaseBook(PurchaseBookVO purchaseBookVO);
}
