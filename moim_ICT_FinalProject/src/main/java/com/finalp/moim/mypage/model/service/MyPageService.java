package com.finalp.moim.mypage.model.service;

import java.util.ArrayList;

import com.finalp.moim.board.model.vo.Board;
import com.finalp.moim.mypage.model.vo.MyBoard;
import com.finalp.moim.mypage.model.vo.MyPost;
import com.finalp.moim.review.model.vo.Review;

public interface MyPageService {
	ArrayList<Review> selectMyReview(MyPost mr);
	int selectMyReviewCount(String user_nn);
	ArrayList<Board> selectMyBoard(MyBoard mb);
	int selectMyBoardCount(int user_no);
	int deleteUser(int user_no);
}
