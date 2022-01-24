package com.kh.alone.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.alone.vo.MemberVo;

@Repository
public class HomeDao {
	
	private static final String NAMESPACE = "com.kh.alone.mappers.home.";
	
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
    
    // 아이디 찾기
 	public MemberVo id_search(MemberVo vo) {
 		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "id_search", vo);
 		return memberVo;
 	}
 	
 	// 비밀번호 찾기
 	public MemberVo pw_search(MemberVo vo) {
 		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "pw_search", vo);
 		return memberVo;
 	}
}
