package com.finalp.moim.teampage.teammanage.model.service;

import java.util.ArrayList;

import com.finalp.moim.teampage.common.model.vo.JoinWaiting;
import com.finalp.moim.teampage.common.model.vo.Team;
import com.finalp.moim.teampage.common.model.vo.TeamMember;

public interface TPmanageService {

	Team selectTeamSetting(int team_num);
	int updateTeamSetting(Team team);
	JoinWaiting selectJoinMember(int join_num);
	TeamMember selectTeamMember(int team_member_no);
	ArrayList<JoinWaiting> selectJoinMemberList(int team_num);
	ArrayList<TeamMember> selectTeamMemberList(int team_num);
	int insertTeamMember(JoinWaiting joinmember);
	int deleteJoinMember(int join_num);
	int updateTeamMemberRankDown(TeamMember teamleader);
	int deleteTeamMember(int team_member_no);
	TeamMember selectTeamLeader(int team_num);
	int updateTeamMemberRankUp(TeamMember teammember);
	ArrayList<TeamMember> selectTeamMemberNormalList(int team_num);
	TeamMember selectUserNoTeamMember(TeamMember teammember);
	int getLocListCount(int i);
	int selectTeamMemberCount(int team_num);
}
