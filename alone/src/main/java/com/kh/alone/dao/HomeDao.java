package com.kh.alone.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.alone.vo.MemberVo;

@Repository
public class HomeDao {
	
	private static final String NAMESPACE = "com.kh.test02.mappers.home.";
	
	@Inject
	private SqlSession sqlSession;
	
	// 로그인 아이디 체크
	public MemberVo checkId(String userid) {
		MemberVo loginResult = sqlSession.selectOne(NAMESPACE + "checkId", userid);
		return loginResult;
	}
	
	// 로그인
    public MemberVo login(String userid, String userpw) {
	    Map<String, String> paramMap = new HashMap<>();
	    paramMap.put("userid", userid);
	    paramMap.put("userpw", userpw);
	    MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "login", paramMap);
	    return memberVo;
    } 
}
