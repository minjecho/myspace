package com.finalp.moim.mypage.model.vo;

public class MyBoard implements java.io.Serializable {
	private static final long serialVersionUID = 477L;
	
	private int startRow;
	private int endRow;
	private int user_no;
	
	public MyBoard() {}
	
	public MyBoard(int startRow, int endRow, int user_no) {
		super();
		this.startRow = startRow;
		this.endRow = endRow;
		this.user_no = user_no;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	@Override
	public String toString() {
		return "MyBoard [startRow=" + startRow + ", endRow=" + endRow + ", user_no=" + user_no + "]";
	}
	
	
	
}
