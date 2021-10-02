package com.finalp.moim.teampage.file.model.vo;

import java.sql.Date;

import com.finalp.moim.userinfo.model.vo.UserInfo;

public class TFile implements java.io.Serializable{
	private static final long serialVersionUID = 2222L;
	
	private int file_num;
	private int team_num;
	private int file_uploader;
	private String file_originalfilename;
	private String file_renamefilename;
	private java.sql.Date file_reg_date;
	
	private UserInfo userVO;
	
	public TFile() {}

	public TFile(int file_num, int team_num, int file_uploader, String file_originalfilename,
			String file_renamefilename, Date file_reg_date, UserInfo userVO) {
		super();
		this.file_num = file_num;
		this.team_num = team_num;
		this.file_uploader = file_uploader;
		this.file_originalfilename = file_originalfilename;
		this.file_renamefilename = file_renamefilename;
		this.file_reg_date = file_reg_date;
		this.userVO = userVO;
	}

	public int getFile_num() {
		return file_num;
	}

	public void setFile_num(int file_num) {
		this.file_num = file_num;
	}

	public int getTeam_num() {
		return team_num;
	}

	public void setTeam_num(int team_num) {
		this.team_num = team_num;
	}

	public int getFile_uploader() {
		return file_uploader;
	}

	public void setFile_uploader(int file_uploader) {
		this.file_uploader = file_uploader;
	}

	public String getFile_originalfilename() {
		return file_originalfilename;
	}

	public void setFile_originalfilename(String file_originalfilename) {
		this.file_originalfilename = file_originalfilename;
	}

	public String getFile_renamefilename() {
		return file_renamefilename;
	}

	public void setFile_renamefilename(String file_renamefilename) {
		this.file_renamefilename = file_renamefilename;
	}

	public java.sql.Date getFile_reg_date() {
		return file_reg_date;
	}

	public void setFile_reg_date(java.sql.Date file_reg_date) {
		this.file_reg_date = file_reg_date;
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
		return "TFile [file_num=" + file_num + ", team_num=" + team_num + ", file_uploader=" + file_uploader
				+ ", file_originalfilename=" + file_originalfilename + ", file_renamefilename=" + file_renamefilename
				+ ", file_reg_date=" + file_reg_date + ", userVO=" + userVO + "]";
	} 
	
}
