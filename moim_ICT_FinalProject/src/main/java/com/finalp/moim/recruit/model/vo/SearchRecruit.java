package com.finalp.moim.recruit.model.vo;

public class SearchRecruit implements java.io.Serializable {
	private static final long serialVersionUID = 215L;
	
	private String team_level;
	private String field_name;
	private String team_local;
	private String team_name;
	private String team_act_day;
	private int startRow;
	private int endRow;
	
	public SearchRecruit() {}

	public SearchRecruit(String team_level, String field_name, String team_local, String team_name, String team_act_day,
			int startRow, int endRow) {
		super();
		this.team_level = team_level;
		this.field_name = field_name;
		this.team_local = team_local;
		this.team_name = team_name;
		this.team_act_day = team_act_day;
		this.startRow = startRow;
		this.endRow = endRow;
	}

	public String getTeam_level() {
		return team_level;
	}

	public void setTeam_level(String team_level) {
		this.team_level = team_level;
	}

	public String getField_name() {
		return field_name;
	}

	public void setField_name(String field_name) {
		this.field_name = field_name;
	}

	public String getTeam_local() {
		return team_local;
	}

	public void setTeam_local(String team_local) {
		this.team_local = team_local;
	}

	public String getTeam_name() {
		return team_name;
	}

	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}

	public String getTeam_act_day() {
		return team_act_day;
	}

	public void setTeam_act_day(String team_act_day) {
		this.team_act_day = team_act_day;
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

	@Override
	public String toString() {
		return "SearchRecruit [team_level=" + team_level + ", field_name=" + field_name + ", team_local=" + team_local
				+ ", team_name=" + team_name + ", team_act_day=" + team_act_day + ", startRow=" + startRow
				+ ", endRow=" + endRow + "]";
	}

	
	
	
	
}
