package com.finalp.moim.review.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalp.moim.common.Page;
import com.finalp.moim.review.model.dao.ReviewDao;
import com.finalp.moim.review.model.vo.Review;
import com.finalp.moim.review.model.vo.SearchReview;
import com.finalp.moim.review.model.vo.UserTeam;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	ReviewDao reviewDao;
	

	@Override
	public int selectListCount() {
		return reviewDao.selectListCount();
	}

	@Override
	public ArrayList<Review> selectList(Page page) {
		return reviewDao.selectList(page);
	}
	
	@Override
	public Review selectOne(int review_no) {
		return reviewDao.selectOne(review_no);
	}
	
	@Override
	public int updateAddReadCount(int review_no) {
		return reviewDao.updateAddReadCount(review_no);
	}

	@Override
	public ArrayList<UserTeam> selectUserTeam(int user_no){
		return reviewDao.selectUserTeam(user_no);
	}
	
	@Override
	public String selectTeamField(String team_name) {
		return reviewDao.selectTeamField(team_name);
	}
	
	@Override
	public int insertReview(Review review) {
		return reviewDao.insertReview(review);
	}
	
	@Override
	public int updateReview(Review review) {
		return reviewDao.updateReview(review);
	}
	
	@Override
	public int deleteReview(int review_no) {
		return reviewDao.deleteReview(review_no);
	}
	
	@Override
	public ArrayList<Review> selectSearchReview(SearchReview sr){
		return reviewDao.selectSearchReview(sr);
	}
	
	@Override
	public int selectSearchReviewCount(String keyword) {
		return reviewDao.selectSearchReviewCount(keyword);
	}
}
