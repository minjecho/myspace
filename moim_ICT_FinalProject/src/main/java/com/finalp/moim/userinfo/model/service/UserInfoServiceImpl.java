package com.finalp.moim.userinfo.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalp.moim.userinfo.dao.UserInfoDao;
import com.finalp.moim.userinfo.model.vo.UserInfo;

@Service("userinfoService")
public class UserInfoServiceImpl implements UserInfoService {
	// DI
	@Autowired
	private UserInfoDao userinfoDao;
	
	public UserInfoServiceImpl() {}

	@Override
	public UserInfo selectLogin(UserInfo userInfo) {
		return userinfoDao.selectLogin(userInfo);
	}

	@Override
	public int insertUserInfo(UserInfo userInfo) {
		return userinfoDao.insertUserInfo(userInfo);
	}

	@Override
	public int updateUserInfo(UserInfo userInfo) {
		return userinfoDao.updateUserInfo(userInfo);
	}

	@Override
	public int deleteUserInfo(String userid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<UserInfo> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserInfo selectUserInfo(UserInfo userInfo) {
		return userinfoDao.selectUserInfo(userInfo);
	}

	@Override
	public int updateLoginOk(UserInfo userInfo) {
		return userinfoDao.updateUserLoginOK(userInfo);
	}

	@Override
	public ArrayList<UserInfo> selectSearchUserid(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<UserInfo> selectSearchGender(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<UserInfo> selectSearchAge(int age) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<UserInfo> selectSearchLoginOK(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectCheckId(String userid) {
		return userinfoDao.selectCheckId(userid);
	}
	
	@Override
	public int selectCheckNn(String usernn) {
		return userinfoDao.selectCheckNn(usernn);
	}

	@Override
	public int selectListCount() {
		return userinfoDao.selectListCount();
	}

	@Override
	public UserInfo selectUser(int user_no) {
		return userinfoDao.selectUser(user_no);
	}

	@Override
	public int updateUserLoginOK(UserInfo userInfo) {
		return userinfoDao.updateUserLoginOK(userInfo);
	}

	@Override
	public int updateUserAdmin(UserInfo userInfo) {
		return userinfoDao.updateUserAdmin(userInfo);
	}

	@Override
	public ArrayList<UserInfo> selectUserSearch(int category_no, String keyword) {
		return userinfoDao.selectUserSearch(category_no, keyword);
	}

	@Override
	public int deleteUserAdmin(int user_no) {
		return userinfoDao.deleteUserAdmin(user_no);
	};

	@Override
	public ArrayList<UserInfo> selectUserList() {
		return userinfoDao.selectUserList();
	}

	@Override
	public UserInfo searchId1(UserInfo userinfo) {
		return userinfoDao.searchId1(userinfo);
	}

	@Override
	public UserInfo searchId2(UserInfo userinfo) {
		return userinfoDao.searchId2(userinfo);
	}

	@Override
	public UserInfo searchPwd(UserInfo userinfo) {
		return userinfoDao.searchPwd(userinfo.getUser_id());
	}

	@Override
	public int updatePwd(UserInfo userinfo) {
		return userinfoDao.updateUserInfo(userinfo);
	}

}
