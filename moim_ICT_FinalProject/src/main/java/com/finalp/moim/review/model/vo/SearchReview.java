package com.finalp.moim.review.model.vo;

public class SearchReview implements java.io.Serializable {
	private static final long serialVersionUID = 887L;
	
	private int startRow;
	private int endRow;
	private String keyword;
	
	public SearchReview() {}

	public SearchReview(int startRow, int endRow, String keyword) {
		super();
		this.startRow = startRow;
		this.endRow = endRow;
		this.keyword = keyword;
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

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "SearchReview [startRow=" + startRow + ", endRow=" + endRow + ", keyword=" + keyword + "]";
	}
	
	
}
