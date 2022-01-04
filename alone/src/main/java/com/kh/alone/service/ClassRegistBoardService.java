/*
 * 2021-01-04
 * Author : 이정훈
 * code Explanation : 수강신청 게시판 서비스
 */

package com.kh.alone.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.alone.dao.ClassRegistBoardDao;
import com.kh.alone.vo.PagingDto;
import com.kh.alone.vo.RegistBoardVo;

@Service
public class ClassRegistBoardService {
	@Inject
	private ClassRegistBoardDao registboardDao;
	
	public int cntBoard(PagingDto dto) {
		int count = registboardDao.cntBoard(dto);
		return count;
	}
	
	// 게시판 글 입력
	public void registClassBoard(RegistBoardVo registboardvo) {
		registboardDao.registClassBoard(registboardvo);
	}
	
	// 게시판 글 전체 조회
	public List<RegistBoardVo> listBoard(){
		List<RegistBoardVo> list = registboardDao.listBoard();
		return list;
	}
}