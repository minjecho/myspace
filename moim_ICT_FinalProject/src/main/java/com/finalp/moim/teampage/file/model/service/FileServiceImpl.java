package com.finalp.moim.teampage.file.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalp.moim.teampage.file.model.dao.FileDao;
import com.finalp.moim.teampage.file.model.vo.TFile;

@Service("fileService")
public class FileServiceImpl implements FileService{
	
	@Autowired
	private FileDao fileDao;

	@Override
	public ArrayList<TFile> selectAll(int team_num) {
		return fileDao.selectList(team_num);
	}

	@Override
	public TFile selectFile(int file_num) {
		return fileDao.selectOne(file_num);
	}

	@Override
	public int insertFile(TFile tfile) {
		return fileDao.insertFile(tfile);
	}

	@Override
	public int updateFile(TFile tfile) {
		return fileDao.updateFile(tfile);
	}

	@Override
	public int deleteFile(TFile tfile) {
		return fileDao.deleteFile(tfile);
	}

	@Override
	public ArrayList<TFile> selectFileRecentList(int team_num) {
		return fileDao.selectFileRecentList(team_num);
	}

}
