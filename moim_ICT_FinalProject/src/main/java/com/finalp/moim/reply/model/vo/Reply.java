package com.finalp.moim.reply.model.vo;

import java.sql.Date;

import com.finalp.moim.userinfo.model.vo.UserInfo;

public class Reply implements java.io.Serializable {
	private static final long serialVersionUID = 1005L;
	
	private int reply_no;
	private int board_no;
	private int user_no;
	private String reply_content;
	private Date reply_date;
	
	// DI
	private UserInfo userVO;
	
	public Reply() {}

	public Reply(int reply_no, int board_no, int user_no, String reply_content, Date reply_date) {
		super();
		this.reply_no = reply_no;
		this.board_no = board_no;
		this.user_no = user_no;
		this.reply_content = reply_content;
		this.reply_date = reply_date;
	}

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public Date getReply_date() {
		return reply_date;
	}

	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
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
		return "Reply [reply_no=" + reply_no + ", board_no=" + board_no + ", user_no=" + user_no + ", reply_content="
				+ reply_content + ", reply_date=" + reply_date + "]";
	}
	
}
