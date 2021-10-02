package com.finalp.moim.board.model.vo;

import java.sql.Date;

import com.finalp.moim.userinfo.model.vo.UserInfo;

public class Board implements java.io.Serializable {
	private static final long serialVersionUID = 1001L;

	private int board_no;
	private int board_category_no;
	private int user_no;
	private String board_title;
	private String board_content;
	private Date board_date;
	private String board_original_filename;
	private String board_rename_filename;
	private int board_readcount;
	
	// DI
	private UserInfo userVO;
	private BoardCategory cateVO;
	
	public Board() {}

	public Board(int board_no, int board_category_no, int user_no, String board_title, String board_content,
			Date board_date, String board_original_filename, String board_rename_filename, int board_readcount) {
		super();
		this.board_no = board_no;
		this.board_category_no = board_category_no;
		this.user_no = user_no;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_date = board_date;
		this.board_original_filename = board_original_filename;
		this.board_rename_filename = board_rename_filename;
		this.board_readcount = board_readcount;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getBoard_category_no() {
		return board_category_no;
	}

	public void setBoard_category_no(int board_category_no) {
		this.board_category_no = board_category_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

	public String getBoard_original_filename() {
		return board_original_filename;
	}

	public void setBoard_original_filename(String board_original_filename) {
		this.board_original_filename = board_original_filename;
	}

	public String getBoard_rename_filename() {
		return board_rename_filename;
	}

	public void setBoard_rename_filename(String board_rename_filename) {
		this.board_rename_filename = board_rename_filename;
	}

	public int getBoard_readcount() {
		return board_readcount;
	}

	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}

	public UserInfo getUserVO() {
		return userVO;
	}

	public void setUserVO(UserInfo userVO) {
		this.userVO = userVO;
	}
	
	public BoardCategory getCateVO() {
		return cateVO;
	}
	
	public void setCateVO(BoardCategory cateVO) {
		this.cateVO = cateVO;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Board [board_no=" + board_no + ", board_category_no=" + board_category_no + ", user_no=" + user_no
				+ ", board_title=" + board_title + ", board_content=" + board_content + ", board_date=" + board_date
				+ ", board_original_filename=" + board_original_filename + ", board_rename_filename="
				+ board_rename_filename + ", board_readcount=" + board_readcount + "]";
	}
	
}
