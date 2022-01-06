package com.kh.alone.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.alone.vo.RegistCommentVo;

@Repository
public class RegistCommentDao {
	
	private static final String NAMESPACE = "com.kh.alone.mappers.comment.";

	@Inject
	private SqlSession session;
	
	// 댓글 입력
	public void insertcomment(RegistCommentVo commentvo) {
		session.insert(NAMESPACE + "insertcomment" , commentvo);
	}

}
