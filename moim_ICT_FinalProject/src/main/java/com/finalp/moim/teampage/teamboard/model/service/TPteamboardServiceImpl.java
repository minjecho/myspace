package com.finalp.moim.teampage.teamboard.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalp.moim.teampage.teamboard.model.dao.TPteamboardDao;
import com.finalp.moim.teampage.teamboard.model.vo.TeamBoard;

@Service("teamboardService")
public class TPteamboardServiceImpl implements TPteamboardService {
	
	@Autowired
	private TPteamboardDao tpteamboardDao;

	@Override
	public ArrayList<TeamBoard> selectTeamBoardList(int team_num) {
		return tpteamboardDao.selectTeamBoardList(team_num);
	}

	@Override
	public TeamBoard selectTeamBoard(int tn_no) {
		return tpteamboardDao.selectTeamBoard(tn_no);
	}

	@Override
	public int updateTeamBoard(TeamBoard teamboard) {
		return tpteamboardDao.updateTeamBoard(teamboard);
	}

	@Override
	public int deleteTeamBoard(int tn_no) {
		return tpteamboardDao.deleteTeamBoard(tn_no);
	}

	@Override
	public int insertTeamBoard(TeamBoard teamboard) {
		return tpteamboardDao.insertTeamBoard(teamboard);
	}

	public ArrayList<TeamBoard> selectBoardTopList(int team_num) {
		return tpteamboardDao.selectBoardTopList(team_num);
	}
	
}
