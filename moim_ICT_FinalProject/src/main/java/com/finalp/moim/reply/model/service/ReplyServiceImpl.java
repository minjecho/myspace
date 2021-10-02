package com.finalp.moim.reply.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalp.moim.reply.dao.ReplyDao;
import com.finalp.moim.reply.model.vo.Reply;

@Service("replyService")
public class ReplyServiceImpl implements ReplyService {
	// DI
	@Autowired
	private ReplyDao replyDao;
	
	public ReplyServiceImpl() {}

	@Override
	public ArrayList<Reply> selectReplyList(int board_no) {
		return replyDao.selectReplyList(board_no);
	}

	@Override
	public int insertReply(Reply reply) {
		return replyDao.insertReply(reply);
	}

	@Override
	public int deleteReply(int reply_no) {
		return replyDao.deleteReply(reply_no);
	}
}
