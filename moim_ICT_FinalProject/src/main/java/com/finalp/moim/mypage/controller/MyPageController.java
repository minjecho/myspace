package com.finalp.moim.mypage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.finalp.moim.board.model.vo.Board;
import com.finalp.moim.mypage.model.service.MyPageService;
import com.finalp.moim.mypage.model.vo.MyBoard;
import com.finalp.moim.mypage.model.vo.MyPost;
import com.finalp.moim.review.model.vo.Review;
import com.finalp.moim.teampage.common.model.service.TPmainService;
import com.finalp.moim.teampage.common.model.vo.Team;
import com.finalp.moim.teampage.common.model.vo.TeamMember;
import com.finalp.moim.teampage.teammanage.model.service.TPmanageService;
import com.finalp.moim.userinfo.model.vo.UserInfo;

@Controller
public class MyPageController {

	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);

	// DI
	@Autowired
	private MyPageService mypageService;
	
	@Autowired
	private TPmainService tpmainService;
	
	@Autowired
	private TPmanageService tpmanageService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// 마이페이지 회원확인
	@RequestMapping("mypage.do")
	public String myPageForward(/*
			@RequestParam("userid") String userid, 
			ModelAndView mv, Object userinfoService*/) {
		
/*		UserInfo userInfo = userinfoService.selectUserInfo(userid);*/
		return "myPage/myPage";  //내보낼 뷰파일명 리턴
	}
	
	// 내 정보 보기
	@RequestMapping(value="uinfo.do", method=RequestMethod.POST)
	public String userInfoForward(@RequestParam("user_pwd") String user_pwd, HttpSession session, Model model) {
		String ogpwd = ((UserInfo)session.getAttribute("loginMember")).getUser_pwd();
		if(bcryptPasswordEncoder.matches(user_pwd, ogpwd)) {
			return "myPage/userInfo";  //내보낼 뷰파일명 리턴
		}else {
			model.addAttribute("message", "비밀번호가 정확하지 않습니다");
			return "common/error";
		}
		
	}
	// 회원 수정하기
	@RequestMapping("uupdate.do")
	public String userUpdateForward() {
		System.out.println("업데이트로 이동");
		return "myPage/userUpdate";  //내보낼 뷰파일명 리턴
	}
	
	// 회원 탈퇴하기
		@RequestMapping("udeletePage.do")
		public String userDeletePage() {
			return "myPage/userDelete";  //내보낼 뷰파일명 리턴
		}
	
	// 회원 탈퇴하기
	@RequestMapping(value = "udelete.do", method = RequestMethod.POST)
	public ModelAndView userDeleteForward(ModelAndView mv, @RequestParam("user_no") int user_no) {
		if(mypageService.deleteUser(user_no) > 0) {
			mv.addObject("message", "탈퇴가 완료되었습니다.");
			mv.setViewName("redirect:logout.do");
		} else {
			mv.addObject("message", user_no + "번 회원 탈퇴처리 실패");
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
	// 내가 쓴 글 보기
	@RequestMapping("upost.do")
	public ModelAndView userPostForward(ModelAndView mv, HttpSession session, @RequestParam(name="page", required=false) String page) {
		
			UserInfo loginMember = (UserInfo) session.getAttribute("loginMember");
			int user_no = loginMember.getUser_no();
		
			int currentPage = 1;
			if(page != null) {
				currentPage = Integer.parseInt(page);
			}
			
			
			
			int limit = 10;
			int listCount = mypageService.selectMyBoardCount(user_no);
			
			int maxPage = (int)((double)listCount / limit + 0.9);
			int startPage = (int)((double)currentPage / limit + 0.9);
			int endPage = startPage + 10 - 1;
			if(maxPage < endPage) {
				endPage = maxPage;
			}
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			MyBoard mb = new MyBoard(startRow, endRow, user_no);
			
			ArrayList<Board> blist = mypageService.selectMyBoard(mb);
			
			
				mv.addObject("blist", blist);
				mv.addObject("listCount", listCount);
				mv.addObject("maxPage", maxPage);
				mv.addObject("currentPage", currentPage);
				mv.addObject("startPage", startPage);
				mv.addObject("endPage", endPage);
				mv.addObject("limit", limit);
				mv.addObject("startRow", startRow);
				mv.addObject("endRow", endRow);
				
				mv.setViewName("myPage/userPost");
			
			
			return mv;
		}
		
	
	@RequestMapping("upost2.do")
	public ModelAndView userPostForward2(ModelAndView mv, @RequestParam(name="page", required=false) String page,
			@RequestParam(name="user_nn") String user_nn) {
		
			int currentPage = 1;
			if(page != null) {
				currentPage = Integer.parseInt(page);
			}
			
			
			
			int limit = 10;
			int listCount = mypageService.selectMyReviewCount(user_nn);
			
			int maxPage = (int)((double)listCount / limit + 0.9);
			int startPage = (int)((double)currentPage / limit + 0.9);
			int endPage = startPage + 10 - 1;
			if(maxPage < endPage) {
				endPage = maxPage;
			}
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			MyPost mp = new MyPost(startRow, endRow, user_nn);
			
			ArrayList<Review> rlist = mypageService.selectMyReview(mp);
			
			
				mv.addObject("rlist", rlist);
				mv.addObject("listCount", listCount);
				mv.addObject("maxPage", maxPage);
				mv.addObject("currentPage", currentPage);
				mv.addObject("startPage", startPage);
				mv.addObject("endPage", endPage);
				mv.addObject("limit", limit);
				mv.addObject("startRow", startRow);
				mv.addObject("endRow", endRow);
				
				mv.setViewName("myPage/userPost2");
			return mv;
		}
		
	
	
	
	
	// 내 팀 보기
	@RequestMapping("uteam.do")
	public String userTeamForward(HttpSession session, SessionStatus status, Model model) {
		
		UserInfo userinfo = (UserInfo) session.getAttribute("loginMember");
		ArrayList<TeamMember> myteamlist = tpmainService.selectMyTeamList(userinfo.getUser_no());
		int mtlistlength = myteamlist.size();
		ArrayList<Team> teamsettinglist = new ArrayList<Team>();
		for(int i=0; i<mtlistlength; i++) {
			Team team = tpmanageService.selectTeamSetting(myteamlist.get(i).getTeam_num());
			teamsettinglist.add(team);
		}
		
		model.addAttribute("myteamlist", myteamlist);
		model.addAttribute("mtlistlength",mtlistlength);
		model.addAttribute("teamsettinglist",teamsettinglist);
		
		return "myPage/userTeam";  //내보낼 뷰파일명 리턴
	}

}
