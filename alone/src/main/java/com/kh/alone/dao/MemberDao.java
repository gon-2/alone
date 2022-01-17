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
	private static final String NAMESPACE = "com.kh.alone.mappers.member.";
	
	@Inject
	private SqlSession sqlSession;
	
	public void getDate() {
		Object obj = sqlSession.selectOne(NAMESPACE + "getDate");
		System.out.println(obj);
	}

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
	public void insertMember(MemberVo memberVo) {
		System.out.println(memberVo);
		sqlSession.insert(NAMESPACE + "insertMember", memberVo);
	}
	// 회원정보 확인
	public MemberVo memberModify(String userid) {
		System.out.println(userid);
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "memberModify", userid);
		return memberVo;
	}
	// 회원정보 처리 
	public MemberVo modifyRun(MemberVo memberVo) {
		sqlSession.update(NAMESPACE + "modifyRun", memberVo);
		return memberVo;
	}
	
	// 답글확인 
	public void insertReply(MemberBoardVo memberBoardVo) {
		sqlSession.insert(NAMESPACE + "insertReply", memberBoardVo);
	}
	// 회원탈퇴폼
	public MemberVo memberOut(String userid) {
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "memberOut", userid);
//		System.out.println(" 서비스 vo값 받아오는지 확인하기 : " + memberVo);
		return memberVo;
	}
	
	// 회원탈퇴 처리 
	public void memberOutRun(String userid) {
		sqlSession.delete(NAMESPACE +"memberOutRun", userid); 
		
	}

}
