package com.finalp.moim.teampage.daily.model.service;

import java.util.ArrayList;

import com.finalp.moim.teampage.daily.model.vo.TeamDaily;

public interface TPteamdailyService {
	ArrayList<TeamDaily> selectTeamDailyList(int team_num);
	int insertTeamDaily(TeamDaily teamdaily);
	int updateDailyProgress(int daily_no);
	int deleteDaily(int daily_no);
}
