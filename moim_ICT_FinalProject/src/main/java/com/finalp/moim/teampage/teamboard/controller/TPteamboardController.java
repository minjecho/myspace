package com.finalp.moim.teampage.teamboard.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.finalp.moim.teampage.common.model.service.TPmainService;
import com.finalp.moim.teampage.common.model.vo.TeamMember;
import com.finalp.moim.teampage.teamboard.model.service.TPteamboardService;
import com.finalp.moim.teampage.teamboard.model.vo.TeamBoard;
import com.finalp.moim.teampage.teammanage.model.service.TPmanageService;

@Controller
public class TPteamboardController {
	private static final Logger logger = LoggerFactory.getLogger(TPteamboardController.class);
	
	@Autowired
	private TPteamboardService tpteamboardService;
	
	@Autowired
	private TPmanageService tpmanageService;
	
	@Autowired
	private TPmainService tpmainService;
	
	@RequestMapping("moveTPteamboard.do")
	public String moveTPTeamboardPage(@RequestParam("team_num") int team_num, Model model) {
		ArrayList<TeamBoard> tblist = tpteamboardService.selectTeamBoardList(team_num);
		if (tblist != null) {	
			int tblistlength = tblist.size();
			model.addAttribute("tblistlength", tblistlength);
			model.addAttribute("tblist", tblist);
			return "teampage/teamboard/tp_teamboard";
		} else {
			model.addAttribute("message", team_num + "팀 공지 목록 조회 실패.");
			return "common/error";
		}
	}
	
	@RequestMapping(value="selectTN.do", method=RequestMethod.POST)
	@ResponseBody
	public String selectTeamBoard(@RequestParam("tn_no") int tn_no) {
		TeamBoard tb = tpteamboardService.selectTeamBoard(tn_no);
		logger.info("tb : " + tb);
		
		// 전송용 json 객체 준비
		JSONObject sendJson = new JSONObject();
		// list 옮길 json 배열 준비
		JSONArray jarr = new JSONArray();
		
		JSONObject job = new JSONObject();
		
		job.put("tn_no", tb.getTn_no());
		job.put("team_num", tb.getTeam_num());
		job.put("tn_writer", tb.getUserVO().getUser_nn());
		job.put("tn_title", tb.getTn_title());
		job.put("tn_content", tb.getTn_content());
		job.put("tn_date", tb.getTn_date().toString());
		job.put("tn_originalfilename", tb.getTn_originalfilename());
		job.put("tn_renamefilename", tb.getTn_renamefilename());

		// job 를 jarr 에 저장
		jarr.add(job);
		// 전송용 json 객체에 jarr 담음
		sendJson.put("list", jarr);
		
		return sendJson.toJSONString();	// jsonView 가 리턴됨
	}
	
	@RequestMapping(value = "teamboardinsert.do", method = RequestMethod.POST)
	public String teamboardInsertMethod(TeamBoard teamboard, HttpServletRequest request, Model model,
			@RequestParam(name="upfile", required=false) MultipartFile mfile) {
		System.out.println("teamnum : " + teamboard.getTeam_num());
		//업로드된 파일 저장폴더 저장
		String savePath = request.getSession().getServletContext().getRealPath("resources/team_page/teamboard_upfiles");
		
		//첨부파일이 있을때만 업로드된 파일을 지정 폴더로 옮기기
		if(!mfile.isEmpty()) {
			String fileName = mfile.getOriginalFilename();
			if(fileName != null && fileName.length() > 0) {
				try {
					mfile.transferTo(new File(savePath + "\\" + fileName));
					//파일의 이름 바꾸기
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					
					// 변경할 파일명 만들기
					String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
					// 원본 파일의 확장자를 추출해서, 변경 파일명에 붙여줌
					renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);
					
					// 파일명 바꾸기 실행함 : java.io.File 을 이용함
					File originFile = new File(savePath + "\\" + fileName);
					File renameFile = new File(savePath + "\\" + renameFileName);
					
					if (!originFile.renameTo(renameFile)) {
						// renameTo() 메소드가 실패한 경우(false)
						// 직접 수동으로 바꾸기함
						// 원본 파일 읽어서 파일복사하고,
						// 원본 파일 삭제로 처리함

						FileInputStream fin = new FileInputStream(originFile);
						FileOutputStream fout = new FileOutputStream(renameFile);

						int data = -1;
						byte[] buffer = new byte[1024];

						while ((data = fin.read(buffer, 0, buffer.length)) != -1) {
							fout.write(buffer, 0, buffer.length);
						}

						fin.close();
						fout.close();
						originFile.delete(); // 원본 파일 삭제함
					} // 직접 이름바꾸기
					
					teamboard.setTn_renamefilename(renameFileName);
					
				} catch(Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "파일저장 실패");
					return "common/error";
				}
			} //업로드된 파일이 있다면....
			
			teamboard.setTn_originalfilename(mfile.getOriginalFilename());
			logger.info("teamboardinsert.do : " + teamboard);
		}//첨부파일이 있을때
		
		if(tpteamboardService.insertTeamBoard(teamboard)>0) {
			ArrayList<TeamMember> tmlist = tpmanageService.selectTeamMemberNormalList(teamboard.getTeam_num());
			
			int result = 0;
			
			for(TeamMember tm : tmlist) {
				tpmainService.insertAlertTBInsert(tm);
				result++;
			}
			
			logger.info("alertinsert result : " + result);
			
			return "redirect: moveTPteamboard.do?team_num=" + teamboard.getTeam_num();
		}else {
			model.addAttribute("message", "공지글 등록 실패");
			return "common/error";
		}
	}
	
	@RequestMapping("teamboarddelete.do")
	public String teamboardDeleteMethod(@RequestParam("tn_no") String tnno,  
			@RequestParam("team_num") String teamnum, 
			@RequestParam(name="tn_renamefilename", required=false) String tn_renamefilename,
			HttpServletRequest request, Model model) {
	  int tn_no = Integer.parseInt(tnno);
	  int team_num = Integer.parseInt(teamnum);
		
	  if (tpteamboardService.deleteTeamBoard(tn_no) > 0) { // 글삭제 성공하면 저장폴더에 첨부파일도 삭제 처리 
		  if (tn_renamefilename != null) { 
			  new File(request.getSession().getServletContext().getRealPath("resources/team_page/teamboard_upfiles") + "\\" +
					  	tn_renamefilename).delete(); 
		  }
	  
		  	  return "redirect: moveTPteamboard.do?team_num=" + team_num; 
	  } else {
			  model.addAttribute("message", "글 삭제 실패."); 
			  return "common/error"; 
	  }
	}
	
	// 첨부파일 다운로드 요청 처리용
	@RequestMapping("tndown.do")
	public ModelAndView fileDownMethod(HttpServletRequest request, @RequestParam("ofile") String originFileName,
			@RequestParam("rfile") String renameFileName, ModelAndView mv) {

		String savePath = request.getSession().getServletContext().getRealPath("resources/team_page/teamboard_upfiles");
		// 저장 폴더에서 파일 읽기 위해 경로 포함
		File renameFile = new File(savePath + "\\" + renameFileName);
		// response 에 다운 파일명 등록용 (경로 제외)
		File originalFile = new File(originFileName);

		mv.setViewName("filedown");
		mv.addObject("renameFile", renameFile);
		mv.addObject("originalFile", originalFile);

		return mv;
	}
}
