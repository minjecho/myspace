package com.finalp.moim.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalp.moim.common.Page;
import com.finalp.moim.notice.dao.NoticeDao;
import com.finalp.moim.notice.model.vo.Notice;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	// DI
	@Autowired
	private NoticeDao noticeDao;
	
	public NoticeServiceImpl() {}

	@Override
	public int selectListCount() {
		return noticeDao.selectListCount();
	}

	@Override
	public ArrayList<Notice> selectList(Page page) {
		return noticeDao.selectList(page);
	}

	@Override
	public Notice selectNotice(int notice_no) {
		return noticeDao.selectNotice(notice_no);
	}

	@Override
	public int insertNotice(Notice notice) {
		return noticeDao.insertNotice(notice);
	}

	@Override
	public int updateNotice(Notice notice) {
		return noticeDao.updateNotice(notice);
	}

	@Override
	public int deleteNotice(int notice_no) {
		return noticeDao.deleteNotice(notice_no);
	}

	@Override
	public ArrayList<Notice> selectSearchNotice(String keyword) {
		return noticeDao.selectSearchNotice(keyword);
	}

	@Override
	public ArrayList<Notice> selectNewTop5() {
		return noticeDao.selectNewTop5();
	}
}
