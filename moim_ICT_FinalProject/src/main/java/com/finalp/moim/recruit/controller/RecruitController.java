package com.finalp.moim.recruit.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.finalp.moim.common.Page;
import com.finalp.moim.recruit.model.service.RecruitService;
import com.finalp.moim.recruit.model.vo.Recruit;
import com.finalp.moim.recruit.model.vo.SearchRecruit;
import com.finalp.moim.review.controller.ReviewController;

@Controller
public class RecruitController {
	// Logger
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	// DI
	@Autowired
	RecruitService recruitService;

	// 구인페이지 이동 및 리스트 출력
	@RequestMapping("rclist.do")
	public ModelAndView recruitListMethod(ModelAndView mv, @RequestParam(name = "page", required = false) String page) {
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 페이징 처리
		int limit = 9; // 한 페이지에 출력할 목록 갯수
		// 페이지 계산을 위해 총 목록갯수 조회
		int listCount = recruitService.selectListCount();
		// 페이지 수 계산
		// 목록이 10개이면 총2페이지가 나오게 계산식 작성
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 시작값
		// 뷰페이지에 페이지 숫자를 10개씩 보여지게 한다면
		int startPage = (int) ((double) currentPage / 10 + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 끝값
		// 페이지 수가 10개이면
		int endPage = startPage + 10 - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		// 쿼리문에 전달할 현재 페이지에 출력할 목록의 첫행과 끝행
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		Page paging = new Page(startRow, endRow);

		ArrayList<Recruit> list = recruitService.selectList(paging);

		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("listCount", listCount);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("limit", limit);

			mv.setViewName("recruit/recruitMainPage");

		} else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패.");
			mv.setViewName("common/error");
		}

