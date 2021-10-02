package com.finalp.moim.teampage.common.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalp.moim.teampage.common.model.dao.TPmainDao;
import com.finalp.moim.teampage.common.model.vo.Alert;
import com.finalp.moim.teampage.common.model.vo.TeamMember;

@Service("tpmainService")
public class TPmainServiceImpl implements TPmainService{
	
	@Autowired
	private TPmainDao tpmainDao;
	
	@Override
	public ArrayList<TeamMember> selectMyTeamList(int user_no) {
		return tpmainDao.selectMyTeamList(user_no);
	}

	@Override
	public int insertAlertTSUpdate(TeamMember tm) {
		return tpmainDao.insertAlertTSUpdate(tm);
	}

	@Override
	public ArrayList<Alert> selectAlertList(int team_member_no) {
		return tpmainDao.selectAlertList(team_member_no);
	}

	@Override
	public int deleteAlertOne(int alert_num) {
		return tpmainDao.deleteAlertOne(alert_num);
	}

	@Override
	public int deleteAlertAll(int team_member_no) {
		return tpmainDao.deleteAlertAll(team_member_no);
	}

	@Override
	public int insertAlertTBInsert(TeamMember teammember) {
		return tpmainDao.insertAlertTBInsert(teammember);
	}

	@Override
	public int insertAlertTMInsert(TeamMember teammember) {
		return tpmainDao.insertAlertTMInsert(teammember);
	}

	@Override
	public int insertAlertTMquit(Alert alert) {
		return tpmainDao.insertAlertTMquit(alert);
	}

	@Override
	public int insertAlertTMdelete(Alert alert) {
		return tpmainDao.insertAlertTMdelete(alert);
	}

	@Override
	public int deleteTeamQuit(int team_member_no) {
		return tpmainDao.deleteTeamQuit(team_member_no);
	}

	@Override
	public int insertAlertTLupdate(Alert alert) {
		return tpmainDao.insertAlertTLupdate(alert);
	}
	
}
