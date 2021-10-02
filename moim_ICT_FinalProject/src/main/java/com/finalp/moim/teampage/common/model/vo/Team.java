package com.finalp.moim.teampage.common.model.vo;

public class Team implements java.io.Serializable {
	private static final long serialVersionUID = 1111L;
	
	private int team_num;
	private int field_num;
	private String team_name;
	private String team_intro;
	private String team_leader_intro;
	private String team_original_image;
	private String team_rename_image;
	private String team_level;
	private String team_local;
	private String team_act_day;
	private int team_act_week;
	private String team_act_time;
	private int team_fee;
	private int team_limit;
	private String team_recruit;
	
	public Team() {}

	public Team(int team_num, int field_num, String team_name, String team_intro, String team_leader_intro,
			String team_level, String team_local, String team_act_day, int team_act_week, int team_limit,
			String team_recruit) {
		super();
		this.team_num = team_num;
		this.field_num = field_num;
		this.team_name = team_name;
		this.team_intro = team_intro;
		this.team_leader_intro = team_leader_intro;
		this.team_level = team_level;
		this.team_local = team_local;
		this.team_act_day = team_act_day;
		this.team_act_week = team_act_week;
		this.team_limit = team_limit;
		this.team_recruit = team_recruit;
	}

	public Team(int team_num, int field_num, String team_name, String team_intro, String team_leader_intro,
			String team_original_image, String team_rename_image, String team_level, String team_local,
			String team_act_day, int team_act_week, String team_act_time, int team_fee, int team_limit,
			String team_recruit) {
		super();
		this.team_num = team_num;
		this.field_num = field_num;
		this.team_name = team_name;
		this.team_intro = team_intro;
		this.team_leader_intro = team_leader_intro;
		this.team_original_image = team_original_image;
		this.team_rename_image = team_rename_image;
		this.team_level = team_level;
		this.team_local = team_local;
		this.team_act_day = team_act_day;
		this.team_act_week = team_act_week;
		this.team_act_time = team_act_time;
		this.team_fee = team_fee;
		this.team_limit = team_limit;
		this.team_recruit = team_recruit;
	}

	public int getTeam_num() {
		return team_num;
	}

	public void setTeam_num(int team_num) {
		this.team_num = team_num;
	}

	public int getField_num() {
		return field_num;
	}

	public void setField_num(int field_num) {
		this.field_num = field_num;
	}

	public String getTeam_name() {
		return team_name;
	}

	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}

	public String getTeam_intro() {
		return team_intro;
	}

	public void setTeam_intro(String team_intro) {
		this.team_intro = team_intro;
	}

	public String getTeam_leader_intro() {
		return team_leader_intro;
	}

	public void setTeam_leader_intro(String team_leader_intro) {
		this.team_leader_intro = team_leader_intro;
	}

	public String getTeam_original_image() {
		return team_original_image;
	}

	public void setTeam_original_image(String team_original_image) {
		this.team_original_image = team_original_image;
	}

	public String getTeam_rename_image() {
		return team_rename_image;
	}

	public void setTeam_rename_image(String team_rename_image) {
		this.team_rename_image = team_rename_image;
	}

	public String getTeam_level() {
		return team_level;
	}

	public void setTeam_level(String team_level) {
		this.team_level = team_level;
	}

	public String getTeam_local() {
		return team_local;
	}

	public void setTeam_local(String team_local) {
		this.team_local = team_local;
	}

	public String getTeam_act_day() {
		return team_act_day;
	}

	public void setTeam_act_day(String team_act_day) {
		this.team_act_day = team_act_day;
	}

	public int getTeam_act_week() {
		return team_act_week;
	}

	public void setTeam_act_week(int team_act_week) {
		this.team_act_week = team_act_week;
	}

	public String getTeam_act_time() {
		return team_act_time;
	}

	public void setTeam_act_time(String team_act_time) {
		this.team_act_time = team_act_time;
	}

	public int getTeam_fee() {
		return team_fee;
	}

	public void setTeam_fee(int team_fee) {
		this.team_fee = team_fee;
	}

	public int getTeam_limit() {
		return team_limit;
	}

	public void setTeam_limit(int team_limit) {
		this.team_limit = team_limit;
	}

	public String getTeam_recruit() {
		return team_recruit;
	}

	public void setTeam_recruit(String team_recruit) {
		this.team_recruit = team_recruit;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Team [team_num=" + team_num + ", field_num=" + field_num + ", team_name=" + team_name + ", team_intro="
				+ team_intro + ", team_leader_intro=" + team_leader_intro + ", team_original_image="
				+ team_original_image + ", team_rename_image=" + team_rename_image + ", team_level=" + team_level
				+ ", team_local=" + team_local + ", team_act_day=" + team_act_day + ", team_act_week=" + team_act_week
				+ ", team_act_time=" + team_act_time + ", team_fee=" + team_fee + ", team_limit=" + team_limit
				+ ", team_recruit=" + team_recruit + "]";
	}
	
}
