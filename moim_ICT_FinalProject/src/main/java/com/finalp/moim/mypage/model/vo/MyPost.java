package com.finalp.moim.mypage.model.vo;

public class MyPost implements java.io.Serializable {
	private static final long serialVersionUID = 423L;
	
	private int startRow;
	private int endRow;
	private String user_nn;
	
	public MyPost() {}

	public MyPost(int startRow, int endRow, String user_nn) {
		super();
		this.startRow = startRow;
		this.endRow = endRow;
		this.user_nn = user_nn;
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

	public String getUser_nn() {
		return user_nn;
	}

	public void setUser_nn(String user_nn) {
		this.user_nn = user_nn;
	}

	@Override
	public String toString() {
		return "MyPost [startRow=" + startRow + ", endRow=" + endRow + ", user_nn=" + user_nn + "]";
	}
	
	
}
