/*
 * 2021-01-12
 * Author : 이정훈
 * code Explanation : 수강신청 게시판 Dao
 */

package com.kh.alone.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.alone.vo.InquiryBoardVo;
import com.kh.alone.vo.PagingDto;
import com.kh.alone.vo.RegistBoardVo;

@Repository
public class ClassRegistBoardDao {
	
	private static final String NAMESPACE = "com.kh.alone.mappers.board.";
	
	@Inject
	private SqlSession session;
	
	// 	수강신청 게시판 글 개수 확인
	public int cntBoard(PagingDto dto) {
		int count = session.selectOne(NAMESPACE + "countBoard" , dto);
		return count;
	}
	
	// 	수강신청 게시판 글 입력
	public void registClassBoard(RegistBoardVo registboardvo) {
		session.insert(NAMESPACE + "registClassBoard" , registboardvo);
	}
	
	// 	수강신청 게시판 글 조회
	public List<RegistBoardVo> listBoard(PagingDto dto){
		List<RegistBoardVo> list = session.selectList(NAMESPACE + "listboard" , dto);
		System.out.println("ClassRegistBoardDao, listBoard, list: " + list);
		return list;
	}
	
	// 	수강신청 게시글 조회수 
	public void viewcnt(String class_board_title) {
		session.update(NAMESPACE + "viewcnt" , class_board_title); 
	}
	
	// 	수강신청 게시글 삭제
	public void deleteBoard(String class_board_content) {
		session.delete(NAMESPACE + "deleteBoard" , class_board_content);
	}
	
	// 	수강신청 게시글 수정
	public void modcontent(RegistBoardVo registboardvo) {
		session.update(NAMESPACE + "modcontent" , registboardvo);
	}
	
	// 	수강신청 제목 클릭시 내용 보이기
	public RegistBoardVo getBoard(String class_board_title) {
		RegistBoardVo registBoardvo = session.selectOne(NAMESPACE + "getBoard" , class_board_title);
		return registBoardvo;
	}	
}
