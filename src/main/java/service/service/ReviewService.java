package service.service;

import model.vo.ReviewVO;

import java.util.List;

public interface ReviewService {

    public void insertReview(ReviewVO reviewVO);

    public List<ReviewVO> seeReview(ReviewVO reviewVO);

    public void deleteReview(ReviewVO reviewVO);

    public List<ReviewVO> bookScore(ReviewVO reviewVO);

}