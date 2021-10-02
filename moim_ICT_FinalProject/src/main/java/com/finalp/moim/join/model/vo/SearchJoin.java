package com.finalp.moim.join.model.vo;

public class SearchJoin implements java.io.Serializable {
	private static final long serialVersionUID = 214L;
	
	private int team_num;
	private int user_no;
	
	public SearchJoin() {}

	public SearchJoin(int team_num, int user_no) {
		super();
		this.team_num = team_num;
		this.user_no = user_no;
	}

	public int getTeam_num() {
		return team_num;
	}

	public void setTeam_num(int team_num) {
		this.team_num = team_num;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	@Override
	public String toString() {
		return "SearchJoin [team_num=" + team_num + ", user_no=" + user_no + "]";
	}
	
	
}
