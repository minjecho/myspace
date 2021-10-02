package com.finalp.moim.notice.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.finalp.moim.common.Page;
import com.finalp.moim.notice.model.service.NoticeService;
import com.finalp.moim.notice.model.vo.Notice;

@Controller
public class NoticeController {
	// Logger
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	// DI
	@Autowired
	private NoticeService noticeService;
	
	// 공지사항 페이지 이동 처리용 메소드---------
	// 공지사항 리스트 페이지 이동
	@RequestMapping("nlist.do")
	public ModelAndView noticeListMethod(ModelAndView mv, @RequestParam(name="page", required=false) String page) {
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		int limit = 10;
		int listCount = noticeService.selectListCount();
		
		int maxPage = (int)((double)listCount / limit + 0.9);
		int startPage = (int)((double)currentPage / limit + 0.9);
		int endPage = startPage + 10 - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		Page paging = new Page(startRow, endRow);
		
		ArrayList<Notice> list = noticeService.selectList(paging);
		
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
			
			mv.setViewName("notice/NoticeList");
		} else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패!");
			
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
	// 공지사항 상세보기 페이지 이동
	@RequestMapping("ndetail.do")
	public ModelAndView noticeDetailMethod(ModelAndView mv, @RequestParam("notice_no") int notice_no, 
			@RequestParam(name="page", required = false) int page) {
		Notice notice = noticeService.selectNotice(notice_no);
		
		if(notice != null) {
			mv.addObject("notice", notice);
			mv.addObject("currentPage", page);
			
			mv.setViewName("notice/NoticeDetail");
		} else {
			mv.addObject("message", notice_no + "번 공지사항 조회 실패");
			
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
	// 공지사항 작성 페이지 이동
	@RequestMapping("nwriteform.do")
	public ModelAndView noticeWriteFormMethod(ModelAndView mv, @RequestParam("page") int page) {
		mv.addObject("currentPage", page);
		mv.setViewName("notice/NoticeWriteForm");
		
		return mv;
	}
	
	// 공지사항 수정 페이지 이동
	@RequestMapping("nupdateform.do")
	public ModelAndView noticeUpdateFormMethod(ModelAndView mv, @RequestParam("notice_no") int notice_no, 
			@RequestParam("page") int page) {
		Notice notice = noticeService.selectNotice(notice_no);
		
		if(notice != null) {
			mv.addObject("notice", notice);
			mv.addObject("currentPage", page);
			
			mv.setViewName("notice/NoticeUpdateForm");
		} else {
			mv.addObject("message", notice_no + "번 공지사항 수정페이지 출력 실패");
			
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	// ------------------------------------
	
	// 공지사항 관련 기능 메소드----------------
	// 공지사항 등록
	@RequestMapping(value="ninsert.do", method = RequestMethod.POST)
	public ModelAndView noticeInsertMethod(ModelAndView mv, Notice notice, HttpServletRequest request, 
			@RequestParam(name="upfile", required = false) MultipartFile mfile) {
		String savePath = request.getSession().getServletContext().getRealPath("resources/notice_upfiles");
		
		if(mfile != null) {
			String fileName = mfile.getOriginalFilename();
			
			if(fileName != null && fileName.length() > 0) {
				try {
					mfile.transferTo(new File(savePath + "\\" + fileName));
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					
					String renameFileName = sdf.format(new Date(System.currentTimeMillis()));
					renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);
					
					File originalFile = new File(savePath + "\\" + fileName);
					File renameFile = new File(savePath + "\\" + renameFileName);
					
					if(!originalFile.renameTo(renameFile)) {
						FileInputStream fin = new FileInputStream(originalFile);
						FileOutputStream fout = new FileOutputStream(renameFile);
						
						int data = -1;
						byte[] buffer = new byte[1024];
						
						while((data = fin.read(buffer, 0, buffer.length)) != -1) {
							fout.write(buffer, 0, buffer.length);
						}
						
						fin.close();
						fout.close();
						originalFile.delete();
					}
					
					notice.setNotice_rename_filename(renameFileName);
				} catch (Exception e) {
					e.printStackTrace();
					mv.addObject("message", "파일 등록 실패");
					mv.setViewName("common/error");
					
					return mv;
				}
			}
			
			notice.setNotice_original_filename(mfile.getOriginalFilename());
		}
		
		if(noticeService.insertNotice(notice) > 0) {
			mv.addObject("page", 1);
			
			mv.setViewName("redirect:nlist.do");
		} else {
			mv.addObject("message", "새 공지사항 등록 실패");
			
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
	// 공지사항의 첨부 파일 다운로드
	@RequestMapping("nfiledown.do")
	public ModelAndView fileDownMethod(ModelAndView mv, HttpServletRequest request, 
			@RequestParam("ofile") String originalFileName, @RequestParam("rfile") String renameFileName) {
		String savePath = request.getSession().getServletContext().getRealPath("resources/notice_upfiles");
		
		File renameFile = new File(savePath + "\\" + renameFileName);
		File originalFile = new File(originalFileName);
		
		mv.addObject("originalFile", originalFile);
		mv.addObject("renameFile", renameFile);
		mv.setViewName("filedown");
		
		return mv;
	}
	
	// 공지사항 수정
	@RequestMapping(value="nupdate.do", method = RequestMethod.POST)
	public ModelAndView noticeUpdateMethod(ModelAndView mv, Notice notice, HttpServletRequest request, 
			@RequestParam(name = "deleteFile", required = false) String delFile, @RequestParam(name="upfile", required = false) MultipartFile mfile) {
		String savePath = request.getSession().getServletContext().getRealPath("resources/notice_upfiles");
		
		if(notice.getNotice_original_filename() != null && delFile != null && delFile.equals("yes")) {
			new File(savePath + "\\" + notice.getNotice_rename_filename()).delete();
			notice.setNotice_original_filename(null);
			notice.setNotice_rename_filename(null);
		}
		
		if(!mfile.isEmpty()) {
			if(notice.getNotice_original_filename() != null) {
				new File(savePath + "\\" + notice.getNotice_rename_filename()).delete();
				notice.setNotice_original_filename(null);
				notice.setNotice_rename_filename(null);
			}
			
			String fileName = mfile.getOriginalFilename();
			
			if(fileName != null && fileName.length() > 0) {
				try {
					mfile.transferTo(new File(savePath + "\\" + fileName));
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					
					String renameFileName = sdf.format(new Date(System.currentTimeMillis()));
					renameFileName += "." + fileName.substring(fileName.lastIndexOf(".") + 1);
					
					File originalFile = new File(savePath + "\\" + fileName);
					File renameFile = new File(savePath + "\\" + renameFileName);
					
					if(!originalFile.renameTo(renameFile)) {
						FileInputStream fin = new FileInputStream(originalFile);
						FileOutputStream fout = new FileOutputStream(renameFile);
						
						int data = -1;
						byte[] buffer = new byte[1024];
						
						while((data = fin.read(buffer, 0, buffer.length)) != -1) {
							fout.write(buffer, 0, buffer.length);
						}
						
						fin.close();
						fout.close();
						originalFile.delete();
					}
					
					notice.setNotice_rename_filename(renameFileName);
				} catch (Exception e) {
					e.printStackTrace();
					mv.addObject("message", "파일 등록 실패");
					mv.setViewName("common/error");
					
					return mv;
				}
			}
			
			notice.setNotice_original_filename(mfile.getOriginalFilename());
		}
		
		if(noticeService.updateNotice(notice) > 0) {
			mv.addObject("page", 1);
			
			mv.setViewName("redirect:nlist.do");
		} else {
			mv.addObject("message", notice.getNotice_no() + "번 공지사항 수정 실패");
			
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
	// 공지사항 삭제
	@RequestMapping("ndelete.do")
	public ModelAndView noticeDeleteMethod(ModelAndView mv, @RequestParam("notice_no") int notice_no, 
			@RequestParam(name = "rfile", required = false) String renameFileName, 
			@RequestParam("page") int currentPage, HttpServletRequest request) {
		if(noticeService.deleteNotice(notice_no) > 0) {
			if(renameFileName != null) {
				new File(request.getSession().getServletContext().getRealPath("resources/notice_upfiles") + "\\"
						+ renameFileName).delete();
			}
			
			mv.addObject("page", currentPage);
			mv.setViewName("redirect:nlist.do");
		} else {
			mv.addObject("message", notice_no + "번 공지 삭제 실패");
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
	// 공지사항 제목으로 키워드 검색
	@RequestMapping(value="nsearch.do", method = RequestMethod.POST)
	public ModelAndView noticeSearchMethod(ModelAndView mv, @RequestParam("keyword") String keyword, 
			@RequestParam(name="page", required=false) String page) {
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		int limit = 10;
		int listCount = noticeService.selectListCount();
		
		int maxPage = (int)((double)listCount / limit + 0.9);
		int startPage = (int)((double)currentPage / limit + 0.9);
		int endPage = startPage + 10 - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		Page paging = new Page(startRow, endRow);
		
		ArrayList<Notice> list = noticeService.selectSearchNotice(keyword);
		
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
			
			mv.setViewName("notice/NoticeList");
		} else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패!");
			
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
	// 메인 페이지에서 최근 공지 5개 출력
	@RequestMapping(value = "ntop5.do", method = RequestMethod.POST)
	@ResponseBody
	public String noticeTop5Method() throws UnsupportedEncodingException {
		ArrayList<Notice> list = noticeService.selectNewTop5();
		
		JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Notice notice : list) {
			JSONObject job = new JSONObject();
			
			job.put("notice_no", notice.getNotice_no());
			job.put("notice_title", URLEncoder.encode(notice.getNotice_title(), "utf-8"));
			job.put("notice_date", notice.getNotice_date().toString());
			
			jarr.add(job);
		}
		
		sendJson.put("list", jarr);
		
		return sendJson.toJSONString();
	}
	// ------------------------------------
}
