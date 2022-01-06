package com.kh.alone.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.alone.dao.MemberDao;
import com.kh.alone.vo.ClassInfoVo;
import com.kh.alone.vo.MemberVo;
import com.kh.alone.vo.PagingDto;


@Service
public class MemberService {

	@Inject
	private MemberDao memberDao;
	
	public List<MemberVo> selectAll(PagingDto pagingDto) {
		List<MemberVo> list = memberDao.selectAll(pagingDto);
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
	
//	// 로그인처리
//	public void login(MemberVo memberVo) {
//		memberDao.login(memberVo);
//	}
	
	}

			

