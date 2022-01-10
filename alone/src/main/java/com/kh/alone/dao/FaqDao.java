/*
 * 2021-01-07
 * Author : 이정훈
 * code Explanation : 자주 묻는 질문 DAO
 */


package com.kh.alone.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.alone.vo.RegistBoardVo;

@Repository
public class FaqDao {
	
	private static final String NAMESPACE = "com.kh.alone.mappers.faq.";
	
	@Inject
	private SqlSession session;
	
	// 조회수 50개 이상의 수강신청 게시글 출력
	public List<RegistBoardVo> classBoardSetViewcnt(){
		List<RegistBoardVo> list = session.selectList(NAMESPACE + "classBoardSetViewcnt");
		return list;
	}
	
	// 자주묻는 게시판에서 링크 클릭하면 해당 내용으로 이동 
	public RegistBoardVo faqgetBoard(String class_board_title) {
		RegistBoardVo registBoardvo = session.selectOne(NAMESPACE + "faqgetBoard" , class_board_title);
		return registBoardvo;
	}
	
}
