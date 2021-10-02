package com.finalp.moim.notice.model.vo;

import java.sql.Date;

import com.finalp.moim.userinfo.model.vo.UserInfo;

public class Notice implements java.io.Serializable {
	private static final long serialVersionUID = 1000L;

	private int notice_no;
	private int user_no;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
	private String notice_original_filename;
	private String notice_rename_filename;
	
	// DI
	private UserInfo userVO;
	
	public Notice() {}

	public Notice(int notice_no, int user_no, String notice_title, String notice_content, Date notice_date,
			String notice_original_filename, String notice_rename_filename) {
		super();
		this.notice_no = notice_no;
		this.user_no = user_no;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
		this.notice_original_filename = notice_original_filename;
		this.notice_rename_filename = notice_rename_filename;
	}

	public int getNotice_no() {
		return notice_no;
	}

	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}

	public String getNotice_original_filename() {
		return notice_original_filename;
	}

	public void setNotice_original_filename(String notice_original_filename) {
		this.notice_original_filename = notice_original_filename;
	}

	public String getNotice_rename_filename() {
		return notice_rename_filename;
	}

	public void setNotice_rename_filename(String notice_rename_filename) {
		this.notice_rename_filename = notice_rename_filename;
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
		return "Notice [notice_no=" + notice_no + ", user_no=" + user_no + ", notice_title=" + notice_title
				+ ", notice_content=" + notice_content + ", notice_date=" + notice_date + ", notice_original_filename="
				+ notice_original_filename + ", notice_rename_filename=" + notice_rename_filename + "]";
	}
	
}
