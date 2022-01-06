package com.kh.alone.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.alone.dao.HomeDao;
import com.kh.alone.vo.MemberVo;

@Service
public class HomeService {

	@Inject
	private HomeDao homeDao; 
	
	// 로그인 아이디 체크
	public MemberVo checkId(String userid) {
		MemberVo loginResult = homeDao.checkId(userid);
		return loginResult;
	}
	
	// 로그인
	public MemberVo login(String userid, String userpw) {
		MemberVo memberVo = homeDao.login(userid, userpw);
		return memberVo;
	}
	
	
}
