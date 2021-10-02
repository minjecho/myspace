package com.finalp.moim.teampage.common.model.vo;

import com.finalp.moim.userinfo.model.vo.UserInfo;

public class JoinWaiting implements java.io.Serializable {
	private static final long serialVersionUID = 4444L;
	
	private int join_num;
	private int team_num;
	private int user_no;
	private String join_intro;
	private String join_original_filename;
	private String join_rename_filename;

	private UserInfo userVO;
	
	public JoinWaiting() {}

	public JoinWaiting(int join_num, int team_num, int user_no, String join_intro) {
		super();
		this.join_num = join_num;
		this.team_num = team_num;
		this.user_no = user_no;
		this.join_intro = join_intro;
	}

	public JoinWaiting(int join_num, int team_num, int user_no, String join_intro, String join_original_filename,
			String join_rename_filename) {
		super();
		this.join_num = join_num;
		this.team_num = team_num;
		this.user_no = user_no;
		this.join_intro = join_intro;
		this.join_original_filename = join_original_filename;
		this.join_rename_filename = join_rename_filename;
	}

	public int getJoin_num() {
		return join_num;
	}

	public void setJoin_num(int join_num) {
		this.join_num = join_num;
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

	public String getJoin_intro() {
		return join_intro;
	}

	public void setJoin_intro(String join_intro) {
		this.join_intro = join_intro;
	}

	public String getJoin_original_filename() {
		return join_original_filename;
	}

	public void setJoin_original_filename(String join_original_filename) {
		this.join_original_filename = join_original_filename;
	}

	public String getJoin_rename_filename() {
		return join_rename_filename;
	}

	public void setJoin_rename_filename(String join_rename_filename) {
		this.join_rename_filename = join_rename_filename;
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
		return "JoinWaiting [join_num=" + join_num + ", team_num=" + team_num + ", user_no=" + user_no + ", join_intro="
				+ join_intro + ", join_original_filename=" + join_original_filename + ", join_rename_filename="
				+ join_rename_filename + "]";
	}
	
}
