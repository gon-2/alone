/*
 * 2021-01-11
 * Author : 이정훈
 * code Explanation : 건의사항 게시판 Service
 */

package com.kh.alone.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.alone.dao.InquiryBoardDao;
import com.kh.alone.vo.InquiryBoardVo;

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
}
