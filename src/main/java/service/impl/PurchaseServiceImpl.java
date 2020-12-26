package service.impl;

import model.dao.dao.PurchaseDAO;
import model.dao.impl.PurchaseDAOImpl;
import model.vo.PurchaseBookVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.service.PurchaseService;

import java.util.Map;

@Service("purchaseService")
public class PurchaseServiceImpl implements PurchaseService {

    @Autowired
    PurchaseDAOImpl purchaseDAO;

    @Override
    public String insertPurchase(Map purchaseMap) {
        return purchaseDAO.insertPurchase(purchaseMap);
    }

    @Override
    public void insertPurchaseBook(PurchaseBookVO purchaseBookVO) {
        purchaseDAO.insertPurchaseBook(purchaseBookVO);
    }
}
