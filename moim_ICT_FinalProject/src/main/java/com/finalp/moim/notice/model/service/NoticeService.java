package com.finalp.moim.notice.model.service;

import java.util.ArrayList;

import com.finalp.moim.common.Page;
import com.finalp.moim.notice.model.vo.Notice;

public interface NoticeService {
	int selectListCount();
	ArrayList<Notice> selectList(Page paging);
	Notice selectNotice(int notice_no);
	int insertNotice(Notice notice);
	int updateNotice(Notice notice);
	int deleteNotice(int notice_no);
	ArrayList<Notice> selectSearchNotice(String keyword);
	ArrayList<Notice> selectNewTop5();
}
