package com.finalp.moim.teampage.debate.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalp.moim.teampage.debate.model.vo.Debate;
import com.finalp.moim.teampage.debate.model.vo.DebateComment;

@Repository("tpdebateDao")
public class TPdebateDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public TPdebateDao() {}

	public ArrayList<Debate> selectList(int team_num) {
		List<Debate> list = session.selectList("debateMapper.selectAll", team_num);
		return (ArrayList<Debate>)list;
	}

	public int insertdebate(Debate debate) {
		return session.insert("debateMapper.insertdebate", debate);
	}

	public Debate selectDebate(int debate_num) {
		return session.selectOne("debateMapper.selectDebate", debate_num);
	}

	public ArrayList<DebateComment> selectDebateCommentList(int debate_num) {
		List<DebateComment> list = session.selectList("debateMapper.selectDebateCommentList", debate_num);
		return (ArrayList<DebateComment>)list;
	}

	public int updateDebate(Debate debate) {
		return session.update("debateMapper.updateDebate", debate);
	}

	public int deleteDebateCommentAll(int debate_num) {
		return session.delete("debateMapper.deleteDebateCommentAll", debate_num);
	}

	public int deleteDebate(int debate_num) {
		return session.delete("debateMapper.deleteDebate", debate_num);
	}

	public int insertDebateComment(DebateComment dcomment) {
		return session.insert("debateMapper.insertDebateComment", dcomment);
	}

	public int updateDebateCommentCountUp(int debate_num) {
		return session.update("debateMapper.updateDebateCommentCountUp", debate_num);
	}

	public int deleteDebateComment(int debate_comment_num) {
		return session.delete("debateMapper.deleteDebateComment", debate_comment_num);
	}

	public int updateDebateCommentCountDown(int debate_num) {
		return session.update("debateMapper.updateDebateCommentCountDown", debate_num);
	}
	
}
