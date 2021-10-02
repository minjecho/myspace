package com.finalp.moim.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalp.moim.board.dao.BoardDao;
import com.finalp.moim.board.model.vo.Board;
import com.finalp.moim.common.Page;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	// DI
	@Autowired
	private BoardDao boardDao;
	
	public BoardServiceImpl() {}

	@Override
	public int selectListCount() {
		return boardDao.selectListCount();
	}

	@Override
	public ArrayList<Board> selectList(Page page) {
		return boardDao.selectList(page);
	}

	@Override
	public int updateReadCount(int board_no) {
		return boardDao.updateReadCount(board_no);
	}

	@Override
	public Board selectBoard(int board_no) {
		return boardDao.selectBoard(board_no);
	}

	@Override
	public int insertBoard(Board board) {
		return boardDao.insertBoard(board);
	}

	@Override
	public int updateBoard(Board board) {
		return boardDao.updateBoard(board);
	}

	@Override
	public int deleteBoard(int board_no) {
		return boardDao.deleteBoard(board_no);
	}

	@Override
	public ArrayList<Board> selectSearchBoard(int board_category_no, String keyword) {
		return boardDao.selectSearchBoard(board_category_no, keyword);
	}
}
