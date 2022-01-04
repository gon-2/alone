package com.kh.alone.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.alone.dao.MemberDao;
import com.kh.alone.vo.MemberVo;
import com.kh.alone.vo.PagingDto;



@Service
public class MemberService {

	@Inject
	private MemberDao boardDao;
	
	public List<MemberVo> selectAll(PagingDto pagingDto) {
		List<MemberVo> list = boardDao.selectAll(pagingDto);
		return list;
	}
	
//	@Transactional
	public void insertTeam(MemberVo boardVo) {
//		int bno = boardDao.getBnoNextVal(); // seq_bno.nextval
		boardDao.insertTeam(boardVo); // tbl_board
	
	}
	
//	public BoardVo getBoard(int bno) {
//		boardDao.updateViewcnt(bno);
//		BoardVo boardVo = boardDao.getBoard(bno);
//		String[] filenames = boardDao.getFilenames(bno);
//		boardVo.setFiles(filenames);
//		return boardVo;
//	}
//	
//	@Transactional
//	public String[] deleteBoard(int bno) {
//		String[] filenames = boardDao.getFilenames(bno); // upload 폴더의 파일 삭제용
//		boardDao.deleteAttach(bno); // 첨부파일 데이터 삭제(tbl_attach)
//		boardDao.deleteBoard(bno); // 게시글 삭제(tbl_board)
//		return filenames;
//	}
//	
//	public void modifyBoard(BoardVo boardVo) {
//		boardDao.modifyBoard(boardVo);
//	}
//	
//	public int getCount(PagingDto pagingDto) {
//		int count = boardDao.getCount(pagingDto);
//		return count;
//	}

	
	}
	
//	@Transactional
//	public void insertReply(BoardVo boardVo) {
//		boardDao.updateReSeq(boardVo);
//		System.out.println("BoardService, insertReply, update....");
//		boardDao.insertReply(boardVo);
//		System.out.println("BoardService, insertReply, insert....");
//	}

