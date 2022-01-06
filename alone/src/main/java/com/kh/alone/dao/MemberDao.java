package com.kh.alone.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.alone.vo.ClassInfoVo;
import com.kh.alone.vo.MemberVo;
import com.kh.alone.vo.PagingDto;


@Repository
public class MemberDao {
	private static final String NAMESPACE = "com.kh.ex01.mappers.member.";
	
	@Inject
	private SqlSession sqlSession;
	
	public void getDate() {
		Object obj = sqlSession.selectOne(NAMESPACE + "getDate");
		System.out.println(obj);
	}
	// 주간반 조회
//	public List<MemberVo> selectWeekly(){
//		List<MemberVo> weekly = sqlSession.selectList(NAMESPACE + "selectWeekly");
//		return weekly;
//		}
//		
//		// 주말반 조회
//	public List<MemberVo> selectWeekend(){
//		List<MemberVo> weekend = sqlSession.selectList(NAMESPACE + "selectWeekend");
//		return weekend;
//		}
//		
//		// 야간반 조회
//	public List<MemberVo> selectNight(){
//		List<MemberVo> night = sqlSession.selectList(NAMESPACE + "selectNight");
//		return night;
//	}
	
	public List<MemberVo> selectAll(PagingDto pagingDto) {
		System.out.println("BoardDao, selectAll, pagingDto:" + pagingDto);
		List<MemberVo> list = sqlSession.selectList(NAMESPACE + "selectAll", pagingDto);
		return list;
	}
	// 회원등록
	public void insertTeam(MemberVo memberVo) {
		System.out.println(memberVo);
		sqlSession.insert(NAMESPACE + "insertTeam", memberVo);
	}
	// 회원정보 확인
	public MemberVo memberModify(String userid) {
		System.out.println(userid);
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "memberModify", userid);
		return memberVo;
	}
//	// 로그인
//	public void login(MemberVo memberVo) {
//		 sqlSession.selectOne(NAMESPACE + "login", memberVo);
//	}
		
	}
