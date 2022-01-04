package com.kh.alone.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.alone.vo.ClassInfoVo;

@Repository
public class ClassInfoDao {
	private static final String NAMESPACE = "com.kh.alone.mappers.class.";
	
	@Inject
	private SqlSession sqlSession;
	
	// 전체조회
	public List<ClassInfoVo> selectAll(){
//		System.out.println("sqlSession:" + sqlSession);
		List<ClassInfoVo> list = sqlSession.selectList(NAMESPACE + "selectAll");
		System.out.println("다오list : " + list);
		return list;
	}
	
	// 주간반 조회
	public List<ClassInfoVo> selectWeekly(){
		List<ClassInfoVo> weekly = sqlSession.selectList(NAMESPACE + "selectWeekly");
		return weekly;
	}
	
	// 주말반 조회
	public List<ClassInfoVo> selectWeekend(){
		List<ClassInfoVo> weekend = sqlSession.selectList(NAMESPACE + "selectWeekend");
		return weekend;
	}
	
	// 야간반 조회
	public List<ClassInfoVo> selectNight(){
		List<ClassInfoVo> night = sqlSession.selectList(NAMESPACE + "selectNight");
		return night;
	}
	
	
}
	