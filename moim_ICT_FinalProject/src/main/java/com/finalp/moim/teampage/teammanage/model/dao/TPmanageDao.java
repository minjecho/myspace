package com.finalp.moim.teampage.teammanage.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalp.moim.teampage.common.model.vo.JoinWaiting;
import com.finalp.moim.teampage.common.model.vo.Team;
import com.finalp.moim.teampage.common.model.vo.TeamMember;

@Repository("teamDao")
public class TPmanageDao {
	
	@Autowired
	private SqlSessionTemplate session;

	public Team selectTeamSetting(int team_num) {
		return session.selectOne("teammanageMapper.selectTeamSetting", team_num);
	}

	public int updateTeamSetting(Team team) {
		return session.update("teammanageMapper.updateTeamSetting", team);
	}

	public ArrayList<JoinWaiting> selectJoinMemberList(int team_num) {
		List<JoinWaiting> list = session.selectList("teammanageMapper.selectJoinMemberList", team_num);
		return (ArrayList<JoinWaiting>)list;
	}

	public ArrayList<TeamMember> selectTeamMemberList(int team_num) {
		List<TeamMember> list = session.selectList("teammanageMapper.selectTeamMemberList", team_num);
		return (ArrayList<TeamMember>)list;
	}

	public JoinWaiting selectJoinMember(int join_num) {
		return session.selectOne("teammanageMapper.selectJoinMember", join_num);
	}

	public int insertTeamMember(JoinWaiting joinwaiting) {
		return session.insert("teammanageMapper.insertTeamMember", joinwaiting);
	}

	public int deleteJoinMember(int join_num) {
		return session.delete("teammanageMapper.deleteJoinMember", join_num);
	}

	public TeamMember selectTeamMember(int team_member_no) {
		return session.selectOne("teammanageMapper.selectTeamMember", team_member_no);
	}

	public TeamMember selectTeamLeader(int team_num) {
		return session.selectOne("teammanageMapper.selectTeamLeader", team_num);
	}

	public int updateTeamMemberRankDown(TeamMember teamleader) {
		return session.update("teammanageMapper.updateTeamMemberRankDown", teamleader);
	}

	public int updateTeamMemberRankUp(TeamMember teammember) {
		return session.update("teammanageMapper.updateTeamMemberRankUp", teammember);
	}

	public int deleteTeamMember(int team_member_no) {
		return session.delete("teammanageMapper.deleteTeamMember", team_member_no);
	}

	public ArrayList<TeamMember> selectTeamMemberNormalList(int team_num) {
		List<TeamMember> list = session.selectList("teammanageMapper.selectTeamMemberNormalList", team_num);
		return (ArrayList<TeamMember>)list;
	}

	public TeamMember selectUserNoTeamMember(TeamMember teammember) {
		return session.selectOne("teammanageMapper.selectUserNoTeamMember", teammember);
	}

	public int getLocListCount(int i) {
		String local = "";
		
		switch (i) {
			case 0: local = "서울"; break;
			case 1: local = "인천"; break;
			case 2: local = "대전"; break;
			case 3: local = "대구"; break;
			case 4: local = "광주"; break;
			case 5: local = "울산"; break;
			case 6: local = "부산"; break;
			case 7: local = "경기"; break;
			case 8: local = "충북"; break;
			case 9: local = "충남"; break;
			case 10: local = "경북"; break;
			case 11: local = "경남"; break;
			case 12: local = "강원"; break;
			case 13: local = "전북"; break;
			case 14: local = "전남"; break;
			case 15: local = "제주"; break;
		}
		
		return session.selectOne("teammanageMapper.getLocalListCount", local);
	}

	public int selectTeamMemberCount(int team_num) {
		return session.selectOne("teammanageMapper.selectTeamMemberCount", team_num);
	}

}