		return mv;

	}

	// 구인페이지 이동
	@RequestMapping("rcdetail.do")
	public ModelAndView recruitDetailMethod(ModelAndView mv, @RequestParam("team_num") int team_num,
			@RequestParam("page") int page) {

		// 게시글 조회
		Recruit recruit = recruitService.selectOne(team_num);

		if (recruit != null) {
			mv.addObject("recruit", recruit);
			mv.addObject("currentPage", page);
			mv.setViewName("recruit/recruitDetailView");
		} else {
			mv.addObject("message", team_num + "번 게시글 조회 실패.");
			mv.setViewName("common/error");
		}

		return mv;

	}

	// 구인페이지 작성폼
	@RequestMapping("rcwrite.do")
	public String recruitWriteForm() {
		return "recruit/recruitWriteForm";
	}

	// 파일 업로드 기능이 있는 게시글 등록 처리용
	@RequestMapping(value = "rcinsert.do", method = RequestMethod.POST)
	public String RecruitInsertMethod(Recruit recruit, HttpServletRequest request, Model model, 
			@RequestParam(name = "upfile", required = false) MultipartFile mfile) {
		// 업로드된 파일 저장 폴더 지정하기
		String savePath = request.getSession().getServletContext().getRealPath("resources/recruit_files");

		// 첨부파일이 있을때만 업로드된 파일을 지정 폴더로 옮기기
		if (!mfile.isEmpty()) {
			String fileName = mfile.getOriginalFilename();
			if (fileName != null && fileName.length() > 0) {
				try {
					mfile.transferTo(new File(savePath + "\\" + fileName));

					// 저장된 원본 파일의 이름 바꾸기 하려면...
					// 저장 폴더에 같은 이름의 파일이 있을 경우를 대비하기 위함
					// "년월일시분초.확장자" 형식으로 변경해 봄

					// 바꿀 파일명에 대한 문자열 만들기
					// 공지글 등록 요청 시점의 날짜정보를 이용함
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
					recruit.setTeam_rename_image(renameFileName);

				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "전송파일 저장 실패.");
					return "common/error";
				}

			} // 업로드된 파일이 있다면...
			recruit.setTeam_original_image(mfile.getOriginalFilename());

			logger.info("rcinsert.do : " + recruit);
		}

		if (recruitService.insertRecruit(recruit) > 0) {
			return "redirect:rclist.do";
		} else {
			model.addAttribute("message", "등록 실패.");
			return "common/error";
		}
	}

	// 구인페이지 수정페이지 업로드
	@RequestMapping("rcupview.do")
	public String recruitUpdateForm(@RequestParam("team_num") int team_num, @RequestParam("page") int currentPage,
			Model model) {
		Recruit recruit = recruitService.selectOne(team_num);

		if (recruit != null) {
			model.addAttribute("recruit", recruit);
			model.addAttribute("page", currentPage);
			return "recruit/recruitUpdateView";
		} else {
			model.addAttribute("message", team_num + "번 구인글 수정페이지로 이동 실패.");
			return "common/error";
		}

	}

	@RequestMapping(value = "rcupdate.do", method = RequestMethod.POST)
	public String recruitUpdateMethod(Recruit recruit, HttpServletRequest request, Model model,
			@RequestParam(name = "delflag", required = false) String delFlag,
			@RequestParam(name = "upfile", required = false) MultipartFile mfile, @RequestParam("team_num") int team_num, @RequestParam("page") int page) {

		// 업로드된 파일 저장 폴더 지정하기
		String savePath = request.getSession().getServletContext().getRealPath("resources/recruit_files");

		// 원래 첨부파일이 있는데, 삭제를 선택한 경우
		if (recruit.getTeam_original_image() != null && delFlag != null && delFlag.equals("yes")) {
			logger.info("첨부파일 있었는데 삭제 체크");
			// 저장 폴더에서 파일을 삭제함
			new File(savePath + "/" + recruit.getTeam_rename_image()).delete();
			recruit.setTeam_original_image(null);
			recruit.setTeam_rename_image(null);
		}

		// 새로운 첨부파일이 있을때
		if (!mfile.isEmpty()) {
			logger.info("새로운 첨부파일이 있을 때");
			// 저장 폴더의 이전 파일을 삭제함
			if (recruit.getTeam_original_image() != null) {
				logger.info("이전첨부파일 삭제");
				// 저장 폴더에서 파일을 삭제함
				new File(savePath + "\\" + recruit.getTeam_rename_image()).delete();
				recruit.setTeam_original_image(null);
				recruit.setTeam_rename_image(null);
			}

			String fileName = mfile.getOriginalFilename();
			if (fileName != null && fileName.length() > 0) {
				try {
					mfile.transferTo(new File(savePath + "\\" + fileName));

					// 저장된 첨부파일 이름 바꾸기
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

					// 변경할 파일명 만들기
					String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
					// 원본 파일의 확장자를 추출해서, 변경 파일명에 붙여줌
					renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);

					// 파일명 바꾸기 실행함 : java.io.File 을 이용함
					File originFile = new File(savePath + "\\" + fileName);
					File renameFile = new File(savePath + "\\" + renameFileName);

					if (!originFile.renameTo(renameFile)) {
						// 파일 이름바꾸기 실패시 직접 바꾸기
						FileInputStream fin = new FileInputStream(originFile);
						FileOutputStream fout = new FileOutputStream(renameFile);

						int data = -1;
						byte[] buffer = new byte[1024];

						while ((data = fin.read(buffer, 0, buffer.length)) != -1) {
							fout.write(buffer, 0, buffer.length);
						}

						fin.close();
						fout.close();
						originFile.delete(); // 저장된 원본 파일 삭제함
					} // 직접 이름바꾸기

					recruit.setTeam_rename_image(renameFileName);
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("message", "전송파일 저장 실패.");
					return "common/error";
				}

			} // 업로드된 파일이 있다면...
			
			recruit.setTeam_original_image(mfile.getOriginalFilename());
			
			logger.info("rcupdate.do : " + recruit);
		}

		if (recruitService.updateRecruit(recruit) > 0) {
			model.addAttribute("page", page);
			model.addAttribute("team_num", recruit.getTeam_num());
			logger.info("rcupdate.do : " + recruit);
			return "redirect:rcdetail.do?team_num=" + recruit.getTeam_num() + "&page=" + page;
		} else {
			model.addAttribute("message", recruit.getTeam_num() + "번 팀 구인글 수정 실패");
			return "common/error";
		}

	}
	
	@RequestMapping(value="rcsearch.do")
	public String recruitSearchMethod(HttpServletRequest request,Model model, 
			@RequestParam(name = "team_level", required = false) String team_level,
			@RequestParam(name = "field_name", required = false) String field_name,
			@RequestParam(name = "team_local", required = false) String team_local,
			@RequestParam(name = "team_name", required = false) String team_name,
			@RequestParam(name = "team_act_day", required = false) String team_act_day,
			@RequestParam(name = "page", required = false) String page) {
		
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		int startRow = 0;
		int endRow = 0;
		SearchRecruit sr = new SearchRecruit(team_level, field_name, team_local, team_name, team_act_day, startRow, endRow);		
		// 페이징 처리
		int limit = 9; // 한 페이지에 출력할 목록 갯수
		// 페이지 계산을 위해 총 목록갯수 조회
		int listCount = recruitService.selectSearchRecruitCount(sr);
		// 페이지 수 계산
		// 목록이 11개이면 총2페이지가 나오게 계산식 작성
		int maxPage = (int) ((double) listCount / limit + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 시작값
		// 뷰페이지에 페이지 숫자를 10개씩 보여지게 한다면
		int startPage = (int) ((double) currentPage / 10 + 0.9);
		// 현재 페이지가 포함된 페이지 그룹의 끝값
		// 페이지 수가 10개이면
		int endPage = startPage + 10 - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		// 쿼리문에 전달할 현재 페이지에 출력할 목록의 첫행과 끝행
		startRow = (currentPage - 1) * limit + 1;
		endRow = startRow + limit - 1;
		
		sr = new SearchRecruit(team_level, field_name, team_local, team_name, team_act_day, startRow, endRow);
		
		ArrayList<Recruit> list = null;
		list = recruitService.selectSearchRecruit(sr);
		
		if(list.size() > 0) {
			model.addAttribute("list",list);
			model.addAttribute("listCount",listCount);
			model.addAttribute("maxPage",maxPage);
			model.addAttribute("currentPage",currentPage);
			model.addAttribute("startPage",startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("team_level", team_level);
			model.addAttribute("limit", limit);
			model.addAttribute("field_name", field_name);
			model.addAttribute("team_local", team_local);
			model.addAttribute("team_name", team_name);
			model.addAttribute("team_act_day", team_act_day);
			
			return "recruit/recruitMainPage";
			}else {
				model.addAttribute("message", "검색에 대한 결과가 존재하지 않습니다.");
				return "common/error";
			}
	}
	
	@RequestMapping(value = "searchtname.do")
	@ResponseBody
	public int searchTeamNameMethod(@RequestParam("team_name") String team_name) {
		
		return recruitService.selectSearchTeamName(team_name);
	}

}
