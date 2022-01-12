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
	
//	// 주간반 조회
//	public List<MemberVo> selectWeekly(){
//		List<MemberVo> weekly = memberDao.selectWeekly();
//		return weekly;
//		}
//		
//		// 주말반 조회
//	public List<MemberVo> selectWeekend(){
//		List<MemberVo> weekend = memberDao.selectWeekend();
//		return weekend;
//		}
//		
//		// 야간반 조회
//	public List<MemberVo> selectNight(){
//		List<MemberVo> night = memberDao.selectNight();
//		return night;
//		}
	
	// 회원등록
	public void insertTeam(MemberVo memberVo) {
		memberDao.insertTeam(memberVo); 
	}
	
	// 회원정보 확인
	public MemberVo memberModify(String userid) {
		MemberVo memberVo = memberDao.memberModify(userid);
		return memberVo;
	}

	// 답글확인
	public void insertReply(MemberBoardVo memberBoardVo) {
		memberDao.insertReply(memberBoardVo);
		
	}


	public MemberVo memberOut(String userid) {
		MemberVo memberVo = memberDao.memberOut(userid);
//		System.out.println("서비스에서 vo값 받아오는지 확인하기 : " + memberVo);
		return memberVo;
	
	}

}
	
	

