package com.finalp.moim.join.model.service;

import com.finalp.moim.join.model.vo.Join;
import com.finalp.moim.join.model.vo.SearchJoin;

public interface JoinService {
	int insertJoin(Join join);
	int selectTeamJoin(SearchJoin sj);
	int selectTeamMember(SearchJoin sj);
}
