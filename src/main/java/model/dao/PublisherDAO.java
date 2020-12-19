package model.dao;

import model.vo.PublisherVO;

import java.util.List;

public interface PublisherDAO {
    public int insertPublisher(PublisherVO publisherVO);

    public List<PublisherVO> listPublisher(PublisherVO publisherVO);
}
