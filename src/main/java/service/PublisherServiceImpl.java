package service;

import model.dao.PublisherDAO;
import model.vo.PublisherVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("publisherService")
public class PublisherServiceImpl implements PublisherService{

    @Autowired
    private PublisherDAO publisherDAO;

    @Override
    public int insertPublisher(PublisherVO publisherVO) {
        System.out.println("publisherService.insertPublisher(vo) -> DAO로 넘깁니다");
        return publisherDAO.insertPublisher(publisherVO);
    }

    @Override
    public List<PublisherVO> listPublisher(PublisherVO publisherVO) {
        return publisherDAO.listPublisher(publisherVO);
    }
}
