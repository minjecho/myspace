package com.finalp.moim.teampage.debate.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalp.moim.teampage.debate.model.dao.TPdebateDao;
import com.finalp.moim.teampage.debate.model.vo.Debate;
import com.finalp.moim.teampage.debate.model.vo.DebateComment;


@Service("tpdebateService")
public class TPdebateServiceImpl implements TPdebateService{
	
	@Autowired
	private TPdebateDao tpdebatedao;

	@Override
	public ArrayList<Debate> selectAll(int team_num) {
		return tpdebatedao.selectList(team_num);
	}

	@Override
	public int insertdebate(Debate debate) {
		return tpdebatedao.insertdebate(debate);
	}

	@Override
	public Debate selectDebate(int debate_num) {
		return tpdebatedao.selectDebate(debate_num);
	}

	@Override
	public ArrayList<DebateComment> selectDebateCommentList(int debate_num) {
		return tpdebatedao.selectDebateCommentList(debate_num);
	}

	@Override
	public int updatedebate(Debate debate) {
		return tpdebatedao.updateDebate(debate);
	}

	@Override
	public int deleteDebateCommentAll(int debate_num) {
		return tpdebatedao.deleteDebateCommentAll(debate_num);
	}

	@Override
	public int deleteDebate(int debate_num) {
		return tpdebatedao.deleteDebate(debate_num);
	}

	@Override
	public int insertDebateComment(DebateComment dcomment) {
		return tpdebatedao.insertDebateComment(dcomment);
	}

	@Override
	public int updateDebateCommentCountUp(int debate_num) {
		return tpdebatedao.updateDebateCommentCountUp(debate_num);
	}

	@Override
	public int deleteDebateComment(int debate_comment_num) {
		return tpdebatedao.deleteDebateComment(debate_comment_num);
	}

	@Override
	public int updateDebateCommentCountDown(int debate_num) {
		return tpdebatedao.updateDebateCommentCountDown(debate_num);
	}
	
}
