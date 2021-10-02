package com.finalp.moim.teampage.calendar.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalp.moim.teampage.calendar.model.service.TPteamcalendarService;
import com.finalp.moim.teampage.calendar.model.vo.Calendar;

@Controller
public class TPcalendarController {
	private static final Logger logger = LoggerFactory.getLogger(TPcalendarController.class);
	
	@Autowired
	private TPteamcalendarService tpteamcalendarService;
	
	// 뷰 페이지 이동 처리용 -------------------------------
	@RequestMapping("moveTPcalendar.do")
	public String moveTPCalendarPage(@RequestParam("team_num") int team_num, Model model) {
		/* model.addAttribute("team_num", team_num); */
		return "teampage/calendar/tp_calendar";
	}
	
	@SuppressWarnings({ "unchecked" })
	@RequestMapping(value = "selectcalendarlist.do", method=RequestMethod.POST)
	@ResponseBody
	public String selectCalendarListMethod(@RequestParam("team_num") int team_num) throws UnsupportedEncodingException  {
		ArrayList<Calendar> clist = tpteamcalendarService.selectCalendarList(team_num);
		
		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Calendar cal : clist) {
			JSONObject job = new JSONObject();

			job.put("_id", cal.getCal_no());
			job.put("team_num", cal.getTeam_num());
			job.put("cal_writer", cal.getCal_writer());
			job.put("username", cal.getUserVO().getUser_nn());
			job.put("title", cal.getCal_title());
			job.put("start", cal.getCal_startdate().toString());
			job.put("end", cal.getCal_enddate().toString());
			job.put("description", cal.getCal_detail());
			
			jarr.add(job);
		}
		sendJson.put("clist", jarr);
		System.out.println(jarr);
		return sendJson.toJSONString();
	}
	
	@RequestMapping(value = "insertCalendar.do", method=RequestMethod.POST)
	@ResponseBody
	public String insertCalendarMethod(
						@RequestParam("team_num") String tnum,
						@RequestParam("cal_writer") String calwriter,
						@RequestParam("title") String caltitle,
						@RequestParam("start") String calstartdate,
						@RequestParam("end") String calenddate,
						@RequestParam("cal_detail") String caldetail) throws ParseException {
			String result;
		
			int team_num = Integer.parseInt(tnum);
			int cal_writer = Integer.parseInt(calwriter);
			System.out.println(calstartdate);
			System.out.println(calstartdate.getClass());
			System.out.println(calenddate);
			Date start_date = Date.valueOf(calstartdate);
			Date end_date = Date.valueOf(calenddate);
			
			System.out.println("startdate");
			System.out.println(start_date);
			System.out.println("enddate");
			System.out.println(end_date);
			
			Calendar cal = new Calendar();
			cal.setTeam_num(team_num);
			cal.setCal_writer(cal_writer);
			cal.setCal_title(caltitle);
			cal.setCal_startdate(start_date);
			cal.setCal_enddate(end_date);
			cal.setCal_detail(caldetail);
			
			JSONObject sendJson = new JSONObject();
			
			if(tpteamcalendarService.insertCalendar(cal)>0) {
				result = "insert success";
			}else {
				result = "insert error";
			}
			
			sendJson.put("result", result);
			return sendJson.toJSONString();
	}
	
	@RequestMapping(value = "deleteCalendar.do", method=RequestMethod.POST)
	@ResponseBody
	public String deleteCalendarMethod(@RequestParam("cal_no") int cal_no) {
		
		String result;
		JSONObject sendJson = new JSONObject();
		
		if(tpteamcalendarService.deleteCalendar(cal_no)>0) {
			result = "delete success";
		}else {
			result = "delete error";
		}
		
		sendJson.put("result", result);
		return sendJson.toJSONString();
	}
	
	@RequestMapping(value = "updateCalendar.do", method=RequestMethod.POST)
	@ResponseBody
	public String updateCalendarMethod(
						@RequestParam("cal_no") String calno,
						@RequestParam("team_num") String tnum,
						@RequestParam("cal_writer") String calwriter,
						@RequestParam("cal_title") String caltitle,
						@RequestParam("cal_startdate") String calstartdate,
						@RequestParam("cal_enddate") String calenddate,
						@RequestParam("cal_detail") String caldetail) throws ParseException {
			String result;
			int cal_no = Integer.parseInt(calno);
			int team_num = Integer.parseInt(tnum);
			int cal_writer = Integer.parseInt(calwriter);
			System.out.println(calstartdate);
			System.out.println(calstartdate.getClass());
			System.out.println(calenddate);
			Date start_date = Date.valueOf(calstartdate);
			Date end_date = Date.valueOf(calenddate);
			
			Calendar cal = new Calendar();
			cal.setCal_no(cal_no);
			cal.setTeam_num(team_num);
			cal.setCal_writer(cal_writer);
			cal.setCal_title(caltitle);
			cal.setCal_startdate(start_date);
			cal.setCal_enddate(end_date);
			cal.setCal_detail(caldetail);
			
			JSONObject sendJson = new JSONObject();
			
			if(tpteamcalendarService.updateCalendar(cal)>0) {
				result = "update success";
			}else {
				result = "update error";
			}
			
			sendJson.put("result", result);
			return sendJson.toJSONString();
	}
	
}
