package com.finalp.moim.teampage.file.model.service;

import java.util.ArrayList;

import com.finalp.moim.teampage.file.model.vo.TFile;


public interface FileService {
	ArrayList<TFile> selectAll(int team_num);
	TFile selectFile(int file_num);
	int insertFile(TFile tfile);
	int updateFile(TFile tfile);
	int deleteFile(TFile tfile);
	ArrayList<TFile> selectFileRecentList(int team_num);
}
