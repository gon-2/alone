/*
 * 2021-01-11
 * Author : 이정훈
 * code Explanation : 건의사항 게시판 DAO
 */


package com.kh.alone.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.kh.alone.vo.InquiryBoardVo;
import com.kh.alone.vo.PagingDto;

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
	
	// 총 게시글 갯수
	public int countBoard(PagingDto dto) {
		int count = session.selectOne(NAMESPACE + "countBoard" , dto);
		return count;
	}
	
	// 리스트 보기
	public List<InquiryBoardVo> inquirylist(PagingDto dto){
		List<InquiryBoardVo> list = session.selectList(NAMESPACE + "inquirylist" , dto);
		return list;
	}
	// 제목 클릭 시 내용 조회
	public InquiryBoardVo getBoard(String inquiry_title) {
		InquiryBoardVo vo = session.selectOne(NAMESPACE + "getBoard" , inquiry_title);
		return vo;
	}
	
}
