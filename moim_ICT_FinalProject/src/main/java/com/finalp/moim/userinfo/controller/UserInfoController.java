package com.finalp.moim.userinfo.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.finalp.moim.common.Page;
import com.finalp.moim.userinfo.model.service.UserInfoService;
import com.finalp.moim.userinfo.model.vo.UserInfo;

@Controller
public class UserInfoController {
	// Logger
	private static final Logger logger = LoggerFactory.getLogger(UserInfoController.class);
	
	// DI
	@Autowired
	private UserInfoService userinfoService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	// 로그인
	@RequestMapping(value="login.do", method = RequestMethod.POST)
	public String loginMethod(UserInfo userInfo, String currentUrl, HttpSession session, 
			SessionStatus status, Model model) {
		UserInfo loginMember = userinfoService.selectLogin(userInfo);
		
		if(loginMember != null && bcryptPasswordEncoder.matches(userInfo.getUser_pwd(), loginMember.getUser_pwd())
				&& loginMember.getLogin_ok().equals("Y")) {
			session.setAttribute("loginMember", loginMember);
			status.setComplete();
			
			return "redirect:main.do";
		} else {
			model.addAttribute("message", "로그인 실패!");
			
			return "redirect:main.do";
		}
	}
	
	//아이디 중복체크 확인을 위한 ajax 요청 처리용 메소드
		@RequestMapping(value="idchk.do", method=RequestMethod.POST)
		public void idCheckMethod(
				@RequestParam("user_id") String user_id, 
				HttpServletResponse response) throws IOException {
			//String userid = request.getParameter("userid");
				
			int idcount = userinfoService.selectCheckId(user_id);
				
			String returnValue = null;
			if(idcount == 0) {
				returnValue = "ok";
			}else {
				returnValue = "dup";
			}
				
			//response 를 이용해서 클라이언트로 출력스트림 만들고
			//값 보내기
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.append(returnValue);
			out.flush();
			out.close();

	}
		

		//닉네임 중복체크 확인을 위한 ajax 요청 처리용 메소드
		@RequestMapping(value="nnchk.do", method=RequestMethod.POST)
		public void nnCheckMethod(
				@RequestParam("user_nn") String user_nn, 
				HttpServletResponse response) throws IOException {
			//String usernn = request.getParameter("usernn");
				
			int nncount = userinfoService.selectCheckNn(user_nn);
				
			String returnValue = null;
			if(nncount == 0) {
				returnValue = "ok";
			}else {
				returnValue = "dup";
			}
				
			//response 를 이용해서 클라이언트로 출력스트림 만들고
			//값 보내기
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.append(returnValue);
			out.flush();
			out.close();
	}
	
