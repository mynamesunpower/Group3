package model.dao;

import model.vo.PublisherVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("publisherDAO")
public class PublisherDAOImpl implements PublisherDAO {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public PublisherDAOImpl() {
        super();
    }

    @Override
    public int insertPublisher(PublisherVO publisherVO) {
        return sqlSessionTemplate.insert("booktrain.publisher.insertPublisher", publisherVO);
    }

    @Override
    public List<PublisherVO> listPublisher(PublisherVO publisherVO) {
        return sqlSessionTemplate.selectList("booktrain.publisher.listPublisher", publisherVO);
    }
}
