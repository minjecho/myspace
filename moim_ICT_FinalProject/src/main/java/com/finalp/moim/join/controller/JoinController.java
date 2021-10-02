package com.finalp.moim.join.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.finalp.moim.join.model.service.JoinService;
import com.finalp.moim.join.model.vo.Join;
import com.finalp.moim.join.model.vo.SearchJoin;



@Controller
public class JoinController {

	// DI
	@Autowired
	JoinService joinService;
		
	// Logger
	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);
	
	// 파일 업로드 기능이 있는 게시글 등록 처리용
		@RequestMapping(value = "joininsert.do", method = RequestMethod.POST)
		public String JoinInsertMethod(Join join, HttpServletRequest request, Model model,
				@RequestParam(name = "upfile", required = false) MultipartFile mfile, @RequestParam("page") int page,
				RedirectAttributes ra) {
			// 업로드된 파일 저장 폴더 지정하기
			String savePath = request.getSession().getServletContext().getRealPath("resources/join_files");

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
						
						join.setJoin_rename_filename(renameFileName);

					} catch (Exception e) {
						e.printStackTrace();
						model.addAttribute("message", "전송파일 저장 실패.");
						return "common/error";
					}

				} // 업로드된 파일이 있다면...
				
				join.setJoin_original_filename(mfile.getOriginalFilename());

				logger.info("joininsert.do : " + join);
			}

			if (joinService.insertJoin(join) > 0) {
				ra.addFlashAttribute("msg", "success");
				return "redirect:rcdetail.do?team_num=" + join.getTeam_num() + "&page=" + page;
			} else {
				model.addAttribute("message", "등록 실패.");
				return "common/error";
			}
		}
	
		@RequestMapping(value = "searchjoin.do")
		@ResponseBody
		public String searchJoinMethod(HttpServletRequest request, HttpServletResponse response, @RequestParam("team_num") int team_num, @RequestParam("user_no") int user_no) {
		
			
			Map<String, Object> data = new HashMap<String, Object>();
			JSONObject sendJson = new JSONObject();
		
			
			SearchJoin sj = new SearchJoin(team_num, user_no);
			
			int checkJoin = joinService.selectTeamJoin(sj);
			int checkTeam = joinService.selectTeamMember(sj);
			
			data.put("checkJoin", checkJoin);
			data.put("checkTeam", checkTeam);
			
			sendJson = new JSONObject(data);
			
			return sendJson.toJSONString();
		
		}
}
