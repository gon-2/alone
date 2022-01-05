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
	
	// 수업추가하기
	public void insertClassInfo(ClassInfoVo vo) {
		sqlSession.insert(NAMESPACE + "insertClassInfo", vo);
	}
	
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
	
	//프로그래밍 조회
	public List<ClassInfoVo> selectPro(){
		List<ClassInfoVo> pro = sqlSession.selectList(NAMESPACE + "selectPro");
		return pro;
	}
	
	//디자인 조회
	public List<ClassInfoVo> selectDesign(){
		List<ClassInfoVo> design = sqlSession.selectList(NAMESPACE + "selectDesign");
		return design;
	}
	
	//제품디자인 조회
	public List<ClassInfoVo> selectProduct(){
		List<ClassInfoVo> product = sqlSession.selectList(NAMESPACE + "selectProduct");
		return product;
	}
	
	//3D프린트 조회
	public List<ClassInfoVo> selectPrint(){
		List<ClassInfoVo> print = sqlSession.selectList(NAMESPACE + "selectPrint");
		return print;
	}
	
	//사무자동화 조회
	public List<ClassInfoVo> selectOffice(){
		List<ClassInfoVo> office = sqlSession.selectList(NAMESPACE + "selectOffice");
		return office;
	}
	
}
	