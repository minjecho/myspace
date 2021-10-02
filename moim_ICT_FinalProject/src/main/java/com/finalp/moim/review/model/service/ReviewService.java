package com.finalp.moim.review.model.service;

import java.util.ArrayList;

import com.finalp.moim.common.Page;
import com.finalp.moim.review.model.vo.Review;
import com.finalp.moim.review.model.vo.SearchReview;
import com.finalp.moim.review.model.vo.UserTeam;

public interface ReviewService {
	int selectListCount();
	ArrayList<Review> selectList(Page page);
	Review selectOne(int review_no);
	int updateAddReadCount(int review_no);
	ArrayList<UserTeam> selectUserTeam(int user_no);
	String selectTeamField(String team_name);
	int insertReview(Review review);
	int updateReview(Review review);
	int deleteReview(int review_no);
	ArrayList<Review> selectSearchReview(SearchReview sr);
	int selectSearchReviewCount(String keyword);
}
