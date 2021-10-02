package com.finalp.moim.teampage.teamboard.model.service;

import java.util.ArrayList;

import com.finalp.moim.teampage.teamboard.model.vo.TeamBoard;

public interface TPteamboardService {
	
	ArrayList<TeamBoard> selectTeamBoardList(int team_num);
	TeamBoard selectTeamBoard(int tn_no);
	int updateTeamBoard(TeamBoard teamboard);
	int deleteTeamBoard(int tn_no);
	int insertTeamBoard(TeamBoard teamboard);
	ArrayList<TeamBoard> selectBoardTopList(int team_num);
}
