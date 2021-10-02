package com.finalp.moim.teampage.calendar.model.service;

import java.util.ArrayList;

import com.finalp.moim.teampage.calendar.model.vo.Calendar;

public interface TPteamcalendarService {
	ArrayList<Calendar> selectCalendarList(int team_num);
	int insertCalendar(Calendar cal);
	int deleteCalendar(int cal_no);
	int updateCalendar(Calendar cal);
	
}
