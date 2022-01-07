package com.kh.alone.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.alone.dao.LookJobDao;
import com.kh.alone.vo.FindVo;
import com.kh.alone.vo.JobTestVo;
import com.kh.alone.vo.LookJobVo;
import com.kh.alone.vo.PagingVo;
import com.kh.alone.vo.ReferenceVo;

@Service
public class LookJobService {

	@Inject
	private LookJobDao lookJobDao;
	
	// 구인정보 확인
	public List<LookJobVo> selectAll() {
		List<LookJobVo> list = lookJobDao.selectAll();
		return list;
	}

	// 회사 정보 상세보기
	public LookJobVo getLookJob(int jobno) {
		LookJobVo lookJobVo = lookJobDao.getLookJob(jobno);
		return lookJobVo;
	}
	
	// 자격증 안내 확인
	public List<JobTestVo> lookJobTestList() {
		List<JobTestVo> list = lookJobDao.lookJobTestList();
		return list;
	}
	
	// 자격증 안내 상세보기
	public JobTestVo getTest(int tno) {
		JobTestVo vo = lookJobDao.getTest(tno);
		return vo;
	}
	
	// 자격증 안내 이미지 파일 받아오기
	public List<JobTestVo> testImage(int tno) {
		List<JobTestVo> imageList = lookJobDao.testImage(tno);
		return imageList;
	}
	
	// 취업자 현황
	public List<FindVo> findPositionList() {
		List<FindVo> list = lookJobDao.findPositionList();
		return list;
	}
	
	// 취업자 현황 상세보기
	public FindVo getFind(int fno) {
		FindVo vo = lookJobDao.getFind(fno);
		return vo;
	}
	
	// 취업자 현황 이미지 파일 받아오기
	public List<FindVo> findImage(int fno) {
		List<FindVo> imageList = lookJobDao.findImage(fno);
		return imageList;
	}
	
	// 자료실
	public List<ReferenceVo> referenceRoomList(PagingVo pagingVo) {
		List<ReferenceVo> list = lookJobDao.referenceRoomList(pagingVo);
		return list;
	}
	
	// 자료실 상세보기
	public ReferenceVo getReference(int rno) {
		ReferenceVo vo = lookJobDao.getReference(rno);
		return vo;
	}
	
	// 자료실 파일 받아오기
	public List<ReferenceVo> referenceImage(int rno) {
		List<ReferenceVo> imageList = lookJobDao.referenceImage(rno);
		return imageList;
	}
	
	// 자료실 페이지 카운터 확인하기
	public int r_getCount(PagingVo pagingVo) {
		int count = lookJobDao.r_getCount(pagingVo);
		return count;
	}
}
