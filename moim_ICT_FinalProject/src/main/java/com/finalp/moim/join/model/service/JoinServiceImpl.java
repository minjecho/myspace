package com.finalp.moim.join.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalp.moim.join.model.dao.JoinDao;
import com.finalp.moim.join.model.vo.Join;
import com.finalp.moim.join.model.vo.SearchJoin;

@Service("joinService")
public class JoinServiceImpl implements JoinService {

	@Autowired
	JoinDao joinDao;
	
	@Override
	public int insertJoin(Join join) {
		return joinDao.insertJoin(join);
	}
	
	@Override
	public int selectTeamJoin(SearchJoin sj) {
		return joinDao.searchTeamJoin(sj);
	}
	
	@Override
	public int selectTeamMember(SearchJoin sj) {
		return joinDao.selectTeamMember(sj);
	}
}
