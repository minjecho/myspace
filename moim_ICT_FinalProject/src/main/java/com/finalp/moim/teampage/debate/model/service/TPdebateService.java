package com.finalp.moim.teampage.debate.model.service;

import java.util.ArrayList;

import com.finalp.moim.teampage.debate.model.vo.Debate;
import com.finalp.moim.teampage.debate.model.vo.DebateComment;

public interface TPdebateService {

	ArrayList<Debate> selectAll(int team_num);
	int insertdebate(Debate debate);
	Debate selectDebate(int debate_num);
	ArrayList<DebateComment> selectDebateCommentList(int debate_num);
	int updatedebate(Debate debate);
	int deleteDebateCommentAll(int debate_num);
	int deleteDebate(int debate_num);
	int insertDebateComment(DebateComment dcomment);
	int updateDebateCommentCountUp(int debate_num);
	int deleteDebateComment(int debate_comment_num);
	int updateDebateCommentCountDown(int debate_num);

}
