/*
 * 2021-01-12
 * Author : 이정훈
 * code Explanation : 메인 홈페이지 Service
 */

package com.kh.alone.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.alone.dao.CustomerServiceMainDao;
import com.kh.alone.vo.InquiryBoardVo;
import com.kh.alone.vo.RegistBoardVo;

@Service
public class CustomerSeviceMainService {
	
	@Inject
	private CustomerServiceMainDao maindao;
	
	// 메인 홈페이지의 최신 수강신청 게시글 3개만 조회 ( 메인 페이지 화면만! ) 
	public List<RegistBoardVo> classRecent(){
		List<RegistBoardVo> countlist = maindao.classRecent();
		return countlist;
	}
	
	// 메인 홈페이지의 수강신청 자주묻는 질문 3개글만 조회
	public List<RegistBoardVo> classRegThird(){
		List<RegistBoardVo> thirdlist = maindao.classRegThird();
		return thirdlist;
	}
	
	// 건의사항 게시판의 3개의 최신 게시글 3개 조회
	public List<InquiryBoardVo> inquiryThird(){
		List<InquiryBoardVo> inquiryThirdList = maindao.inquiryThird();
		return inquiryThirdList;
	}
	
	//	메인홈페이지의 자주 묻는 질문 - 건의사항 , 최신 자주묻는 질문 3개의 글만 조회 ( 조회수는 10 이상 )
	public List<InquiryBoardVo> inquiryRecent(){
		List<InquiryBoardVo> inquiryRecentList = maindao.inquiryRecent();
		return inquiryRecentList;
	}
	
}
