package com.finalp.moim.board.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalp.moim.board.model.vo.Board;
import com.finalp.moim.common.Page;

@Repository("boardDao")
public class BoardDao {
	// root-context.xml
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public BoardDao() {}

	public int selectListCount() {
		return sqlSession.selectOne("boardMapper.getListCount");
	}

	public ArrayList<Board> selectList(Page page) {
		List<Board> list = sqlSession.selectList("boardMapper.selectList", page);
		return (ArrayList<Board>) list;
	}

	public int updateReadCount(int board_no) {
		return sqlSession.update("boardMapper.updateReadCount", board_no);
	}

	public Board selectBoard(int board_no) {
		return sqlSession.selectOne("boardMapper.selectBoard", board_no);
	}

	public int insertBoard(Board board) {
		return sqlSession.insert("boardMapper.insertBoard", board);
	}

	public int updateBoard(Board board) {
		return sqlSession.update("boardMapper.updateBoard", board);
	}

	public int deleteBoard(int board_no) {
		return sqlSession.delete("boardMapper.deleteBoard", board_no);
	}

	public ArrayList<Board> selectSearchBoard(int board_category_no, String keyword) {
		List<Board> list = null;
		
		if(board_category_no == 0) {
			list = sqlSession.selectList("boardMapper.searchAll", keyword);
		} else if(board_category_no == 1) {
			list = sqlSession.selectList("boardMapper.searchContest", keyword);
		} else if(board_category_no == 2) {
			list = sqlSession.selectList("boardMapper.searchIntern", keyword);
		} else if(board_category_no == 3) {
			list = sqlSession.selectList("boardMapper.searchLicense", keyword);
		} else if(board_category_no == 4) {
			list = sqlSession.selectList("boardMapper.searchEvent", keyword);
		} else if(board_category_no == 5) {
			list = sqlSession.selectList("boardMapper.searchFree", keyword);
		}
		
		return (ArrayList<Board>) list;
	}
}
