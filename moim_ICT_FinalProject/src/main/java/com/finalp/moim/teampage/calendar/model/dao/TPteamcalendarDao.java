package com.finalp.moim.teampage.calendar.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalp.moim.teampage.calendar.model.vo.Calendar;

@Repository("teamcalendarDao")
public class TPteamcalendarDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public ArrayList<Calendar> selectCalendarList(int team_num) {
		List<Calendar> list = session.selectList("teamcalendarMapper.selectCalendarList", team_num);
		return (ArrayList<Calendar>)list;
	}

	public int insertCalendar(Calendar cal) {
		return session.insert("teamcalendarMapper.insertCalendar", cal);
	}

	public int deleteCalendar(int cal_no) {
		return session.delete("teamcalendarMapper.deleteCalendar", cal_no);
	}

	public int updateCalendar(Calendar cal) {
		return session.update("teamcalendarMapper.updateCalendar", cal);
	}

}
