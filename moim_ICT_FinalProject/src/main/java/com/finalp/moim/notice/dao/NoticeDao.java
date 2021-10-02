package com.finalp.moim.notice.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalp.moim.common.Page;
import com.finalp.moim.notice.model.vo.Notice;

@Repository("noticeDao")
public class NoticeDao {
	// root-context.xml
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public NoticeDao() {}

	public int selectListCount() {
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}

	public ArrayList<Notice> selectList(Page page) {
		List<Notice> list = sqlSession.selectList("noticeMapper.selectList", page);
		return (ArrayList<Notice>) list;
	}

	public Notice selectNotice(int notice_no) {
		return sqlSession.selectOne("noticeMapper.selectNotice", notice_no);
	}

	public int insertNotice(Notice notice) {
		return sqlSession.insert("noticeMapper.insertNotice", notice);
	}

	public int updateNotice(Notice notice) {
		return sqlSession.update("noticeMapper.updateNotice", notice);
	}

	public int deleteNotice(int notice_no) {
		return sqlSession.delete("noticeMapper.deleteNotice", notice_no);
	}

	public ArrayList<Notice> selectSearchNotice(String keyword) {
		List<Notice> list = sqlSession.selectList("noticeMapper.selectSearchNotice", keyword);
		return (ArrayList<Notice>) list;
	}

	public ArrayList<Notice> selectNewTop5() {
		List<Notice> list = sqlSession.selectList("noticeMapper.selectNewTop5");
		return (ArrayList<Notice>) list;
	}
}
