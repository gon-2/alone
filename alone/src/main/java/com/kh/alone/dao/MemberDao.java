package com.kh.alone.dao;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.alone.vo.MemberBoardVo;
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
	
	public List<MemberVo> selectAll() {
		List<MemberVo> list = sqlSession.selectList(NAMESPACE + "selectAll");
		return list;
	}
	
	// 맴버 브로드 리스트 조회
	public List<MemberBoardVo> memberBoardForm() {
		List<MemberBoardVo> list = sqlSession.selectList(NAMESPACE + "memberBoardForm");
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
	// 답글추가 
	public void insertReply(MemberBoardVo memberboardVo) {
		sqlSession.insert(NAMESPACE + "insertReply", memberboardVo);
	}
		
	}
