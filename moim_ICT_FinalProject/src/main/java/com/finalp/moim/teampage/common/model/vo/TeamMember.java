package com.finalp.moim.teampage.common.model.vo;

import java.sql.Date;

import com.finalp.moim.userinfo.model.vo.UserInfo;

public class TeamMember implements java.io.Serializable {
	private static final long serialVersionUID = 3333L;
	
	private int team_member_no;
	private int team_num;
	private int user_no;
	private String team_member_leader;
	private java.sql.Date team_member_date;
	
	private UserInfo userVO;
	
	public TeamMember() {}

	public TeamMember(int team_member_no, int team_num, int user_no, String team_member_leader, Date team_member_date,
			UserInfo userVO) {
		super();
		this.team_member_no = team_member_no;
		this.team_num = team_num;
		this.user_no = user_no;
		this.team_member_leader = team_member_leader;
		this.team_member_date = team_member_date;
		this.userVO = userVO;
	}

	public int getTeam_member_no() {
		return team_member_no;
	}

	public void setTeam_member_no(int team_member_no) {
		this.team_member_no = team_member_no;
	}

	public int getTeam_num() {
		return team_num;
	}

	public void setTeam_num(int team_num) {
		this.team_num = team_num;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getTeam_member_leader() {
		return team_member_leader;
	}

	public void setTeam_member_leader(String team_member_leader) {
		this.team_member_leader = team_member_leader;
	}

	public java.sql.Date getTeam_member_date() {
		return team_member_date;
	}

	public void setTeam_member_date(java.sql.Date team_member_date) {
		this.team_member_date = team_member_date;
	}

	public UserInfo getUserVO() {
		return userVO;
	}

	public void setUserVO(UserInfo userVO) {
		this.userVO = userVO;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "TeamMember [team_member_no=" + team_member_no + ", team_num=" + team_num + ", user_no=" + user_no
				+ ", team_member_leader=" + team_member_leader + ", team_member_date=" + team_member_date + ", userVO="
				+ userVO + "]";
	}
	
}
