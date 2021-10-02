package com.finalp.moim.review.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.finalp.moim.common.Page;
import com.finalp.moim.review.model.service.ReviewService;
import com.finalp.moim.review.model.vo.Review;
import com.finalp.moim.review.model.vo.SearchReview;
import com.finalp.moim.review.model.vo.UserTeam;

@Controller
public class ReviewController {

	// Logger
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	// DI
	@Autowired
	ReviewService reviewService;

	// 리뷰 페이지 이동 처리용 메소드
	@RequestMapping("rvlist.do")
	public ModelAndView reviewListMethod(ModelAndView mv, @RequestParam(name="page", required=false) String page) {
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		int limit = 10;
		int listCount = reviewService.selectListCount();
		
		int maxPage = (int)((double)listCount / limit + 0.9);
		int startPage = (int)((double)currentPage / limit + 0.9);
		int endPage = startPage + 10 - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		Page paging = new Page(startRow, endRow);
		
		ArrayList<Review> list = reviewService.selectList(paging);
		
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
			
			
			mv.setViewName("review/reviewListView");
		} else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패!");
			
			mv.setViewName("common/error");
		}
		
		return mv;
	}

	// 리뷰 작성뷰
	@RequestMapping("rvwrite.do")
	public String reviewWriteForm(@RequestParam("user_no") int user_no, Model model) {
		
		ArrayList<UserTeam> teamlist =  reviewService.selectUserTeam(user_no);
		
		if(teamlist != null) {
			model.addAttribute("teamlist", teamlist);
			return "review/reviewWriteForm";
		}else {
			model.addAttribute("message", "속한 팀이 존재하여야 작성 가능합니다.");
			return "common/error";
		}
		
		
	}

	// 리뷰 디테일
	@RequestMapping("rvdetail.do")
	public ModelAndView reviewDetailView(ModelAndView mv, @RequestParam("review_no") int review_no , @RequestParam("page") int page) {

		//조회수 1증가 
		reviewService.updateAddReadCount(review_no);
		
		Review review = reviewService.selectOne(review_no);
		
		if(review != null) {
			mv.addObject("review", review);
			mv.addObject("currentPage", page);
			mv.setViewName("review/reviewDetailView");
		}else {
			mv.addObject("message", review_no + "번 게시글 조회 실패.");
			mv.setViewName("common/error");
		}
		return mv;
	}

	@RequestMapping("rvfdown.do")
	public ModelAndView fileDownMethod(HttpServletRequest request, @RequestParam("ofile") String originFileName,
			@RequestParam("rfile") String renameFileName, ModelAndView mv) {
		String savePath = request.getSession().getServletContext().getRealPath("resources/review_files");

		// 저장폴더에서 파일 읽기 위해 경로 포함
		File renameFile = new File(savePath + "\\" + renameFileName);
		// response에 다운 파일명 등록을 위한 파일 (경로 제외)
		File originalFile = new File(originFileName);



		mv.setViewName("filedown");
		mv.addObject("renameFile", renameFile);
		mv.addObject("originalFile", originalFile);

		return mv;
	}
	
	@RequestMapping(value = "searchteam.do", method = RequestMethod.POST)
	@ResponseBody
	public String searchTeamMethod(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("team_name") String team_name) throws UnsupportedEncodingException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		 HashMap<String, String> myHashMap1 = new HashMap<String, String>();
		 JSONObject sendJson = new JSONObject();
		 String field_name = reviewService.selectTeamField(team_name);
		 myHashMap1.put("field_name", field_name);
		 
		
		 sendJson = new JSONObject(myHashMap1);
	
		
	
		return sendJson.toJSONString();
		

		
	}
	
	// 파일 업로드 기능이 있는 게시글 등록 처리용
		@RequestMapping(value = "rvinsert.do", method = RequestMethod.POST)
		public String ReviewInsertMethod(Review review, HttpServletRequest request, Model model, 
				@RequestParam(name = "upfile", required = false) MultipartFile mfile) {
			// 업로드된 파일 저장 폴더 지정하기
			String savePath = request.getSession().getServletContext().getRealPath("resources/review_files");

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
						review.setReview_rename_filepath(renameFileName);
						

					} catch (Exception e) {
						e.printStackTrace();
						model.addAttribute("message", "전송파일 저장 실패.");
						return "common/error";
					}

				} // 업로드된 파일이 있다면...
				
				review.setReview_original_filepath(mfile.getOriginalFilename());
				
				logger.info("rvinsert.do : " + review);
			}

			if (reviewService.insertReview(review) > 0) {
				return "redirect:rvlist.do";
			} else {
				model.addAttribute("message", "등록 실패.");
				return "common/error";
			}
		}
		
		@RequestMapping("rvupview.do")
		public String recruitUpdateForm(@RequestParam("review_no") int review_no, @RequestParam("page") int currentPage,
				Model model) {
			Review review = reviewService.selectOne(review_no);

			if (review != null) {
				model.addAttribute("review", review);
				model.addAttribute("page", currentPage);
				return "review/reviewUpdateView";
			} else {
				model.addAttribute("message", review_no + "번 게시글 수정페이지로 이동 실패.");
				return "common/error";
			}

		}	
		
		@RequestMapping(value = "rvupdate.do", method = RequestMethod.POST)
		public String ReviewUpdateMethod(Review review, HttpServletRequest request, Model model,
				@RequestParam(name = "delFlag", required = false) String delFlag,
				@RequestParam(name = "upfile", required = false) MultipartFile mfile) {

			// 업로드된 파일 저장 폴더 지정하기
			String savePath = request.getSession().getServletContext().getRealPath("resources/review_files");

			// 원래 첨부파일이 있는데, 삭제를 선택한 경우
			if (review.getReview_original_filepath() != null && delFlag != null && delFlag.equals("yes")) {
				logger.info("첨부파일 있었는데 삭제 체크");
				// 저장 폴더에서 파일을 삭제함
				new File(savePath + "/" + review.getReview_rename_filepath()).delete();
				review.setReview_original_filepath(null);
				review.setReview_rename_filepath(null);
	
			}

			// 새로운 첨부파일이 있을때
			if (!mfile.isEmpty()) {
				logger.info("새로운 첨부파일이 있을 때");
				//저장 폴더의 이전 파일을 삭제함
				if (review.getReview_original_filepath() != null) {
					logger.info("이전첨부파일 삭제");
					// 저장 폴더에서 파일을 삭제함
					new File(savePath + "/" + review.getReview_rename_filepath()).delete();
					review.setReview_original_filepath(null);
					review.setReview_rename_filepath(null);
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
							//파일 이름바꾸기 실패시 직접 바꾸기
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

						review.setReview_rename_filepath(renameFileName);
						
					} catch (Exception e) {
						e.printStackTrace();
						model.addAttribute("message", "전송파일 저장 실패.");
						return "common/error";
					}

				} // 업로드된 파일이 있다면...
				review.setReview_original_filepath(mfile.getOriginalFilename());
			
				logger.info("rbupdate.do : " + review);
			}

			if (reviewService.updateReview(review) > 0) {
				return "redirect:rvlist.do";
			} else {
				model.addAttribute("message", 
						review.getReview_no() + "번 게시글 수정 실패.");
				return "common/error";
			}

		}
		
		@RequestMapping("rvdelete.do")
		public String ReviewDeleteMethod(@RequestParam("review_no") int review_no,
				@RequestParam(name = "rfile", required = false) String renameFileName,
				HttpServletRequest request, Model model, RedirectAttributes ra) {
			if(reviewService.deleteReview(review_no) > 0) {
				//첨부파일이 있는 글일 때, 저장폴더에 있는 파일도 삭제함 
				if(renameFileName != null) {
					new File(request.getSession().getServletContext().getRealPath("resources/review_files")
					+ "\\" + renameFileName).delete();
				}
				ra.addFlashAttribute("msg", "delsuccess");
				return "redirect:rvlist.do";
			}else {
				model.addAttribute("message",review_no + "번 게시글 삭제 실패.");
				return "common/error";
			}
		}
		
		@RequestMapping(value = "rvsearch.do")
		public ModelAndView ReviewSearchMethod(ModelAndView mv,
				@RequestParam("keyword") String keyword, @RequestParam(name="page", required=false) String page) {
			int currentPage = 1;
			if(page != null) {
				currentPage = Integer.parseInt(page);
			}
			
			int limit = 10;
			int listCount = reviewService.selectSearchReviewCount(keyword);
			
			int maxPage = (int)((double)listCount / limit + 0.9);
			int startPage = (int)((double)currentPage / limit + 0.9);
			int endPage = startPage + 10 - 1;
			if(maxPage < endPage) {
				endPage = maxPage;
			}
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			
			SearchReview sr = new SearchReview(startRow, endRow, keyword);
			ArrayList<Review> list = reviewService.selectSearchReview(sr);
			
			
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
				mv.addObject("keyword", keyword);
				
				mv.setViewName("review/reviewListView");
			} else {
				mv.addObject("message", keyword + "에 대한 검색결과가 존재하지 않습니다.");
				
				mv.setViewName("common/error");
			}
			
			return mv;
		}
}
