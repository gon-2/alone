package com.kh.alone.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.alone.vo.FindVo;
import com.kh.alone.vo.JobTestVo;
import com.kh.alone.vo.LookJobVo;
import com.kh.alone.vo.PagingVo;
import com.kh.alone.vo.ReferenceVo;


@Repository
public class LookJobDao {
	
	private static final String NAMESPACE = "com.kh.alone.mappers.lookJob.";
	
	@Inject
	private SqlSession sqlSession;
	
	
	// 구인정보 확인
	public List<LookJobVo> selectAll() {
		List<LookJobVo> list = sqlSession.selectList(NAMESPACE + "selectAll");
		return list;
	}
	
	// 회사 정보 상세보기
	public LookJobVo getLookJob(int jobno) {
		System.out.println(jobno);
		LookJobVo lookJobVo = sqlSession.selectOne(NAMESPACE + "getLookJob", jobno);
		System.out.println(lookJobVo);
		return lookJobVo;
	}
	
	// 업로드 구인정보 불러오기
	public LookJobVo getLookJobUpload(LookJobVo vo) {
		LookJobVo lookJobVo = sqlSession.selectOne(NAMESPACE + "getLookJobUpload", vo);
		return lookJobVo;
	}
	
	// 구인정보 업로드 이미지 저장
	public void insertJobImages(int jobno, String safeFile) {
		System.out.println("jobno: " + jobno);
		System.out.println("safeFile: " + safeFile);
		Map<String, Object> map = new HashMap<>();
		map.put("jobno", jobno);
		map.put("job_image", safeFile);
		System.out.println("map: " + map);
		sqlSession.insert(NAMESPACE + "insertJobImages", map);
	}
	
	// 구인정보 이미지 불러오기
	public List<LookJobVo> JobImage(int jobno) {
		List<LookJobVo> jobImageList = sqlSession.selectList(NAMESPACE + "JobImages", jobno);
		return jobImageList;
	}
	
	// 구인 jobno 얻기
	public int getJobnoNextVal() {
		int jobno = sqlSession.selectOne(NAMESPACE + "getJobnoNextVal");
		return jobno;
	}
	
	// 회사구인 정보 추가
	public void insertJobInforMation(LookJobVo lookJobVo) {
		sqlSession.insert(NAMESPACE + "insertJobInforMation", lookJobVo);
	}
	
	// 자격증 안내 확인
	public List<JobTestVo> lookJobTestList() {
		List<JobTestVo> list = sqlSession.selectList(NAMESPACE + "lookJobTestList");
		return list;
	}
	
	// 자격증 안내 상세보기
	public JobTestVo getTest(int tno) {
		JobTestVo vo = sqlSession.selectOne(NAMESPACE + "getTest", tno);
		return vo;
	}
	
	// 자격증 안내 이미지 파일 받아오기
	public List<JobTestVo> testImage(int tno) {
		System.out.println(tno);
		List<JobTestVo> imageList = sqlSession.selectList(NAMESPACE + "testImage", tno);
		System.out.println(imageList);
		return imageList;
	}
	
	// 취업자 현황
	public List<FindVo> findPositionList() {
		List<FindVo> list = sqlSession.selectList(NAMESPACE + "findPositionList");
		return list;
	}
	
	// 취업자 현황 상세보기
	public FindVo getFind(int fno) {
		FindVo vo = sqlSession.selectOne(NAMESPACE + "getFind", fno);
		return vo;
	}
	
	// 취업자 현황 이미지 파일 받아오기
	public List<FindVo> findImage(int fno) {
		System.out.println(fno);
		List<FindVo> imageList = sqlSession.selectList(NAMESPACE + "findImage", fno);
		System.out.println(imageList);
		return imageList;
	}
	
	// 자료실
	public List<ReferenceVo> referenceRoomList(PagingVo pagingVo) {
		List<ReferenceVo> list = sqlSession.selectList(NAMESPACE + "referenceRoomList", pagingVo);
		return list;
	}
	
	// 자료실 상세보기
	public ReferenceVo getReference(int rno) {
		ReferenceVo vo = sqlSession.selectOne(NAMESPACE + "getReference", rno);
		return vo;
	}
	
	// 자료실 번호 무브
	public ReferenceVo pageMove(int rno) {
		ReferenceVo referenceVo = sqlSession.selectOne(NAMESPACE + "pageMove", rno);
		return referenceVo;
	}
	
	// 자료실 파일 받아오기
	public List<ReferenceVo> referenceImage(int rno) {
		List<ReferenceVo> imageList = sqlSession.selectList(NAMESPACE + "referenceImage", rno);
		return imageList;
	}
	
	// 페이지 카운터 확인하기
	public int r_getCount(PagingVo pagingVo) {
		int count = sqlSession.selectOne(NAMESPACE + "r_getCount", pagingVo);
		return count;
	}
	
	// 자료실 rno 얻기
	public int getRnoNextVal() {
		int rno = sqlSession.selectOne(NAMESPACE + "getRnoNextVal");
		return rno;
	}
	
	// 자료실 게시판 추가
	public void insertReferenceRoom(ReferenceVo referenceVo) {
		System.out.println(referenceVo);
		sqlSession.insert(NAMESPACE + "insertReferenceRoom", referenceVo);
		
	}
	
	// 자료실 이미지 추가하기
	public void insertReferenceRoomImages(String images_name, int rno) {
		if (!images_name.equals("")) {
			Map<String, Object> map = new HashMap<>();
			map.put("r_images", images_name);
			map.put("rno", rno);
			sqlSession.insert(NAMESPACE + "insertReferenceRoomImages", map);			
		}
	}
	
}
