/*
 * 2021-01-04
 * Author : 이정훈
 * code Explanation : 수강신청 게시판 Dao
 */

package com.kh.alone.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.alone.vo.PagingDto;
import com.kh.alone.vo.RegistBoardVo;

@Repository
public class ClassRegistBoardDao {
	
	private static final String NAMESPACE = "com.kh.alone.mappers.board.";
	
	@Inject
	private SqlSession session;
	
	// 게시판 글 개수 확인
	public int cntBoard(PagingDto dto) {
		int count = session.selectOne(NAMESPACE + "countBoard" , dto);
		return count;
	}
	
	// 게시판 글 입력
	public void registClassBoard(RegistBoardVo registboardvo) {
		session.insert(NAMESPACE + "registClassBoard" , registboardvo);
	}
	
	// 게시판 글 조회
	public List<RegistBoardVo> listBoard(PagingDto dto){
		List<RegistBoardVo> list = session.selectList(NAMESPACE + "listboard" , dto);
		System.out.println("ClassRegistBoardDao, listBoard, list: " + list);
		return list;
	}
	
	// 최신 게시글 3개만 조회
	public List<RegistBoardVo> countThree(){
		List<RegistBoardVo> list = session.selectList(NAMESPACE + "countThree");
		System.out.println("ClassRegistBoardDao, countThree, list: " + list);
		return list;
	}
}
