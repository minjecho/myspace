package com.finalp.moim.teampage.debate.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalp.moim.teampage.debate.model.service.TPdebateService;
import com.finalp.moim.teampage.debate.model.vo.Debate;
import com.finalp.moim.teampage.debate.model.vo.DebateComment;
import com.finalp.moim.userinfo.model.vo.UserInfo;

@Controller
public class TPdebateController {
	private static final Logger logger = LoggerFactory.getLogger(TPdebateController.class);
	
	@Autowired
	private TPdebateService tpdebateService;
	
	@RequestMapping("moveDebate.do")
	public String moveDebatePage(Model model, HttpSession session) {
		int team_num = (int)session.getAttribute("team_num");
		ArrayList<Debate> list = tpdebateService.selectAll(team_num);
		
		if (list.size() >= 0) {
			model.addAttribute("list", list);
			return "teampage/debate/debate";
		} else {
			model.addAttribute("message", "등록된 정보가 없습니다.");
			return "common/error";
		}
	}
	
	@RequestMapping(value="tdeinsert.do", method = RequestMethod.POST)
	public String insertDebateMethod(Debate debate, HttpSession session, Model model) {
		UserInfo loginMember = (UserInfo) session.getAttribute("loginMember");
		int team_num = (int) session.getAttribute("team_num");
		
		debate.setUser_no(loginMember.getUser_no());
		debate.setTeam_num(team_num);
		
		if(tpdebateService.insertdebate(debate) > 0) {
			return "redirect: moveDebate.do";
		} else {
			model.addAttribute("message", debate.getDebate_title() + " 토론 글 등록 실패.");
			return "common/error";
		}
	}
	
	@RequestMapping("moveDebateDetail.do")
	public String moveDebateDetailPage(@RequestParam("debate_num") int debate_num, Model model) {
		Debate debate = tpdebateService.selectDebate(debate_num);
		ArrayList<DebateComment> dcommentlist = tpdebateService.selectDebateCommentList(debate_num);
		
		if(debate != null) {
			model.addAttribute("debate", debate);
			model.addAttribute("dcommentlist", dcommentlist);
			return "teampage/debate/debate_detail";
		} else {
			model.addAttribute("message", debate_num + " 번 조회 실패.");
			return "common/error";
		}
	}
	
	@RequestMapping(value="tdeupdate.do", method = RequestMethod.POST)
	public String updateDebateMethod(Debate debate, Model model) {
		if(tpdebateService.updatedebate(debate) > 0) {
			model.addAttribute("debate_num", debate.getDebate_num());
			return "redirect: moveDebateDetail.do";
		} else {
			model.addAttribute("message", debate.getDebate_num() + " 토론 글 수정 실패.");
			return "common/error";
		}
	}
	
	@RequestMapping(value="tdedelete.do", method=RequestMethod.POST)
	public String deleteDebateMethod(@RequestParam("debate_num") int debate_num, HttpSession session, Model model) {
		Debate debate = tpdebateService.selectDebate(debate_num);
		if(debate.getDebate_comment_count() > 0) {
			if(tpdebateService.deleteDebateCommentAll(debate_num) > 0 && tpdebateService.deleteDebate(debate_num) > 0) {
				return "redirect: moveDebate.do";
			}else {
				model.addAttribute("message", debate_num + " 번 토론 글 삭제 실패.");
				return "common/error";
			}
		}else {
			if(tpdebateService.deleteDebate(debate_num) > 0) {
				return "redirect: moveDebate.do";
			}else {
				model.addAttribute("message", debate_num + " 번 토론 글 삭제 실패.");
				return "common/error";
			}
		}
	}
	
	@RequestMapping(value="tdcinsert.do", method=RequestMethod.POST)
	public String insertDebateCommentMethod(DebateComment dcomment, HttpSession session, Model model) {
		UserInfo loginMember = (UserInfo) session.getAttribute("loginMember");
		
		dcomment.setUser_no(loginMember.getUser_no());
		
		if(tpdebateService.insertDebateComment(dcomment) > 0 && tpdebateService.updateDebateCommentCountUp(dcomment.getDebate_num()) > 0) {
			model.addAttribute("debate_num", dcomment.getDebate_num());
			return "redirect: moveDebateDetail.do";
		} else {
			model.addAttribute("message", "댓글 등록 실패.");
			return "common/error";
		}	
	}
	
	@RequestMapping("tdcdelete.do")
	public String deleteDebateCommentMethod(@RequestParam("debate_num") int debate_num, @RequestParam("debate_comment_num") int debate_comment_num, Model model) {
		if(tpdebateService.deleteDebateComment(debate_comment_num) > 0 && tpdebateService.updateDebateCommentCountDown(debate_num) > 0) {
			model.addAttribute("debate_num", debate_num);
			return "redirect: moveDebateDetail.do";
		} else {
			model.addAttribute("message", debate_comment_num + " 댓글 삭제 실패.");
			return "common/error";
		}
	}

}
