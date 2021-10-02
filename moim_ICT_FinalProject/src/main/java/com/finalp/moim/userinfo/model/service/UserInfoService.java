package com.finalp.moim.userinfo.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import com.finalp.moim.userinfo.model.vo.UserInfo;

public interface UserInfoService {
	UserInfo selectLogin(UserInfo userInfo);
	int insertUserInfo(UserInfo userInfo);
	int updateUserInfo(UserInfo userInfo);
	int deleteUserInfo(String userid);
	ArrayList<UserInfo> selectList();
	UserInfo selectUserInfo(UserInfo userInfo);
	int updateLoginOk(UserInfo userInfo);
	ArrayList<UserInfo> selectSearchUserid(String keyword);
	ArrayList<UserInfo> selectSearchGender(String keyword);
	ArrayList<UserInfo> selectSearchAge(int age);
/*	ArrayList<UserInfo> selectSearchEnrollDate(SearchDate searchDate);*/
	ArrayList<UserInfo> selectSearchLoginOK(String keyword);
	int selectCheckId(String userid);
	int selectCheckNn(String usernn);
	int selectListCount();
	UserInfo selectUser(int user_no);
	int updateUserLoginOK(UserInfo userInfo);
	int updateUserAdmin(UserInfo userInfo);
	ArrayList<UserInfo> selectUserSearch(int category_no, String keyword);
	int deleteUserAdmin(int user_no);
	ArrayList<UserInfo> selectUserList();
	UserInfo searchPwd(UserInfo userinfo);
	UserInfo searchId1(UserInfo userinfo);
	UserInfo searchId2(UserInfo userinfo);
	int updatePwd(UserInfo userinfo);
	
	
}
