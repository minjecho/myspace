package com.finalp.moim.recruit.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalp.moim.common.Page;
import com.finalp.moim.recruit.model.vo.Recruit;
import com.finalp.moim.recruit.model.vo.SearchRecruit;

@Repository("recruitDao")
public class RecruitDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public RecruitDao() {}
	
	public ArrayList<Recruit> selectList(Page page) {
		List<Recruit> list = sqlSession.selectList("recruitMapper.selectList", page);
		return (ArrayList<Recruit>)list;
	}
	
	public int selectListCount() {
		return sqlSession.selectOne("recruitMapper.selectListCount");
	}
	
	public Recruit selectOne(int team_num) {
		return sqlSession.selectOne("recruitMapper.selectOne", team_num);
	}
	
	public int insertRecruit(Recruit recruit) {
		return sqlSession.insert("recruitMapper.insertRecruit", recruit);
	}
	
	public int updateRecruit(Recruit recruit) {
		return sqlSession.update("recruitMapper.updateRecruit", recruit );
	}
	
	public ArrayList<Recruit> selectList(SearchRecruit sr){
	List<Recruit> list = sqlSession.selectList("recruitMapper.selectSearchRecruit", sr);
		return (ArrayList<Recruit>)list;
	}
	
	public int selectSearchTeamName(String team_name) {
		return sqlSession.selectOne("recruitMapper.selectSearchTeamName", team_name);
	}
	
	public int selectSearchRecruitCount(SearchRecruit sr) {
		return sqlSession.selectOne("recruitMapper.selectSearchRecruitCount", sr);
	}

}
