package com.finalp.moim.join.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalp.moim.join.model.vo.Join;
import com.finalp.moim.join.model.vo.SearchJoin;

@Repository("joinDao")
public class JoinDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public JoinDao() {}
	
	public int insertJoin(Join join) {
		return sqlSession.insert("joinMapper.insertJoin", join);
	}
	
	public int searchTeamJoin(SearchJoin sj) {
		return sqlSession.selectOne("joinMapper.selectTeamJoin", sj);
	}
	
	public int selectTeamMember(SearchJoin sj) {
		return sqlSession.selectOne("joinMapper.selectTeamMember", sj);
	}
}
