/*
 * 2021-01-07
 * Author : 이정훈
 * code Explanation : 고객센터 수강신청 댓글 DAO ( 상담자 댓글 입력 , 보기 ) 
 */

package com.kh.alone.dao;

import java.util.List;

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

	// 해당글의 상담자 댓글정보 조회
	public List<RegistCommentVo> listcomment(){
		List<RegistCommentVo> list = session.selectList(NAMESPACE + "commentList");
		return list;
	}
	
	// 댓글 삭제
	public void deletecomment() {
		session.delete(NAMESPACE + "deletecomment");
	}
	
}
