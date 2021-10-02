package com.finalp.moim.teampage.file.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalp.moim.teampage.file.model.vo.TFile;


@Repository("fileDao")
public class FileDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public FileDao() {}
	
	public ArrayList<TFile> selectList(int team_num){
		List<TFile> list = sqlSession.selectList(
				"fileMapper.selectAll", team_num);
		return (ArrayList<TFile>)list;
	}

	public int insertFile(TFile tfile) {
		return sqlSession.insert("fileMapper.insertFile", tfile);
	}

	public TFile selectOne(int file_num) {
		return sqlSession.selectOne(
				"fileMapper.selectFile", file_num);
	}

	public int updateFile(TFile tfile) {
		return sqlSession.update(
				"fileMapper.updateFile", tfile);
	}

	public int deleteFile(TFile tfile) {
		return sqlSession.delete(
				"fileMapper.deleteFile", tfile);
	}

	public ArrayList<TFile> selectFileRecentList(int team_num) {
		List<TFile> list = sqlSession.selectList(
				"fileMapper.selectFileRecentList", team_num);
		return (ArrayList<TFile>)list;
	}

}
