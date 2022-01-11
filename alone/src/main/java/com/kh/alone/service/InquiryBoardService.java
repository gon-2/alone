/*
 * 2021-01-11
 * Author : 이정훈
 * code Explanation : 건의사항 게시판 Service
 */

package com.kh.alone.service;

import java.util.List;

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
	public InquiryBoardVo getBoard(String inquiry_title) {
		InquiryBoardVo vo = boardDao.getBoard(inquiry_title);
		return vo;
	}
}
