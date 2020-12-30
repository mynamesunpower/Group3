package model.dao.dao;

import model.vo.VisitVo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class VisitDAO {

    @Autowired
    private SqlSessionTemplate mybatis;

    public int insertVisitor(VisitVo vo) throws Exception{
        return mybatis.insert("VisitMapper.VisitDAO",vo);
    }
}
