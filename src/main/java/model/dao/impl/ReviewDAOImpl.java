package model.dao.impl;

import model.dao.dao.ReviewDAO;
import model.vo.ReviewVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("reviewDAO")
public class ReviewDAOImpl implements ReviewDAO {

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Override
    public void insertReview(ReviewVO reviewVO) {
        System.out.println("reviewDAO insertReview() : isbn" + reviewVO.getIsbn());
        sqlSessionTemplate.insert("booktrain.review.insertReview", reviewVO);
    }

    @Override
    public List<ReviewVO> seeReview(ReviewVO reviewVO) {
        return sqlSessionTemplate.selectList("booktrain.review.seeReview", reviewVO);
    }

    @Override
    public void deleteReview(ReviewVO reviewVO) {
        sqlSessionTemplate.delete("booktrain.review.deleteReview", reviewVO);
    }
}
