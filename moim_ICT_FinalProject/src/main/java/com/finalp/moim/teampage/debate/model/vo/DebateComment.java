package com.finalp.moim.teampage.debate.model.vo;

import java.sql.Date;

import com.finalp.moim.userinfo.model.vo.UserInfo;

public class DebateComment implements java.io.Serializable{
	private static final long serialVersionUID = 5553L;

	private int debate_comment_num;
	private int debate_num;
	private int user_no;
	private String debate_comment_content;
	private java.sql.Date debate_comment_date;
	private UserInfo userVO;
	
	public DebateComment() {}
	
	public DebateComment(int debate_comment_num, int debate_num, int user_no, String debate_comment_content,
			Date debate_comment_date, UserInfo userVO) {
		super();
		this.debate_comment_num = debate_comment_num;
		this.debate_num = debate_num;
		this.user_no = user_no;
		this.debate_comment_content = debate_comment_content;
		this.debate_comment_date = debate_comment_date;
		this.userVO = userVO;
	}

	public int getDebate_comment_num() {
		return debate_comment_num;
	}

	public void setDebate_comment_num(int debate_comment_num) {
		this.debate_comment_num = debate_comment_num;
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

	public String getDebate_comment_content() {
		return debate_comment_content;
	}

	public void setDebate_comment_content(String debate_comment_content) {
		this.debate_comment_content = debate_comment_content;
	}

	public java.sql.Date getDebate_comment_date() {
		return debate_comment_date;
	}

	public void setDebate_comment_date(java.sql.Date debate_comment_date) {
		this.debate_comment_date = debate_comment_date;
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
		return "DebateComment [debate_comment_num=" + debate_comment_num + ", debate_num=" + debate_num + ", user_no="
				+ user_no + ", debate_comment_content=" + debate_comment_content + ", debate_comment_date="
				+ debate_comment_date + ", userVO=" + userVO + "]";
	}
	
	
}