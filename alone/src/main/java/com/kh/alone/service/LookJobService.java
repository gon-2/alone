package com.kh.alone.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	// 구인 게이판 카운트
	public int job_getCount(PagingVo pagingVo) {
		int count = lookJobDao.job_getCount(pagingVo);
		return count;
	}
	
	// 구인정보 확인
	public List<LookJobVo> selectAll(PagingVo pagingVo) {
		List<LookJobVo> list = lookJobDao.selectAll(pagingVo);
		return list;
	}

	// 회사 정보 상세보기
	public LookJobVo getLookJob(int jobno) {
		LookJobVo lookJobVo = lookJobDao.getLookJob(jobno);
		return lookJobVo;
	}
	
	// 업로드 구인정보 불러오기
	public LookJobVo getLookJobUpload(LookJobVo vo) {
		LookJobVo lookJobVo = lookJobDao.getLookJobUpload(vo);
		return lookJobVo;
	}
	
	// 구인정보 업로드 이미지 저장
	public void insertJobImages(int jobno, String safeFile) {
		lookJobDao.insertJobImages(jobno, safeFile);
	}
	
	// 구인정보 이미지 불러오기
	public List<LookJobVo> JobImage(int jobno) {
		List<LookJobVo> jobImageList = lookJobDao.JobImage(jobno);
		return jobImageList;
	}
	
	// 구인 rno 얻기
	public int getJobnoNextVal() {
		int jobno = lookJobDao.getJobnoNextVal();
		return jobno;
	}
	
	// 회사구인 정보 추가하기
	public void insertJobInforMation(LookJobVo lookJobVo) {
		lookJobDao.insertJobInforMation(lookJobVo);
	}
	
	// 자격증 게시판 게시글 수
	public int test_getCount(PagingVo pagingVo) {
		int count = lookJobDao.test_getCount(pagingVo);
		return count;
	}
	
	// 자격증 안내 확인
	public List<JobTestVo> lookJobTestList(PagingVo pagingVo) {
		List<JobTestVo> list = lookJobDao.lookJobTestList(pagingVo);
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
	
	// 자격증 테이블 tno 번호 얻기
	public int getTnoNextVal() {
		int tno = lookJobDao.getTnoNextVal();
		return tno;
	}
	
	// 자격증 안내 등록하기
	public void insertTestRegist(JobTestVo jobTestVo) {
		lookJobDao.insertTestRegist(jobTestVo);
	}
	
	// 업로드 자격증 안내 불러오기
	public JobTestVo getTestUpload(JobTestVo vo) {
		JobTestVo jobTestVo = lookJobDao.getTestUpload(vo);
		return jobTestVo;
	}
	
	// 자격증 안내 이미지 저장
	public void insertTestImages(int tno, String safeFile) {
		lookJobDao.insertTestImages(tno, safeFile);
	}
	
	// 취업자 게시판 수
	public int fno_getCount(PagingVo pagingVo) {
		int count = lookJobDao.fno_getCount(pagingVo);
		return count;
	}
	
	// 취업자 현황
	public List<FindVo> findPositionList(PagingVo pagingVo) {
		List<FindVo> list = lookJobDao.findPositionList(pagingVo);
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
	
	// 취업자 현황 fno 얻기
	public int getFnoNextVal() {
		int fno = lookJobDao.getFnoNextVal();
		return fno;
	}
	
	// 취업자 현황 등록하기
	public void insertFindRegist(FindVo findVo) {
		lookJobDao.insertFindRegist(findVo);
	}
	
	// 메인페이지 취업현황 보여주기
	public List<FindVo> mainLookJob() {
		List<FindVo> findVo = lookJobDao.mainLookJob();
		return findVo;
	}
	
	// 업로드 취업현황 불러오기
	public FindVo getFindUpload(FindVo vo) {
		FindVo findVo = lookJobDao.getFindUpload(vo);
		return findVo;
	}
	
	// 취업현황 이미지 저장
	public void insertFindImages(int fno, String safeFile) {
		lookJobDao.insertFindImages(fno, safeFile);
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
	
	// 자료실 페이지 번호 얻기
	public ReferenceVo pageMove(int rno) {
		ReferenceVo referenceVo = lookJobDao.pageMove(rno);
		return referenceVo;
	}
	
	// 자료실 rno 얻기
	public int getRnoNextVal() {
		int rno = lookJobDao.getRnoNextVal();
		return rno;
	}
	
	// 자료실 글쓰기
	public void insertReferenceRoom(ReferenceVo referenceVo) {
		int rno = lookJobDao.getRnoNextVal();
		referenceVo.setRno(rno);
		System.out.println(referenceVo);
		lookJobDao.insertReferenceRoom(referenceVo);
		String[] r_images = referenceVo.getR_images();
		System.out.println(r_images);
		if (r_images != null && r_images.length > 0) {
			for (String images_name : r_images) {
				System.out.println(images_name);
				lookJobDao.insertReferenceRoomImages(images_name, rno);
			}
		}
	}
}
