package com.finalp.moim.teampage.teamboard.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalp.moim.teampage.teamboard.model.vo.TeamBoard;

@Repository("teamboardDao")
public class TPteamboardDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public ArrayList<TeamBoard> selectTeamBoardList(int team_num){
		List<TeamBoard> list = session.selectList("teamboardMapper.selectTeamBoardList", team_num);
		return (ArrayList<TeamBoard>)list;
	}
	
	public TeamBoard selectTeamBoard(int tn_no) {
		return session.selectOne("teamboardMapper.selectTeamBoard", tn_no);
	}
	
	public int updateTeamBoard(TeamBoard teamboard) {
		return session.update("teamboardMapper.updateTeamBoard", teamboard);
	}
	
	public int deleteTeamBoard(int tn_no) {
		return session.delete("teamboardMapper.deleteTeamBoard", tn_no);
	}

	public int insertTeamBoard(TeamBoard teamboard) {
		// TODO Auto-generated method stub
		return session.insert("teamboardMapper.insertTeamBoard", teamboard);
	}
	public ArrayList<TeamBoard> selectBoardTopList(int team_num) {
		List<TeamBoard> list = session.selectList("teamboardMapper.selectBoardTopList", team_num);
		return (ArrayList<TeamBoard>)list;
	}
}
