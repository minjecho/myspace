package com.finalp.moim.teampage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.finalp.moim.teampage.common.model.service.TPmainService;
import com.finalp.moim.teampage.common.model.vo.Alert;
import com.finalp.moim.teampage.common.model.vo.Team;
import com.finalp.moim.teampage.common.model.vo.TeamMember;
import com.finalp.moim.teampage.daily.model.service.TPteamdailyService;
import com.finalp.moim.teampage.daily.model.vo.TeamDaily;
import com.finalp.moim.teampage.file.model.service.FileService;
import com.finalp.moim.teampage.file.model.vo.TFile;
import com.finalp.moim.teampage.teamboard.model.service.TPteamboardService;
import com.finalp.moim.teampage.teamboard.model.vo.TeamBoard;
import com.finalp.moim.teampage.teammanage.model.service.TPmanageService;
import com.finalp.moim.userinfo.model.vo.UserInfo;

@Controller
public class TPmainController {
	private static final Logger logger = LoggerFactory.getLogger(TPmainController.class);
	
	@Autowired
	private TPmanageService tpmanageService;
	
	@Autowired
	private TPteamboardService tpboardService;
	
	@Autowired
	private TPmainService tpmainService;
	
	@Autowired
	private TPteamdailyService tpteamdailyService;
	
	@Autowired
	private FileService fileService;

	// 뷰 페이지 이동 처리용 -------------------------------
	@RequestMapping("moveTPindex.do")
	public String moveTPMainPage(Model model, HttpSession session, SessionStatus status,
			@RequestParam("team_num") int team_num) {
		Team team = tpmanageService.selectTeamSetting(team_num);
		ArrayList<TeamBoard> boardtoplist = tpboardService.selectBoardTopList(team_num);
		ArrayList<TFile> filerecentlist = fileService.selectFileRecentList(team_num);
		UserInfo userinfo = (UserInfo) session.getAttribute("loginMember");
		TeamMember teammember = new TeamMember();
		teammember.setTeam_num(team_num);
		teammember.setUser_no(userinfo.getUser_no());
		teammember = tpmanageService.selectUserNoTeamMember(teammember);
		ArrayList<Alert> alertlist = tpmainService.selectAlertList(teammember.getTeam_member_no());
		ArrayList<TeamDaily> tdlist = tpteamdailyService.selectTeamDailyList(team_num);
		TeamMember teamleader = tpmanageService.selectTeamLeader(team_num);
		
		
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
		}
		
		if (team != null) {
			session.setAttribute("team_num", team_num);
			session.setAttribute("team_name", team.getTeam_name());
			session.setAttribute("team_leader", teammember.getTeam_member_leader());
			session.setAttribute("teammember", teammember);
			session.setAttribute("alertlist", alertlist);
			status.setComplete();
			model.addAttribute("team", team);
			model.addAttribute("boardtoplist", boardtoplist);
			model.addAttribute("filerecentlist", filerecentlist);
			model.addAttribute("planned", planned);
			model.addAttribute("inprogress", inprogress);
			model.addAttribute("complete", complete);
			model.addAttribute("teamleader", teamleader);
			return "teampage/TPindex";
		} else {
			model.addAttribute("message", team + "팀 정보 조회 실패.");
			return "common/error";
		}
	}
	
	@RequestMapping("moveMyTeamList.do")
	public String moveMTlistMethod(HttpSession session, SessionStatus status, Model model) {
		
		UserInfo userinfo = (UserInfo) session.getAttribute("loginMember");
		ArrayList<TeamMember> myteamlist = tpmainService.selectMyTeamList(userinfo.getUser_no());
		
		model.addAttribute("myteamlist", myteamlist);
		
		return "common/myteamlist";
	}
	
	@RequestMapping("exitTeampage.do")
	public String exitTeamPageMethod(HttpSession session, SessionStatus status, Model model) {
		
		session.removeAttribute("team_num");
		session.removeAttribute("team_leader");
		session.removeAttribute("teammember");
		session.removeAttribute("alertlist");
		
		return "redirect:main.do";
	}
	
	@RequestMapping("alertdelone.do")
	public String deleteAlertOneMethod(@RequestParam("alert_num") int alert_num, HttpSession session, HttpServletRequest request, Model model) {
		if(tpmainService.deleteAlertOne(alert_num) > 0) {
			int team_num = (int) session.getAttribute("team_num");
			model.addAttribute("team_num", team_num);
			return "redirect:" + request.getHeader("Referer");
		} else {
			model.addAttribute("message", alert_num + "번 해당 알람 삭제 실패.");
			return "common/error";
		}
	}
	
	@RequestMapping("alertdelall.do")
	public String deleteAlertAllMethod(@RequestParam("team_member_no") int team_member_no, HttpSession session, HttpServletRequest request, Model model) {
		if(tpmainService.deleteAlertAll(team_member_no) > 0) {
			int team_num = (int) session.getAttribute("team_num");
			model.addAttribute("team_num", team_num);
			return "redirect:" + request.getHeader("Referer");
		} else {
			model.addAttribute("message", team_member_no + "번 팀원의 알람 삭제 실패.");
			return "common/error";
		}
	}
	
	@RequestMapping("teamquit.do")
	public String teamQuitMethod(@RequestParam("team_member_no") int team_member_no, HttpSession session, Model model) {
		int team_num = (int) session.getAttribute("team_num");
		
		TeamMember teammember = new TeamMember();
		
		teammember.setTeam_member_no(team_member_no);
		teammember.setTeam_num(team_num);
		
		if(tpmainService.deleteAlertAll(teammember.getTeam_member_no()) >= 0 && tpmanageService.deleteTeamMember(teammember.getTeam_member_no()) > 0) {
			ArrayList<TeamMember> tmlist = tpmanageService.selectTeamMemberList(team_num);
			
			int alertresult = 0;
			UserInfo loginmember = (UserInfo) session.getAttribute("loginMember");
			
			for(TeamMember tm : tmlist) {
				Alert alert = new Alert();
				alert.setTeam_member_no(tm.getTeam_member_no());
				alert.setTeam_num(team_num);
				alert.setAlert_content(loginmember.getUser_nn() + " 님이 팀을 탈퇴하였습니다.");
				tpmainService.insertAlertTMquit(alert);
				alertresult++;
			}
			
			logger.info("alertinsert result : " + alertresult);
			
			session.removeAttribute("team_num");
			session.removeAttribute("team_name");
			session.removeAttribute("team_leader");
			session.removeAttribute("teammember");
			session.removeAttribute("alertlist");
			
			return "redirect:main.do";
		} else {
			model.addAttribute("message", team_member_no + "님, " + team_num + "에서의 탈퇴 실패.");
			return "common/error";
		}
	}
	
}
