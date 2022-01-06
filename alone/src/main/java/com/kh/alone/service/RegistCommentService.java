package com.kh.alone.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.alone.dao.RegistCommentDao;
import com.kh.alone.vo.RegistBoardVo;
import com.kh.alone.vo.RegistCommentVo;

@Service
public class RegistCommentService {
	
	@Inject
	private RegistCommentDao commentDao;
	
	// 댓글 입력
	public void insertcomment(RegistCommentVo commentvo) {
		commentDao.insertcomment(commentvo);
	}
	
}
