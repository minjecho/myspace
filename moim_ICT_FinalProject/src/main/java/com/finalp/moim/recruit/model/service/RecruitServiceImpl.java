package com.finalp.moim.recruit.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalp.moim.common.Page;
import com.finalp.moim.recruit.model.dao.RecruitDao;
import com.finalp.moim.recruit.model.vo.Recruit;
import com.finalp.moim.recruit.model.vo.SearchRecruit;

@Service("recruitService")
public class RecruitServiceImpl implements RecruitService{

	@Autowired
	RecruitDao recruitDao;
	
	@Override
	public ArrayList<Recruit> selectList(Page page){
		return recruitDao.selectList(page);
	}
	
	@Override
	public int selectListCount() {
		return recruitDao.selectListCount();
	}
	
	@Override
	public Recruit selectOne(int team_num) {
		return recruitDao.selectOne(team_num);
	}

	@Override
	public int insertRecruit(Recruit recruit) {
		return recruitDao.insertRecruit(recruit);
	}
	
	@Override
	public int updateRecruit(Recruit recruit) {
		return recruitDao.updateRecruit(recruit);
	}
	
	@Override
	public ArrayList<Recruit> selectSearchRecruit(SearchRecruit sr){
		return recruitDao.selectList(sr);
	}
	
	@Override
	public int selectSearchTeamName(String team_name) {
		return recruitDao.selectSearchTeamName(team_name);
	}
	
	@Override
	public int selectSearchRecruitCount(SearchRecruit sr) {
		return recruitDao.selectSearchRecruitCount(sr);
	}
	
}
