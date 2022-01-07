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
	// 상담자 댓글 보기
	public List<RegistCommentVo> listcomment(){
		List<RegistCommentVo> list = commentDao.listcomment();
		return list;
	}
}
