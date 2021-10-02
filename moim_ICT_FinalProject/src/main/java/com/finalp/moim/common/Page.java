package com.finalp.moim.common;

public class Page implements java.io.Serializable {
	private static final long serialVersionUID = 1002L;
	
	private int startRow;
	private int endRow;
	
	public Page() {}

	public Page(int startRow, int endRow) {
		super();
		this.startRow = startRow;
		this.endRow = endRow;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Page [startRow=" + startRow + ", endRow=" + endRow + "]";
	}

}
