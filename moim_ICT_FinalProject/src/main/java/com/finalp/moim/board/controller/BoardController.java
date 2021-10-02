package com.finalp.moim.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.finalp.moim.board.model.service.BoardService;
import com.finalp.moim.board.model.vo.Board;
import com.finalp.moim.common.Page;

@Controller
public class BoardController {
	// Logger
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	// DI
	@Autowired
	private BoardService boardService;
	
	// 게시판 페이지 이동 처리용 메소드------------
	// 게시판 리스트 페이지 이동
	@RequestMapping("blist.do")
	public ModelAndView boardListMethod(ModelAndView mv, @RequestParam(name="page", required=false) String page) {
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		int limit = 10;
		int listCount = boardService.selectListCount();
		
		int maxPage = (int)((double)listCount / limit + 0.9);
		int startPage = (int)((double)currentPage / limit + 0.9);
		int endPage = startPage + 10 - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		Page paging = new Page(startRow, endRow);
		
		ArrayList<Board> list = boardService.selectList(paging);
		
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
			
			mv.setViewName("board/BoardList");
		} else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패!");
			
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
	// 게시판 관리 페이지 이동
	@RequestMapping("blistadmin.do")
	public String boardAdminListMethod() {
		return "admin/AdminBoardList";
	}
	
	// 게시판 상세보기 페이지 이동
	@RequestMapping("bdetail.do")
	public ModelAndView boardDetailMethod(ModelAndView mv, @RequestParam("board_no") int board_no, 
			@RequestParam("page") int page) {
		boardService.updateReadCount(board_no);
		
		Board board = boardService.selectBoard(board_no);
		
		if(board != null) {
			mv.addObject("board", board);
			mv.addObject("currentPage", page);
			
			mv.setViewName("board/BoardDetail");
		} else {
			mv.addObject("message", board_no + "번 게시글 조회 실패");
			
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
	// 게시판 작성 페이지 이동
	@RequestMapping("bwriteform.do")
	public ModelAndView boardWriteFormMethod(ModelAndView mv, @RequestParam("page") int page) {
		mv.addObject("currentPage", page);
		mv.setViewName("board/BoardWriteForm");
		
		return mv;
	}
	
	// 게시판 수정 페이지 이동
	@RequestMapping("bupdateform.do")
	public ModelAndView boardUpdateFormMethod(ModelAndView mv, @RequestParam("board_no") int board_no, 
			@RequestParam("page") int page) {
		Board board = boardService.selectBoard(board_no);
		
		if(board != null) {
			mv.addObject("board", board);
			mv.addObject("currentPage", page);
			
			mv.setViewName("board/BoardUpdateForm");
		} else {
			mv.addObject("message", board_no + "번 게시글 수정 실패");
			
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	// --------------------------------------
	
	// 게시판 관련 기능 메소드--------------------
	// 게시판 작성
	@RequestMapping(value="binsert.do", method = RequestMethod.POST)
	public ModelAndView boardWriteMethod(ModelAndView mv, Board board, HttpServletRequest request, 
			@RequestParam(name = "upfile", required = false) MultipartFile mfile) {
		String savePath = request.getSession().getServletContext().getRealPath("resources/board_upfiles");
		
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
					
					board.setBoard_rename_filename(renameFileName);
				} catch (Exception e) {
					e.printStackTrace();
					mv.addObject("message", "파일 등록 실패");
					mv.setViewName("common/error");
					
					return mv;
				}
			}
			
			board.setBoard_original_filename(mfile.getOriginalFilename());
		}
		
		if(boardService.insertBoard(board) > 0) {
			mv.addObject("page", 1);
			
			mv.setViewName("redirect:blist.do");
		} else {
			mv.addObject("message", "게시글 등록 실패");
			
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
	// 파일 다운로드
	@RequestMapping("bfiledown.do")
	public ModelAndView fileDownMethod(ModelAndView mv, HttpServletRequest request, 
			@RequestParam("ofile") String originalFileName, @RequestParam("rfile") String renameFileName) {
		String savePath = request.getSession().getServletContext().getRealPath("resource/board_upfiles");
		
		File renameFile = new File(savePath + "\\" + renameFileName);
		File originalFile = new File(originalFileName);
		
		mv.addObject("originalFile", originalFile);
		mv.addObject("renameFile", renameFile);
		mv.setViewName("filedown");
		
		return mv;
	}
	
	// 게시판 수정
	@RequestMapping(value = "bupdate.do", method = RequestMethod.POST)
	public ModelAndView boardUpdateMethod(ModelAndView mv, Board board, HttpServletRequest request, 
			@RequestParam(name = "deleteFile", required = false) String delFile, @RequestParam(name = "upfile", required = false) MultipartFile mfile) {
		String savePath = request.getSession().getServletContext().getRealPath("resources/board_upfiles");
		
		if(board.getBoard_original_filename() != null && delFile != null && delFile.equals("yes")) {
			new File(savePath + "\\" + board.getBoard_rename_filename()).delete();
			board.setBoard_original_filename(null);
			board.setBoard_rename_filename(null);
		}
		
		if(!mfile.isEmpty()) {
			if(board.getBoard_original_filename() != null && delFile != null && delFile.equals("yes")) {
				new File(savePath + "\\" + board.getBoard_rename_filename()).delete();
				board.setBoard_original_filename(null);
				board.setBoard_rename_filename(null);
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
					
					board.setBoard_rename_filename(renameFileName);
				} catch (Exception e) {
					e.printStackTrace();
					mv.addObject("message", "파일 등록 실패");
					mv.setViewName("common/error");
					
					return mv;
				}
			}
			
			board.setBoard_original_filename(mfile.getOriginalFilename());
		}
		
		if(boardService.updateBoard(board) > 0) {
			mv.addObject("page", 1);
			
			mv.setViewName("redirect:blist.do");
		} else {
			mv.addObject("message", board.getBoard_no() + "번 글 수정 실패");
			
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
	// 게시판 삭제
	@RequestMapping("bdelete.do")
	public ModelAndView boardDeleteMethod(ModelAndView mv, @RequestParam("board_no") int board_no, 
			@RequestParam(name = "rfile", required = false) String renameFileName, 
			@RequestParam("page") int currentPage, HttpServletRequest request) {
		if(boardService.deleteBoard(board_no) > 0) {
			if(renameFileName != null) {
				new File(request.getSession().getServletContext().getRealPath("resource/board_upfiles") + "\\"
						+ renameFileName).delete();
			}
			
			mv.addObject("page", currentPage);
			mv.setViewName("redirect:blist.do");
		} else {
			mv.addObject("message", board_no + "번 게시글 삭제 실패");
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
	// 게시판 검색
	@RequestMapping(value = "bsearch.do", method = RequestMethod.POST)
	public ModelAndView boardSearchMethod(ModelAndView mv, @RequestParam("board_category_no") int board_category_no,
			@RequestParam("keyword") String keyword, @RequestParam(name="page", required=false) String page) {
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		int limit = 10;
		int listCount = boardService.selectListCount();
		
		int maxPage = (int)((double)listCount / limit + 0.9);
		int startPage = (int)((double)currentPage / limit + 0.9);
		int endPage = startPage + 10 - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		Page paging = new Page(startRow, endRow);
		
		ArrayList<Board> list = boardService.selectSearchBoard(board_category_no, keyword);
		
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
			
			mv.setViewName("board/BoardList");
		} else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패!");
			
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	// --------------------------------------
}
