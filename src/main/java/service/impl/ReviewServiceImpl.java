package service.impl;

import model.dao.impl.ReviewDAOImpl;
import model.vo.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.service.ReviewService;

import java.util.List;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    ReviewDAOImpl reviewDAO;

    @Override
    public void insertReview(ReviewVO reviewVO) {
        reviewDAO.insertReview(reviewVO);
    }

    @Override
    public List<ReviewVO> seeReview(ReviewVO reviewVO) {
        return reviewDAO.seeReview(reviewVO);
    }

    @Override
    public void deleteReview(ReviewVO reviewVO) {
        reviewDAO.deleteReview(reviewVO);
    }
}