package com.finalp.moim.teampage.daily.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.finalp.moim.teampage.common.model.vo.Team;
import com.finalp.moim.teampage.daily.model.service.TPteamdailyService;
import com.finalp.moim.teampage.daily.model.vo.TeamDaily;

@Controller
public class TPdailyController {
	private static final Logger logger = LoggerFactory.getLogger(TPdailyController.class);
	
	@Autowired
	private TPteamdailyService tpteamdailyService;
	
	// 뷰 페이지 이동 처리용 -------------------------------
	@RequestMapping("moveTPdaily.do")
	public String moveTPDailyPage(@RequestParam("team_num") int team_num, Model model) {
		ArrayList<TeamDaily> tdlist = tpteamdailyService.selectTeamDailyList(team_num);
		int inprogress = 0;
		int planned = 0;
		int complete = 0;
		if(tdlist != null) {
			
			for(TeamDaily td : tdlist) {
				if(td.getDaily_progress() == 1) {
					planned += 1;
				}else if(td.getDaily_progress() == 2) {
					inprogress += 1;
				}else {
					complete += 1;
				}
			}
			
			int tdlistlength = tdlist.size();
			model.addAttribute("tdlistlength", tdlistlength);
			model.addAttribute("tdlist", tdlist);
			model.addAttribute("planned", planned);
			model.addAttribute("inprogress", inprogress);
			model.addAttribute("complete", complete);
			return "teampage/daily/tp_daily";
		}else {
			model.addAttribute("message", team_num + "팀 일지 목록 조회 실패");
			return "common/error";
		}
	}
	
	@RequestMapping(value="tdinsert.do", method = RequestMethod.POST)
	public String insertTeamDailyMethod( 
			@RequestParam("team_num") int team_num, 
			@RequestParam("daily_writer") int daily_writer,
			@RequestParam("daily_content") String daily_content,
			@RequestParam("daily_date") String daily_date,
			Model model) throws ParseException {
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date parsed = transFormat.parse(daily_date);
		Date sdaily_date = new Date(parsed.getTime());
		
		TeamDaily teamdaily = new TeamDaily();
		teamdaily.setTeam_num(team_num);
		teamdaily.setDaily_writer(daily_writer);
		teamdaily.setDaily_content(daily_content);
		teamdaily.setDaily_date(sdaily_date);
		
		if(tpteamdailyService.insertTeamDaily(teamdaily)>0) {
			return "redirect: moveTPdaily.do?team_num=" + team_num;
		}else {
			model.addAttribute("message", "일지 등록 실패");
			return "common/error";
		}
	}
	
	@RequestMapping("updatedaily.do")
	public String dailyprogressUpdateMethod(@RequestParam("daily_no") int daily_no,
			@RequestParam("daily_progress") int daily_progress, Model model) {
		if(daily_progress == 1 || daily_progress == 2) {
			if(tpteamdailyService.updateDailyProgress(daily_no)>0) {
				return "redirect: moveTPdaily.do?team_num=1";
			}else {
				model.addAttribute("message", "dailyupdate실패");
				return "common/error";
			}
		}else {
			model.addAttribute("message", "progressvalue 3 이상");
			return "common/error";
		}
	}
	
	@RequestMapping("deletedaily.do")
	public String dailyprogressDeleteMethod(@RequestParam("daily_no") int daily_no, Model model) {
		if(tpteamdailyService.deleteDaily(daily_no)>0) {
			return "redirect: moveTPdaily.do?team_num=1";
		}else {
			model.addAttribute("message", "daily 삭제 실패");
			return "common/error";
		}
	}
}
