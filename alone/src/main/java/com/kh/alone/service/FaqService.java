/*
 * 2021-01-07
 * Author : 이정훈
 * code Explanation : 자주 묻는 질문 서비스
 */


package com.kh.alone.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.alone.dao.ClassRegistBoardDao;
import com.kh.alone.dao.FaqDao;
import com.kh.alone.dao.RegistCommentDao;
import com.kh.alone.vo.InquiryBoardVo;
import com.kh.alone.vo.RegistBoardVo;

@Service
public class FaqService {
	@Inject
	private FaqDao faqdao;
	
	@Inject
	private ClassRegistBoardDao registdao;
	
	// 조회수 10개 이상의 건의사항 게시글 출력
	public List<InquiryBoardVo> inquiryBoardSetViewcnt(){
		List<InquiryBoardVo> list = faqdao.inquiryBoardSetViewcnt();
		return list;
	}
	
	// 조회수 10개 이상의 수강신청 게시글 출력
	public List<RegistBoardVo> classBoardSetViewcnt(){
		List<RegistBoardVo> list = faqdao.classBoardSetViewcnt();
		return list;
	}
	
	// 자주묻는 게시판에서 링크 클릭하면 해당 내용으로 이동 + 게시글 조회수 증가
	public RegistBoardVo faqgetBoard(String class_board_title) {
		RegistBoardVo registBoardvo = faqdao.faqgetBoard(class_board_title);
		registdao.viewcnt(class_board_title);
		return registBoardvo;
	}
}
