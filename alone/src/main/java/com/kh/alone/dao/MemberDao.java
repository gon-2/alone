package com.kh.alone.dao;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.alone.vo.MemberBoardVo;
import com.kh.alone.vo.MemberVo;




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
	
	// 원글 등록
	public void insertReply(MemberBoardVo memberBoardVo) {
		sqlSession.insert(NAMESPACE + "insertReply", memberBoardVo);
	}
	
	// 회원탈퇴폼
	public MemberVo memberOut(String userid) {
		MemberVo memberVo = sqlSession.selectOne(NAMESPACE + "memberOut", userid);
		return memberVo;
	}
	
	// 회원탈퇴 처리 
	public void memberOutRun(String userid) {
		sqlSession.delete(NAMESPACE +"memberOutRun", userid); 
		
	}
	// 답글 쓰기
	public void insertResponse(MemberBoardVo memberBoardVo) {
		sqlSession.insert(NAMESPACE + "insertResponse", memberBoardVo);
	}
	
	// 답글 순서 변경
	public void updateReSeq(int re_seq) {
		sqlSession.update(NAMESPACE + "updateReSeq", re_seq);
	}

}
