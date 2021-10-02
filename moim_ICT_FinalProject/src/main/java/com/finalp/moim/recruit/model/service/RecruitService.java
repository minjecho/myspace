package com.finalp.moim.recruit.model.service;

import java.util.ArrayList;

import com.finalp.moim.common.Page;
import com.finalp.moim.recruit.model.vo.Recruit;
import com.finalp.moim.recruit.model.vo.SearchRecruit;

public interface RecruitService {
	ArrayList<Recruit> selectList(Page page);
	int selectListCount();
	Recruit selectOne(int team_num); //글 상세보기
	int insertRecruit(Recruit recruit); 
	int updateRecruit(Recruit recruit);
	ArrayList<Recruit> selectSearchRecruit(SearchRecruit sr);
	int selectSearchTeamName(String team_name);
	int selectSearchRecruitCount(SearchRecruit sr);
}
