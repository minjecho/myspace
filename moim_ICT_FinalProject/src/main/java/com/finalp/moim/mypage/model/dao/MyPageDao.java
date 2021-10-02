package com.finalp.moim.mypage.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalp.moim.board.model.vo.Board;
import com.finalp.moim.mypage.model.vo.MyBoard;
import com.finalp.moim.mypage.model.vo.MyPost;
import com.finalp.moim.review.model.vo.Review;
import com.finalp.moim.userinfo.model.vo.UserInfo;

@Repository("myPageDao")
public class MyPageDao {

	// root-context.xml
	@Autowired
	private SqlSessionTemplate session;
	
	public MyPageDao() {}

	public UserInfo selectLogin(UserInfo userInfo) {
		return session.selectOne("userinfoMapper.selectLogin", userInfo);
	};
	
	public ArrayList<Review> selectMyReview(MyPost mp) {
		List<Review> rlist = session.selectList("reviewMapper.selectMyReview", mp);
		return (ArrayList<Review>) rlist;
	}
	
	public int selectMyReviewCount(String user_nn) {
		return session.selectOne("reviewMapper.selectMyReviewCount", user_nn);
	}
	
	public ArrayList<Board> selectMyBoard(MyBoard mb) {
		List<Board> blist = session.selectList("boardMapper.selectMyBoard", mb);
		return (ArrayList<Board>) blist;
	}
	
	public int selectMyBoardCount(int user_no) {
		return session.selectOne("boardMapper.selectMyBoardCount", user_no);
	}

	public int deleteUser(int user_no) {
		return session.delete("userinfoMapper.deleteUser", user_no);
	};
	
}
