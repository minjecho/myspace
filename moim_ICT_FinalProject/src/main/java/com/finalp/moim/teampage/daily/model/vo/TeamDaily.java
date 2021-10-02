package com.finalp.moim.teampage.daily.model.vo;

import java.sql.Date;

import com.finalp.moim.userinfo.model.vo.UserInfo;

public class TeamDaily implements java.io.Serializable{
	private static final long serialVersionUID = 315L;
	
	private int daily_no;
	private int team_num;
	private int daily_writer;
	private Date daily_date;
	private String daily_content;
	private int daily_progress;
	
	private UserInfo userVO;

	public TeamDaily() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TeamDaily(int daily_no, int team_num, int daily_writer, Date daily_date, String daily_content,
			int daily_progress, UserInfo userVO) {
		super();
		this.daily_no = daily_no;
		this.team_num = team_num;
		this.daily_writer = daily_writer;
		this.daily_date = daily_date;
		this.daily_content = daily_content;
		this.daily_progress = daily_progress;
		this.userVO = userVO;
	}

	public int getDaily_no() {
		return daily_no;
	}

	public void setDaily_no(int daily_no) {
		this.daily_no = daily_no;
	}

	public int getTeam_num() {
		return team_num;
	}

	public void setTeam_num(int team_num) {
		this.team_num = team_num;
	}

	public int getDaily_writer() {
		return daily_writer;
	}

	public void setDaily_writer(int daily_writer) {
		this.daily_writer = daily_writer;
	}

	public Date getDaily_date() {
		return daily_date;
	}

	public void setDaily_date(Date daily_date) {
		this.daily_date = daily_date;
	}

	public String getDaily_content() {
		return daily_content;
	}

	public void setDaily_content(String daily_content) {
		this.daily_content = daily_content;
	}

	public int getDaily_progress() {
		return daily_progress;
	}

	public void setDaily_progress(int daily_progress) {
		this.daily_progress = daily_progress;
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
		return "TeamDaily [daily_no=" + daily_no + ", team_num=" + team_num + ", daily_writer=" + daily_writer
				+ ", daily_date=" + daily_date + ", daily_content=" + daily_content + ", daily_progress="
				+ daily_progress + ", userVO=" + userVO + "]";
	}
}
