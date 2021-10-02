package com.finalp.moim.mypage.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalp.moim.board.model.vo.Board;
import com.finalp.moim.mypage.model.dao.MyPageDao;
import com.finalp.moim.mypage.model.vo.MyBoard;
import com.finalp.moim.mypage.model.vo.MyPost;
import com.finalp.moim.review.model.vo.Review;
import com.finalp.moim.userinfo.dao.UserInfoDao;

@Service("MyPageService")
public class MyPageServiceImpl implements MyPageService{

		@Autowired
		MyPageDao mypageDao;
		
		@Override
		public ArrayList<Review> selectMyReview(MyPost mp){
			return mypageDao.selectMyReview(mp);
		}
		
		@Override
		public int selectMyReviewCount(String user_nn) {
			return mypageDao.selectMyReviewCount(user_nn);
		}
		
		@Override
		public ArrayList<Board> selectMyBoard(MyBoard mb){
			return mypageDao.selectMyBoard(mb);
		}
		
		@Override
		public int selectMyBoardCount(int user_no) {
			return mypageDao.selectMyBoardCount(user_no);
		}

		@Override
		public int deleteUser(int user_no) {
			return mypageDao.deleteUser(user_no);
		}
}
