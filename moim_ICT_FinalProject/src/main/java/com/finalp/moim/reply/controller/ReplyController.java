package com.finalp.moim.reply.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.servlet.ModelAndView;

import com.finalp.moim.reply.model.service.ReplyService;
import com.finalp.moim.reply.model.vo.Reply;

@Controller
public class ReplyController {
	// Logger
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	// DI
	@Autowired
	private ReplyService replyService;
	
	// 댓글 출력
	@RequestMapping(value = "rlist.do", method = RequestMethod.POST)
	@ResponseBody
	public String replyListMethod(HttpServletResponse response, String board_no) throws UnsupportedEncodingException {
		int b_no = Integer.parseInt(board_no);
		System.out.println("board_no" + b_no);
		ArrayList<Reply> list = replyService.selectReplyList(b_no);
		
		JSONObject sendJSON = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Reply reply : list) {
			JSONObject job = new JSONObject();
			
			job.put("reply_no", reply.getReply_no());
			job.put("board_no", reply.getBoard_no());
			job.put("user_no", reply.getUser_no());
			job.put("reply_content", URLEncoder.encode(reply.getReply_content(), "utf-8"));
			job.put("reply_date", reply.getReply_date().toString());
			job.put("user_nn", URLEncoder.encode(reply.getUserVO().getUser_nn(), "utf-8"));
			
			jarr.add(job);
		}
		
		sendJSON.put("list", jarr);
		
		return sendJSON.toJSONString();
	}
	
	// 댓글 작성
	@RequestMapping(value = "rinsert.do", method = RequestMethod.POST)
	public ModelAndView replyInsertMethod(ModelAndView mv, Reply reply, @RequestParam("page") int currentPage) {
		if(replyService.insertReply(reply) > 0) {
			mv.addObject("page", currentPage);
			mv.addObject("board_no", reply.getBoard_no());
			
			mv.setViewName("redirect:bdetail.do");
		} else {
			mv.addObject("message", reply.getBoard_no() + "번 글에 댓글 작성 실패");
			
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
	// 댓글 수정
	
	// 댓글 삭제
	@RequestMapping("rdelete.do")
	public ModelAndView replyDeleteMethod(ModelAndView mv, @RequestParam("reply_no") int reply_no, 
			@RequestParam("board_no") int board_no, @RequestParam("page") int currentPage) {
		if(replyService.deleteReply(reply_no) > 0) {
			mv.addObject("board_no", board_no);
			mv.addObject("page", currentPage);
			
			mv.setViewName("redirect:bdetail.do");
		} else {
			mv.addObject("message", reply_no + "번 댓글 삭제 실패");
			
			mv.setViewName("common/error");
		}
		
		return mv;
	}
}
