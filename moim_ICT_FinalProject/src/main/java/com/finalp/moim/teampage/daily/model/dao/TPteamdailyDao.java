package com.finalp.moim.teampage.daily.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalp.moim.teampage.daily.model.vo.TeamDaily;

@Repository("teamdailyDao")
public class TPteamdailyDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public ArrayList<TeamDaily> selectTeamDailyList(int team_num) {
		List<TeamDaily> list = session.selectList("teamdailyMapper.selectTeamDailyList", team_num);
		return (ArrayList<TeamDaily>)list;
	}

	public int insertTeamDaily(TeamDaily teamdaily) {
		return session.insert("teamdailyMapper.insertTeamDaily", teamdaily);
	}

	public int updateDailyProgress(int daily_no) {
		return session.update("teamdailyMapper.updateDailyProgress", daily_no);
	}

	public int deleteDaily(int daily_no) {
		return session.delete("teamdailyMapper.deleteDaily", daily_no);
	}

}
