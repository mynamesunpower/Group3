package service;

import model.vo.PublisherVO;

import java.util.List;

public interface PublisherService {
    public int insertPublisher(PublisherVO publisherVO);
    public List<PublisherVO> listPublisher(PublisherVO publisherVO);
}
