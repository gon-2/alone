/*
 * 2021-01-12
 * Author : 이정훈
 * code Explanation : 고객센터 건의사항 댓글 DA 
 */


package com.kh.alone.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.alone.vo.InquiryCommentVo;

@Repository
public class InquiryCommentDao {
	
	private static final String NAMESPACE = "com.kh.alone.mappers.inquirycomment.";
	
	@Inject
	private SqlSession session;
	
	// 댓글 입력
	public void insertcomment(InquiryCommentVo commentvo) {
		session.insert(NAMESPACE + "insertcomment" , commentvo);
	}
	
	
	// 댓글 보기
	public List<InquiryCommentVo> showcomment(String inquiry_userid) {
		List<InquiryCommentVo> list = session.selectList(NAMESPACE + "showcomment" , inquiry_userid);
		return list;
	}
	
}
