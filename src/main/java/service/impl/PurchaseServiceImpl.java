package service.impl;

import model.dao.dao.PurchaseDAO;
import model.dao.impl.PurchaseDAOImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.service.PurchaseService;

import java.util.Map;

@Service("purchaseService")
public class PurchaseServiceImpl implements PurchaseService {

    @Autowired
    PurchaseDAOImpl purchaseDAO;

    @Override
    public void insertPuchase(Map purchaseMap) {
        purchaseDAO.insertPuchase(purchaseMap);
    }
}
