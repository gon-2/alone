/*
 * 2021-01-07
 * Author : 이정훈
 * code Explanation : 수강신청 게시판 서비스
 */

package com.kh.alone.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.alone.dao.ClassRegistBoardDao;
import com.kh.alone.dao.RegistCommentDao;
import com.kh.alone.vo.InquiryBoardVo;
import com.kh.alone.vo.PagingDto;
import com.kh.alone.vo.RegistBoardVo;
import com.kh.alone.vo.RegistCommentVo;

@Service
public class ClassRegistBoardService {
	
	@Inject
	private ClassRegistBoardDao registboardDao;
	
	// 수강신청 게시판 글 갯수
	public int cntBoard(PagingDto dto) {
		int count = registboardDao.cntBoard(dto);
		return count;
	}
	
	// 수강신청 게시판 글 입력
	public void registClassBoard(RegistBoardVo registboardvo) {
		registboardDao.registClassBoard(registboardvo);
	}
	
	// 수강신청 게시판 글 전체 조회
	public List<RegistBoardVo> listBoard(PagingDto dto){
		List<RegistBoardVo> list = registboardDao.listBoard(dto);
		return list;
	}
	
	// 수강신청 게시판 , 제목 클릭시 내용 보이기
	@Transactional
	public RegistBoardVo getBoard(String class_board_title) {
		RegistBoardVo registBoardvo = registboardDao.getBoard(class_board_title);
		registboardDao.viewcnt(class_board_title);
		return registBoardvo;
	}
	
	// 수강신청 게시글과 댓글 삭제  ( 삭제 못하는 이유는 게시판 테이블 안에 댓글이 남아있어서 삭제 못함.. 댓글이 삭제되면 게시글도 삭제되는 것으로 대체)
	public void deleteBoard(String class_board_content) {
		registboardDao.deleteBoard(class_board_content);
	}
	
	// 수강신청 게시글 수정
	public void modcontent(RegistBoardVo registboardvo) {
		registboardDao.modcontent(registboardvo);
	}
	
}