	// 로그아웃
	@RequestMapping("logout.do")
	public String logoutMethod(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			session.invalidate();
			
			return "redirect: main.do";
		} else {
			model.addAttribute("message", "로그인 세션이 존재하지 않습니다.");
			
			return "common/error";
		}
	}
	
	//회원가입
	@RequestMapping("enrollPage.do")
	public String moveEnrollPage() {
		return "loginPage/enrollPage";
	}
	
	@RequestMapping(value="enroll.do", method=RequestMethod.POST)
	public String moveUserInsert(UserInfo userInfo, Model model) {
		logger.info("enroll.do : " + userInfo);
		
		System.out.println(userInfo.getUser_pwd());
		//패스워드 암호화 처리
		userInfo.setUser_pwd(bcryptPasswordEncoder.encode(userInfo.getUser_pwd()));
				
			if(userinfoService.insertUserInfo(userInfo) > 0) {
					return "redirect: main.do";  
			}else {
				model.addAttribute("message", "회원 가입 실패!");
				return "common/error";
			}		
	}
	
	//아이디 찾기
	@RequestMapping("sid.do")
	public String moveSearchId() {
		return "loginPage/searchId"; 
	}
	
	//아이디 찾기 결과 1
	@RequestMapping(value = "rid1.do", method = RequestMethod.POST)
	public ModelAndView moveResultId(ModelAndView mv, UserInfo userinfo) {
		UserInfo result = userinfoService.searchId1(userinfo);
		
		if(result != null) { 
			mv.addObject("check", 0);
			mv.addObject("result", result);
			mv.setViewName("loginPage/resultId");
		} else { 
			mv.addObject("check", 1);
			mv.setViewName("loginPage/resultId");
		}
		
		return mv;
	}
	
	//아이디 찾기 결과 2
	@RequestMapping(value = "rid2.do", method = RequestMethod.POST)
	public ModelAndView moveResultId2(ModelAndView mv, UserInfo userinfo) {
		UserInfo result = userinfoService.searchId2(userinfo);
		
		if(result != null) { 
			mv.addObject("check", 0);
			mv.addObject("result", result);
			mv.setViewName("loginPage/resultId");
		} else { 
			mv.addObject("check", 1);
			mv.setViewName("loginPage/resultId");
		}
		
		return mv;
	}
	
	
	//비밀번호 찾기
	@RequestMapping("spw.do")
	public String moveSearchPassword() {
		return "loginPage/searchPassword";
	}
	
	//비밀번호 찾기결과
	@RequestMapping(value = "rpwPage.do", method = RequestMethod.POST)
	public ModelAndView moveResultPassword(ModelAndView mv, UserInfo userinfo) {
		UserInfo originUser = userinfoService.selectUserInfo(userinfo);
		
		if(originUser != null) { 
			mv.addObject("check", 0);
			mv.addObject("result", originUser);
			mv.setViewName("loginPage/resultPassword");
		} else { 
			mv.addObject("check", 1);
			mv.setViewName("loginPage/resultPassword");
		}
		
		return mv;
	}
	
	//비밀번호 재설정
	@RequestMapping(value="rpw.do", method=RequestMethod.POST)
	public ModelAndView updatePassword(ModelAndView mv, @RequestParam("user_pwd") String user_pwd, 
			@RequestParam("user_no") int user_no) {
		logger.info("rpw.do : " + user_pwd);
		
		System.out.println(user_pwd);
		UserInfo before = userinfoService.selectUser(user_no);
		UserInfo after = before;
		if(user_pwd != null && user_pwd.length() > 0) {
			String originUserPwd = before.getUser_pwd();
			//기존 암호와 다른 값이면
			if(!bcryptPasswordEncoder.matches(user_pwd, originUserPwd)) {
				after.setUser_pwd(bcryptPasswordEncoder.encode(user_pwd));
			}
		}
//		else {
//			//새로운 암호가 없다면, 원래 암호를 기록함
//			userInfo.setUser_pwd(user_pwd);
//		}
			
		logger.info("after : " + after);
		
		if(userinfoService.updatePwd(after) > 0) {
//			mv.addObject("message", "비밀번호가 변경되었습니다. 다시 로그인 해주세요.");
			mv.setViewName("redirect: main.do");
		}else {
			mv.addObject("message", before.getUser_id() + "회원 비밀번호 변경 실패!");
			mv.setViewName("common/error");
		}	
		
		return mv;
	}
	
	// 관리자 페이지 - 회원관리 페이지로 이동
	@RequestMapping("ulistadmin.do")
	public ModelAndView adminUerListMethod(ModelAndView mv, @RequestParam(name="page", required=false) String page, 
			@RequestParam("admin_no") int admin_no) {
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		int limit = 10;
		int listCount = userinfoService.selectListCount() - 2;
		
		int maxPage = (int)((double)listCount / limit + 0.9);
		int startPage = (int)((double)currentPage / limit + 0.9);
		int endPage = startPage + 10 - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		Page paging = new Page(startRow, endRow);
		
		ArrayList<UserInfo> list = userinfoService.selectUserList();
		
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getUser_no() < 1) {
				list.remove(i);
			}
			
			if(list.get(i).getUser_no() == admin_no) {
				list.remove(i);
			}
		}
		
		if(list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("listCount", listCount);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("limit", limit);
			mv.addObject("startRow", startRow);
			mv.addObject("endRow", endRow);
			mv.addObject("admin_no", admin_no);
			
			mv.setViewName("admin/AdminUserList");
		} else {
			mv.addObject("message", currentPage + "회원 정보 목록 조회 실패!");
			
			mv.setViewName("common/error");
		}
		
		return mv;
	}
		
	// 관리자 페이지 - 회원 로그인 가능 여부 변경
	@RequestMapping("loginOKadmin.do")
	public ModelAndView userLoginOKMethod(ModelAndView mv, @RequestParam("user_no") int user_no, 
			@RequestParam("page") int currentPage, @RequestParam("login_ok") String login_ok, 
			@RequestParam("admin_no") int admin_no) {
		UserInfo userInfo = userinfoService.selectUser(user_no);
		
		userInfo.setLogin_ok(login_ok);
		
		if(userinfoService.updateUserLoginOK(userInfo) > 0) {
			mv.addObject("page", currentPage);
			mv.addObject("admin_no", admin_no);
			
			mv.setViewName("redirect:ulistadmin.do");
		} else {
			mv.addObject("message", user_no + "번 회원 로그인 가능 여부 변경 실패");
			
			mv.setViewName("common/error");
		}
		
		return mv;
	}
		
	// 관리자 페이지 - 회원 관리자 여부 변경
	@RequestMapping("userchangeadmin.do")
	public ModelAndView userAdminChangeMethod(ModelAndView mv, @RequestParam("user_no") int user_no, 
			@RequestParam("page") int currentPage, @RequestParam("admin") String admin, 
			@RequestParam("admin_no") int admin_no) {
		UserInfo userInfo = userinfoService.selectUser(user_no);
		
		userInfo.setAdmin(admin);
		
		if(userinfoService.updateUserAdmin(userInfo) > 0) {
			mv.addObject("page", currentPage);
			mv.addObject("admin_no", admin_no);
			
			mv.setViewName("redirect:ulistadmin.do");
		} else {
			mv.addObject("message", user_no + "번 회원 관리자 권한 부여 실패");
			
			mv.setViewName("common/error");
		}
		
		return mv;
	}
		
	// 관리자 페이지 - 회원 정보 검색
	@RequestMapping(value = "usearch.do", method = RequestMethod.POST)
	public ModelAndView userSearchMethod(ModelAndView mv, @RequestParam("category_no") int category_no,
			@RequestParam("keyword") String keyword, @RequestParam(name="page", required=false) String page, 
			@RequestParam("admin_no") int admin_no) {
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		int limit = 10;
		int listCount = userinfoService.selectListCount() - 2;
		
		int maxPage = (int)((double)listCount / limit + 0.9);
		int startPage = (int)((double)currentPage / limit + 0.9);
		int endPage = startPage + 10 - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		Page paging = new Page(startRow, endRow);
		
		ArrayList<UserInfo> list = userinfoService.selectUserSearch(category_no, keyword);
		
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getUser_no() < 1) {
				list.remove(i);
			}
			
			if(list.get(i).getUser_no() == admin_no) {
				list.remove(i);
			}
		}
		
		if(list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("listCount", listCount);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("limit", limit);
			mv.addObject("startRow", startRow);
			mv.addObject("endRow", endRow);
			mv.addObject("admin_no", admin_no);
			
			mv.setViewName("admin/AdminUserList");
		} else {
			mv.addObject("message", currentPage + "회원 정보 목록 조회 실패!");
			
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
	@RequestMapping(value="updateUserinfo.do", method=RequestMethod.POST)
	public String userinfoupdateMethod(UserInfo userinfo, Model model, HttpSession session,
			@RequestParam("newuser_pwd") String newuser_pwd) {
		int user_no = userinfo.getUser_no();
		//새로운 암호가 왔는지 체크하기
		UserInfo oguserinfo = userinfoService.selectUser(user_no);
		//같은 암호가 왔거나, 암호에 아무것도 입력하지 않았다면
		if(newuser_pwd=="" || bcryptPasswordEncoder.matches(newuser_pwd, oguserinfo.getUser_pwd())) {
			userinfo.setUser_pwd(oguserinfo.getUser_pwd()); //암호 원래 암호로 변경
		}else {
			userinfo.setUser_pwd(bcryptPasswordEncoder.encode(newuser_pwd)); //새로운암호를 암호화해서 입력
		}
		
		//변경 후에 update작업 진행
		if(userinfoService.updateUserInfo(userinfo)>0) {
			//update한 후에는 session의 userinfo도 변경
			UserInfo newuserinfo = userinfoService.selectUser(user_no); //새로운 user 객체 가지고옴
			session.setAttribute("loginMember", newuserinfo); //새롭게 overwrite
			return "common/main"; //홈페이지 이동
		}else {
			model.addAttribute("message", "회원정보 수정 실패");
			return "common/error";
		}
		
	}
		
	// 관리자 페이지 - 회원 강제 탈퇴
	@RequestMapping("userdelete.do")
	public ModelAndView userDeleteMethod(ModelAndView mv, @RequestParam("user_no") int user_no, 
			@RequestParam("page") int currentPage, @RequestParam("admin_no") int admin_no) {
		System.out.println("user_no : " + user_no);
		
		if(userinfoService.deleteUserAdmin(user_no) > 0) {
			mv.addObject("page", currentPage);
			mv.addObject("admin_no", admin_no);
			mv.setViewName("redirect:ulistadmin.do");
		} else {
			mv.addObject("message", user_no + "번 회원 탈퇴처리 실패");
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	// -----------------------------------------
}
