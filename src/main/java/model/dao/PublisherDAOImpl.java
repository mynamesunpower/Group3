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

    @Override
    public int insertPublisher(PublisherVO publisherVO) {
        return sqlSessionTemplate.insert("booktrain.publisher.insertPublisher", publisherVO);
    }

    @Override
    public List<PublisherVO> listPublisher(PublisherVO publisherVO) {
        return sqlSessionTemplate.selectList("booktrain.publisher.listPublisher", publisherVO);
    }

    @Override
    public int deletePublisher(PublisherVO publisherVO) {
        return sqlSessionTemplate.delete("booktrain.publisher.deletePublisher", publisherVO);
    }

    @Override
    public int modifyPublisher(PublisherVO publisherVO) {
        return sqlSessionTemplate.update("booktrain.publisher.modifyPublisher", publisherVO);
    }

    @Override
    public PublisherVO viewPublisher(PublisherVO publisherVO) {
        return sqlSessionTemplate.selectOne("booktrain.publisher.viewPublisher", publisherVO);
    }
}
