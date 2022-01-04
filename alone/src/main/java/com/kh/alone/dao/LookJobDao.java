package com.kh.alone.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.alone.vo.FindVo;
import com.kh.alone.vo.JobTestVo;
import com.kh.alone.vo.LookJobVo;


@Repository
public class LookJobDao {
	
	private static final String NAMESPACE = "com.kh.test02.mappers.lookJob.";
	
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
	
}