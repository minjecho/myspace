package com.finalp.moim.teampage.common.model.vo;

import java.sql.Date;

public class Alert implements java.io.Serializable {
	private static final long serialVersionUID = 5555L;
	
	private int alert_num;
	private int team_member_no;
	private int team_num;
	private String alert_cate;
	private String alert_content;
	private java.sql.Date alert_date;
	
	public Alert() {}

	public Alert(int alert_num, int team_member_no, int team_num, String alert_cate, String alert_content,
			Date alert_date) {
		super();
		this.alert_num = alert_num;
		this.team_member_no = team_member_no;
		this.team_num = team_num;
		this.alert_cate = alert_cate;
		this.alert_content = alert_content;
		this.alert_date = alert_date;
	}

	public int getAlert_num() {
		return alert_num;
	}

	public void setAlert_num(int alert_num) {
		this.alert_num = alert_num;
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

	public String getAlert_cate() {
		return alert_cate;
	}

	public void setAlert_cate(String alert_cate) {
		this.alert_cate = alert_cate;
	}

	public String getAlert_content() {
		return alert_content;
	}

	public void setAlert_content(String alert_content) {
		this.alert_content = alert_content;
	}

	public java.sql.Date getAlert_date() {
		return alert_date;
	}

	public void setAlert_date(java.sql.Date alert_date) {
		this.alert_date = alert_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Alert [alert_num=" + alert_num + ", team_member_no=" + team_member_no + ", team_num=" + team_num
				+ ", alert_cate=" + alert_cate + ", alert_content=" + alert_content + ", alert_date=" + alert_date
				+ "]";
	}

}
