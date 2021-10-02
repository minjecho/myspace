package com.finalp.moim.teampage.teammanage.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalp.moim.teampage.common.model.vo.JoinWaiting;
import com.finalp.moim.teampage.common.model.vo.Team;
import com.finalp.moim.teampage.common.model.vo.TeamMember;
import com.finalp.moim.teampage.teammanage.model.dao.TPmanageDao;

@Service("TeamService")
public class TPmanageServiceImpl implements TPmanageService {
	
	@Autowired
	private TPmanageDao tpmanageDao;

	@Override
	public Team selectTeamSetting(int team_num) {
		return tpmanageDao.selectTeamSetting(team_num);
	}

	@Override
	public int updateTeamSetting(Team team) {
		return tpmanageDao.updateTeamSetting(team);
	}

	@Override
	public JoinWaiting selectJoinMember(int join_num) {
		return tpmanageDao.selectJoinMember(join_num);
	}

	@Override
	public TeamMember selectTeamMember(int team_member_no) {
		return tpmanageDao.selectTeamMember(team_member_no);
	}

	@Override
	public ArrayList<JoinWaiting> selectJoinMemberList(int team_num) {
		return tpmanageDao.selectJoinMemberList(team_num);
	}

	@Override
	public ArrayList<TeamMember> selectTeamMemberList(int team_num) {
		return tpmanageDao.selectTeamMemberList(team_num);
	}

	@Override
	public int insertTeamMember(JoinWaiting joinwaiting) {
		return tpmanageDao.insertTeamMember(joinwaiting);
	}

	@Override
	public int deleteJoinMember(int join_num) {
		return tpmanageDao.deleteJoinMember(join_num);
	}

	@Override
	public int updateTeamMemberRankDown(TeamMember teamleader) {
		return tpmanageDao.updateTeamMemberRankDown(teamleader);
	}

	@Override
	public int deleteTeamMember(int team_member_no) {
		return tpmanageDao.deleteTeamMember(team_member_no);
	}

	@Override
	public TeamMember selectTeamLeader(int team_num) {
		return tpmanageDao.selectTeamLeader(team_num);
	}

	@Override
	public int updateTeamMemberRankUp(TeamMember teammember) {
		return tpmanageDao.updateTeamMemberRankUp(teammember);
	}

	@Override
	public ArrayList<TeamMember> selectTeamMemberNormalList(int team_num) {
		return tpmanageDao.selectTeamMemberNormalList(team_num);
	}

	@Override
	public TeamMember selectUserNoTeamMember(TeamMember teammember) {
		return tpmanageDao.selectUserNoTeamMember(teammember);
	}

	@Override
	public int getLocListCount(int i) {
		return tpmanageDao.getLocListCount(i);
	}

	@Override
	public int selectTeamMemberCount(int team_num) {
		return tpmanageDao.selectTeamMemberCount(team_num);
	}
	
}
