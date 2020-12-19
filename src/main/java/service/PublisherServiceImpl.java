package service;

import model.dao.PublisherDAO;
import model.dao.PublisherDAOImpl;
import model.vo.PublisherVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("publisherService")
public class PublisherServiceImpl implements PublisherService{

    @Autowired
    private PublisherDAO publisherDAO;

    @Override
    public PublisherVO viewPublisher(PublisherVO publisherVO) {
        return publisherDAO.viewPublisher(publisherVO);
    }

    @Override
    public int insertPublisher(PublisherVO publisherVO) {
        System.out.println("publisherService.insertPublisher(vo) -> DAO로 넘깁니다");
        return publisherDAO.insertPublisher(publisherVO);
    }

    @Override
    public List<PublisherVO> listPublisher(PublisherVO publisherVO) {
        return publisherDAO.listPublisher(publisherVO);
    }

    @Override
    public int deletePublisher(PublisherVO publisherVO) {
        return publisherDAO.deletePublisher(publisherVO);
    }

    @Override
    public int modifyPublisher(PublisherVO publisherVO) {
        return publisherDAO.modifyPublisher(publisherVO);
    }
}
