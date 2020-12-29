package model.dao.dao;

import model.vo.ReviewVO;

import java.util.List;

public interface ReviewDAO {

    public void insertReview(ReviewVO reviewVO);

    public List<ReviewVO> seeReview(ReviewVO reviewVO);
}