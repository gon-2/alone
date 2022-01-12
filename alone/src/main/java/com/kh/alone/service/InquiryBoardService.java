/*
 * 2021-01-11
 * Author : 이정훈
 * code Explanation : 건의사항 게시판 Service
 */

package com.kh.alone.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.alone.dao.InquiryBoardDao;
import com.kh.alone.vo.InquiryBoardVo;
import com.kh.alone.vo.PagingDto;

@Service
public class InquiryBoardService {
	@Inject
	private InquiryBoardDao boardDao;
	
	// 건의사항 게시판 글 삽입
	public void insertinquire(InquiryBoardVo inboardvo) {
		int inquire_no = boardDao.getInquireNumberNextVal();
		inboardvo.setInquiry_number(inquire_no);
		boardDao.insertinquire(inboardvo);
	}
	
	// 총 게시글 갯수
	public int countBoard(PagingDto dto) {
		int count = boardDao.countBoard(dto);
		return count;
	}
	
	// 리스트 보기
	public List<InquiryBoardVo> inquirylist(PagingDto dto){
		List<InquiryBoardVo> list = boardDao.inquirylist(dto);
		return list;
	}
	
	// 제목 클릭 시 내용 조회
	@Transactional
	public InquiryBoardVo getBoard(String inquiry_title) {
		InquiryBoardVo vo = boardDao.getBoard(inquiry_title);
		boardDao.viewcnt(inquiry_title);
		return vo;
	}
	
	// 게시글 들어 가기 전 패스워드 확인
	public InquiryBoardVo checkPassword(String inquiry_password) {
		InquiryBoardVo vo = boardDao.checkPassword(inquiry_password);
		return vo;
	}
	
	// 글 번호와 비밀번호 입력 시 삭제
	public void deleteBoard(int inquiry_number , String inquiry_password) {
		boardDao.deleteBoard(inquiry_number , inquiry_password);
	}
	
	// 제목과 내용 , 작성일자 수정
	public void updateBoard(InquiryBoardVo inboardvo) {
		boardDao.updateBoard(inboardvo);
	}
}
