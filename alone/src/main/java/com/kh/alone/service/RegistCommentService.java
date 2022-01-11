/*
 * 2021-01-06
 * Author : 이정훈
 * code Explanation : 고객센터 수강신청 댓글 서비스
 */

package com.kh.alone.service;


import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.kh.alone.dao.ClassRegistBoardDao;
import com.kh.alone.dao.RegistCommentDao;
import com.kh.alone.vo.RegistCommentVo;

@Service
public class RegistCommentService {
	
	@Inject
	private RegistCommentDao commentDao;
	
	// 댓글 입력
	public void insertcomment(RegistCommentVo commentvo) {
		commentDao.insertcomment(commentvo);
	}
	
	// 해당글의 상담자 댓글정보 조회
	public List<RegistCommentVo> getcomment(int class_board_number){
		List<RegistCommentVo> list = commentDao.getcomment(class_board_number);
		return list;
	}
	
	// 댓글 삭제
	public void deletecomment() {
		commentDao.deletecomment();
	}
}
