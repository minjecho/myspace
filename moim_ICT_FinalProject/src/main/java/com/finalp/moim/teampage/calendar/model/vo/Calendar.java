package com.finalp.moim.teampage.calendar.model.vo;

import java.sql.Date;

import com.finalp.moim.userinfo.model.vo.UserInfo;

public class Calendar implements java.io.Serializable {
	private static final long serialVersionUID = 924L;
	
	private int cal_no;
	private int team_num;
	private int cal_writer;
	private String cal_title;
	private Date cal_startdate;
	private Date cal_enddate;
	private String cal_detail;
	
	private UserInfo userVO;

	public Calendar() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Calendar(int cal_no, int team_num, int cal_writer, String cal_title, Date cal_startdate, Date cal_enddate,
			String cal_detail, UserInfo userVO) {
		super();
		this.cal_no = cal_no;
		this.team_num = team_num;
		this.cal_writer = cal_writer;
		this.cal_title = cal_title;
		this.cal_startdate = cal_startdate;
		this.cal_enddate = cal_enddate;
		this.cal_detail = cal_detail;
		this.userVO = userVO;
	}

	public int getCal_no() {
		return cal_no;
	}

	public void setCal_no(int cal_no) {
		this.cal_no = cal_no;
	}

	public int getTeam_num() {
		return team_num;
	}

	public void setTeam_num(int team_num) {
		this.team_num = team_num;
	}

	public int getCal_writer() {
		return cal_writer;
	}

	public void setCal_writer(int cal_writer) {
		this.cal_writer = cal_writer;
	}

	public String getCal_title() {
		return cal_title;
	}

	public void setCal_title(String cal_title) {
		this.cal_title = cal_title;
	}

	public Date getCal_startdate() {
		return cal_startdate;
	}

	public void setCal_startdate(Date cal_startdate) {
		this.cal_startdate = cal_startdate;
	}

	public Date getCal_enddate() {
		return cal_enddate;
	}

	public void setCal_enddate(Date cal_enddate) {
		this.cal_enddate = cal_enddate;
	}

	public String getCal_detail() {
		return cal_detail;
	}

	public void setCal_detail(String cal_detail) {
		this.cal_detail = cal_detail;
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
		return "Calendar [cal_no=" + cal_no + ", team_num=" + team_num + ", cal_writer=" + cal_writer + ", cal_title="
				+ cal_title + ", cal_startdate=" + cal_startdate + ", cal_enddate=" + cal_enddate + ", cal_detail="
				+ cal_detail + ", userVO=" + userVO + "]";
	}
}
