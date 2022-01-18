/*
 * 2021-01-12
 * Author : 이정훈
 * code Explanation : 고객센터 건의사항 댓글 SERVICE 
 */

package com.kh.alone.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.alone.dao.InquiryCommentDao;
import com.kh.alone.vo.InquiryCommentVo;

@Service
public class InquiryCommentService {
	
	@Inject
	private InquiryCommentDao commentDao;
	
	// 댓글 입력
	public void insertcomment(InquiryCommentVo commentvo) {
		commentDao.insertcomment(commentvo);
	}
	
	// 댓글 보기
	public List<InquiryCommentVo> showcomment(String inquiry_comment_userid) {
		List<InquiryCommentVo> list = commentDao.showcomment(inquiry_comment_userid);
		return list;
	}
	
}
