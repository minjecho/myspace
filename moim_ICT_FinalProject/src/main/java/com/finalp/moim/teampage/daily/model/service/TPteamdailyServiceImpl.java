package com.finalp.moim.teampage.daily.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalp.moim.teampage.daily.model.dao.TPteamdailyDao;
import com.finalp.moim.teampage.daily.model.vo.TeamDaily;

@Service("teamdailyService")
public class TPteamdailyServiceImpl implements TPteamdailyService {
	
	@Autowired
	private TPteamdailyDao tpteamdailyDao;
	
	@Override
	public ArrayList<TeamDaily> selectTeamDailyList(int team_num) {
		return tpteamdailyDao.selectTeamDailyList(team_num);
	}

	@Override
	public int insertTeamDaily(TeamDaily teamdaily) {
		return tpteamdailyDao.insertTeamDaily(teamdaily);
	}

	@Override
	public int updateDailyProgress(int daily_no) {
		return tpteamdailyDao.updateDailyProgress(daily_no);
	}

	@Override
	public int deleteDaily(int daily_no) {
		return tpteamdailyDao.deleteDaily(daily_no);
	}
	
}
