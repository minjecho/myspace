package com.finalp.moim.review.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalp.moim.common.Page;
import com.finalp.moim.review.model.vo.Review;
import com.finalp.moim.review.model.vo.SearchReview;
import com.finalp.moim.review.model.vo.UserTeam;

@Repository("reviewDao")
public class ReviewDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public ReviewDao() {}
	
	public int selectListCount() {
		return sqlSession.selectOne("reviewMapper.selectListCount");
	}

	public ArrayList<Review> selectList(Page page) {
		List<Review> list = sqlSession.selectList("reviewMapper.selectList", page);
		return (ArrayList<Review>) list;
	}
	
	public Review selectOne(int review_no) {
		return sqlSession.selectOne("reviewMapper.selectOne", review_no);
	}
	
	public int updateAddReadCount(int review_no) {
		return sqlSession.update("reviewMapper.addReadCount", review_no);
	}
	
	public ArrayList<UserTeam> selectUserTeam(int user_no){
		List<UserTeam> teamlist = sqlSession.selectList("reviewMapper.selectUserTeam", user_no);
		return (ArrayList<UserTeam>) teamlist;
	}
	
	public String selectTeamField(String team_name) {
		return sqlSession.selectOne("reviewMapper.selectTeamField", team_name);
	}
	
	public int insertReview(Review review) {
		return sqlSession.insert("reviewMapper.insertReview", review);
	}
	
	public int updateReview(Review review) {
		return sqlSession.update("reviewMapper.updateReview", review);
	}
	
	public int deleteReview(int review_no) {
		return sqlSession.delete("reviewMapper.deleteReview", review_no);
	}
	
	public ArrayList<Review> selectSearchReview(SearchReview sr) {
		List<Review> list = sqlSession.selectList("reviewMapper.selectSearchReview", sr);
		return (ArrayList<Review>) list;
	}
	
	public int selectSearchReviewCount(String keyword) {
		return sqlSession.selectOne("reviewMapper.selectSearchReviewCount", keyword);
	}
	
	
}
