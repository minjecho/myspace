package com.finalp.moim.teampage.teamboard.model.vo;

import java.sql.Date;

import com.finalp.moim.userinfo.model.vo.UserInfo;

public class TeamBoard implements java.io.Serializable{
	private static final long serialVersionUID = 414L;
	
	private int tn_no;
	private int team_num;
	private int tn_writer;
	private String tn_title;
	private String tn_content;
	private Date tn_date;
	private String tn_originalfilename;
	private String tn_renamefilename;
	
	private UserInfo userVO;

	public TeamBoard() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TeamBoard(int tn_no, int team_num, int tn_writer, String tn_title, String tn_content,
			Date tn_date) {
		super();
		this.tn_no = tn_no;
		this.team_num = team_num;
		this.tn_writer = tn_writer;
		this.tn_title = tn_title;
		this.tn_content = tn_content;
		this.tn_date = tn_date;
	}

	public TeamBoard(int tn_no, int team_num, int tn_writer, String tn_title, String tn_content,
			Date tn_date, String tn_originalfilename, String tn_renamefilename) {
		super();
		this.tn_no = tn_no;
		this.team_num = team_num;
		this.tn_writer = tn_writer;
		this.tn_title = tn_title;
		this.tn_content = tn_content;
		this.tn_date = tn_date;
		this.tn_originalfilename = tn_originalfilename;
		this.tn_renamefilename = tn_renamefilename;
	}

	public int getTn_no() {
		return tn_no;
	}

	public void setTn_no(int tn_no) {
		this.tn_no = tn_no;
	}

	public int getTeam_num() {
		return team_num;
	}

	public void setTeam_num(int team_num) {
		this.team_num = team_num;
	}

	public int getTn_writer() {
		return tn_writer;
	}

	public void setTn_writer(int tn_writer) {
		this.tn_writer = tn_writer;
	}

	public String getTn_title() {
		return tn_title;
	}

	public void setTn_title(String tn_title) {
		this.tn_title = tn_title;
	}

	public String getTn_content() {
		return tn_content;
	}

	public void setTn_content(String tn_content) {
		this.tn_content = tn_content;
	}

	public Date getTn_date() {
		return tn_date;
	}

	public void setTn_date(Date tn_date) {
		this.tn_date = tn_date;
	}

	public String getTn_originalfilename() {
		return tn_originalfilename;
	}

	public void setTn_originalfilename(String tn_originalfilename) {
		this.tn_originalfilename = tn_originalfilename;
	}

	public String getTn_renamefilename() {
		return tn_renamefilename;
	}

	public void setTn_renamefilename(String tn_renamefilename) {
		this.tn_renamefilename = tn_renamefilename;
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
		return "TeamBoard [tn_no=" + tn_no + ", team_num=" + team_num + ", tn_writer="
				+ tn_writer + ", tn_title=" + tn_title + ", tn_content=" + tn_content + ", tn_date=" + tn_date
				+ ", tn_originalfilename=" + tn_originalfilename + ", tn_renamefilename=" + tn_renamefilename
				+ ", userVO=" + userVO + "]";
	}

	
	
}
