package com.finalp.moim.review.model.vo;

public class UserTeam implements java.io.Serializable {
	private static final long serialVersionUID = 217L;
	
	
	private int user_no;
	private int team_num;
	private int team_member_no;
	private String team_member_leader;
	private String team_name;
	private int field_num;
	private String field_name;
	
	public UserTeam() {}
	
	public UserTeam(int user_no, int team_num, int team_member_no, String team_member_leader, String team_name,
			int field_num, String field_name) {
		super();
		this.user_no = user_no;
		this.team_num = team_num;
		this.team_member_no = team_member_no;
		this.team_member_leader = team_member_leader;
		this.team_name = team_name;
		this.field_num = field_num;
		this.field_name = field_name;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getTeam_num() {
		return team_num;
	}
	public void setTeam_num(int team_num) {
		this.team_num = team_num;
	}
	public int getTeam_member_no() {
		return team_member_no;
	}
	public void setTeam_member_no(int team_member_no) {
		this.team_member_no = team_member_no;
	}
	public String getTeam_member_leader() {
		return team_member_leader;
	}
	public void setTeam_member_leader(String team_member_leader) {
		this.team_member_leader = team_member_leader;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	public int getField_num() {
		return field_num;
	}
	public void setField_num(int field_num) {
		this.field_num = field_num;
	}
	public String getField_name() {
		return field_name;
	}
	public void setField_name(String field_name) {
		this.field_name = field_name;
	}
	@Override
	public String toString() {
		return "UserTeam [user_no=" + user_no + ", team_num=" + team_num + ", team_member_no=" + team_member_no
				+ ", team_member_leader=" + team_member_leader + ", team_name=" + team_name + ", field_num=" + field_num
				+ ", field_name=" + field_name + "]";
	}
	
	
	
}
