package com.finalp.moim.teampage.common.model.service;

import java.util.ArrayList;

import com.finalp.moim.teampage.common.model.vo.Alert;
import com.finalp.moim.teampage.common.model.vo.TeamMember;

public interface TPmainService {
	ArrayList<TeamMember> selectMyTeamList(int user_no);
	int insertAlertTSUpdate(TeamMember tm);
	ArrayList<Alert> selectAlertList(int team_member_no);
	int deleteAlertOne(int alert_num);
	int deleteAlertAll(int team_member_no);
	int insertAlertTBInsert(TeamMember teammember);
	int insertAlertTMInsert(TeamMember teammember);
	int insertAlertTMquit(Alert alert);
	int insertAlertTMdelete(Alert alert);
	int deleteTeamQuit(int team_member_no);
	int insertAlertTLupdate(Alert alert);
}
