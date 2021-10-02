package com.finalp.moim.teampage.debate.model.vo;

import java.sql.Date;

import com.finalp.moim.userinfo.model.vo.UserInfo;

public class Debate implements java.io.Serializable{
	private static final long serialVersionUID = 4433L;
	
	private int debate_num;
	private int user_no;
	private int team_num;
	private String debate_title;
	private String debate_content;
	private java.sql.Date debate_date;
	private int debate_comment_count;
	private UserInfo userVO;
	
	public Debate() {}
	
	


	public Debate(int debate_num, int user_no, int team_num, String debate_title, String debate_content,
			Date debate_date, int debate_comment_count, UserInfo userVO) {
		super();
		this.debate_num = debate_num;
		this.user_no = user_no;
		this.team_num = team_num;
		this.debate_title = debate_title;
		this.debate_content = debate_content;
		this.debate_date = debate_date;
		this.debate_comment_count = debate_comment_count;
		this.userVO = userVO;
	}




	public int getDebate_num() {
		return debate_num;
	}


	public void setDebate_num(int debate_num) {
		this.debate_num = debate_num;
	}


	public int getUser_no() {
		return user_no;
	}


	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}


	public int getTeam_num() {
		return team_num;
	}


	public void setTeam_num(int team_num) {
		this.team_num = team_num;
	}


	public String getDebate_title() {
		return debate_title;
	}


	public void setDebate_title(String debate_title) {
		this.debate_title = debate_title;
	}


	public String getDebate_content() {
		return debate_content;
	}


	public void setDebate_content(String debate_content) {
		this.debate_content = debate_content;
	}


	public java.sql.Date getDebate_date() {
		return debate_date;
	}


	public void setDebate_date(java.sql.Date debate_date) {
		this.debate_date = debate_date;
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

	

	public int getDebate_comment_count() {
		return debate_comment_count;
	}




	public void setDebate_comment_count(int debate_comment_count) {
		this.debate_comment_count = debate_comment_count;
	}




	@Override
	public String toString() {
		return "Debate [debate_num=" + debate_num + ", user_no=" + user_no + ", team_num=" + team_num
				+ ", debate_title=" + debate_title + ", debate_content=" + debate_content + ", debate_date="
				+ debate_date + ", debate_comment_count=" + debate_comment_count + ", userVO=" + userVO + "]";
	}




	
	
	


}
