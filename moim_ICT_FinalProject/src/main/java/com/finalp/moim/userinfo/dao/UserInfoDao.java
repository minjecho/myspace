package com.finalp.moim.userinfo.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.finalp.moim.userinfo.model.vo.UserInfo;

@Repository("userinfoDao")
public class UserInfoDao {
	// root-context.xml
	@Autowired
	private SqlSessionTemplate session;
	
	public UserInfoDao() {}

	public UserInfo selectLogin(UserInfo userInfo) {
		return session.selectOne("userinfoMapper.selectLogin", userInfo);
	}

	public ArrayList<UserInfo> selectUserList() {
		List<UserInfo> list = session.selectList("userinfoMapper.selectUserList");
		return (ArrayList<UserInfo>) list;
	}
	public int insertUserInfo(UserInfo userInfo) {
		return session.insert("userinfoMapper.insertUserInfo", userInfo);
	}

	public int selectListCount() {
		return session.selectOne("userinfoMapper.getListCount");
	}

	public UserInfo selectUser(int user_no) {
		return session.selectOne("userinfoMapper.selectUser", user_no);
	}

	public int updateUserLoginOK(UserInfo userInfo) {
		return session.update("userinfoMapper.updateUserLoginOK", userInfo);
	}

	public int updateUserAdmin(UserInfo userInfo) {
		return session.update("userinfoMapper.updateUserAdmin", userInfo);
	}

	public ArrayList<UserInfo> selectUserSearch(int category_no, String keyword) {
		List<UserInfo> list = null;
		
		if(category_no == 1) {
			list = session.selectList("userinfoMapper.searchUserName", keyword);
		} else if(category_no == 2) {
			list = session.selectList("userinfoMapper.searchUserNickname", keyword);
		} else if(category_no == 3) {
			list = session.selectList("userinfoMapper.searchUserEmail", keyword);
		}

		return (ArrayList<UserInfo>) list;
	}

	public int deleteUserAdmin(int user_no) {
		return session.delete("userinfoMapper.deleteUserAdmin", user_no);
	}
	
	public int selectCheckId(String user_id) {
		return session.selectOne("userinfoMapper.selectCheckId", user_id);
	}
	public int selectCheckNn(String user_nn) {
		return session.selectOne("userinfoMapper.selectCheckNn", user_nn);
	}
	public UserInfo searchId1(UserInfo userinfo) {
		return session.selectOne("userinfoMapper.searchId1", userinfo);
	}
	public UserInfo searchId2(UserInfo userinfo) {
		return session.selectOne("userinfoMapper.searchId2", userinfo);
	}
	public UserInfo searchPwd(String userinfo) {
		return session.selectOne("userinfoMapper.searchPwd",userinfo);
	}
	@Transactional
	public int updatePwd(UserInfo UserInfo) {
		return session.update("userinfoMapper.updatePwd", updateUserInfo(UserInfo));
	}

	public int updateUserInfo(UserInfo userInfo) {
		return session.update("userinfoMapper.updateUserInfo", userInfo);
	}
	

	public UserInfo selectUserInfo(UserInfo userInfo) {
		return session.selectOne("userinfoMapper.selectUserInfo", userInfo);
	}
	
	
	
}
