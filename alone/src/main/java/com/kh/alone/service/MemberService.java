package com.kh.alone.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.alone.dao.MemberDao;
import com.kh.alone.vo.MemberBoardVo;
import com.kh.alone.vo.MemberVo;
import com.kh.alone.vo.PagingDto;



@Service
public class MemberService {

	@Inject
	private MemberDao memberDao;
	
	public List<MemberVo> selectAll() {
		List<MemberVo> list = memberDao.selectAll();
		return list;
	}
	
	// 맴버 브로드 리스트 조회
	public List<MemberBoardVo> memberBoardForm() {
		List<MemberBoardVo> list = memberDao.memberBoardForm();
		return list;
	}
		
	// 회원등록
	public void insertMember(MemberVo memberVo) {
		memberDao.insertMember(memberVo); 
	}
	
	// 회원정보 확인
	public MemberVo memberModify(String userid) {
		MemberVo memberVo = memberDao.memberModify(userid);
		return memberVo;
	}
	// 회원정보 처리
	public MemberVo modifyRun(MemberVo memberVo) {
		memberDao.modifyRun(memberVo);
		return memberVo;
	}

	// 답글확인
	public void insertReply(MemberBoardVo memberBoardVo) {
		memberDao.insertReply(memberBoardVo);
		
	}
	
	// 회원탈퇴폼
	public MemberVo memberOut(String userid) {
		MemberVo memberVo = memberDao.memberOut(userid);
//		System.out.println("서비스에서 vo값 받아오는지 확인하기 : " + memberVo);
		return memberVo;
	}
	
	// 회원탈퇴 처리 
	public void memberOutRun(String userid) {
		memberDao.memberOutRun(userid);

	}
	// 멤버 게시판 상세 보기 
	public MemberBoardVo getMemberBoard(String content) {
		MemberBoardVo memberBoardVo = memberDao.getMemberBoard(content);
		return memberBoardVo;
	}

}
	
	

