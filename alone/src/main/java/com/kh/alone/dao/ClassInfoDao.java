package com.kh.alone.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.alone.vo.ClassInfoVo;

@Repository
public class ClassInfoDao {
	private static final String NAMESPACE = "com.kh.alone.mappers.board.";
	
	@Inject
	private SqlSession sqlSession;
	
	public List<ClassInfoVo> selectAll(){
		System.out.println("sqlSession:" + sqlSession);
		List<ClassInfoVo> list = sqlSession.selectList(NAMESPACE + "selectAll");
		return list;
	}
	
	public void insertClassInfo(ClassInfoVo vo ) {
		sqlSession.insert(NAMESPACE + "insertClassInfo", vo);
	}
	
	public String getTime() {
		System.out.println("sqlSession:" + sqlSession);
		String time = sqlSession.selectOne(NAMESPACE + "getTime");
		return time;
	}
}
