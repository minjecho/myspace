package com.finalp.moim.teampage.calendar.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalp.moim.teampage.calendar.model.dao.TPteamcalendarDao;
import com.finalp.moim.teampage.calendar.model.vo.Calendar;

@Service("teamcalendarService")
public class TPteamcalendarServiceImpl implements TPteamcalendarService {
	
	@Autowired
	private TPteamcalendarDao tpteamcalendarDao;
	
	@Override
	public ArrayList<Calendar> selectCalendarList(int team_num) {
		return tpteamcalendarDao.selectCalendarList(team_num);
	}

	@Override
	public int insertCalendar(Calendar cal) {
		return tpteamcalendarDao.insertCalendar(cal);
	}

	@Override
	public int deleteCalendar(int cal_no) {
		return tpteamcalendarDao.deleteCalendar(cal_no);
	}

	@Override
	public int updateCalendar(Calendar cal) {
		return tpteamcalendarDao.updateCalendar(cal);
	}

}
