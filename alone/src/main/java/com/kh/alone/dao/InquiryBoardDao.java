/*
 * 2021-01-11
 * Author : 이정훈
 * code Explanation : 건의사항 게시판 DAO
 */


package com.kh.alone.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.kh.alone.vo.InquiryBoardVo;

@Repository
public class InquiryBoardDao {
	
	private static final String NAMESPACE = "com.kh.alone.mappers.inquiry.";
	
	@Inject
	private SqlSession session;
	
	// 건의사항 게시판 글 삽입
	public void insertinquire(InquiryBoardVo inboardvo) {
		session.insert(NAMESPACE + "insertinquiry" , inboardvo);
	}

	// 게시글 번호 찾기
	public int getInquireNumberNextVal() {
		int inquire_no = session.selectOne(NAMESPACE + "getInquiryNumberNextVal");
		return inquire_no;
	}
	
}
