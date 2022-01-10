package com.kh.alone.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.alone.vo.ClassInfoVo;
import com.kh.alone.vo.OnlineRegistVo;

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
		return list;
	}
	
	// title로 조회
	public ClassInfoVo selectByCno(int c_no){
		System.out.println(c_no);
		ClassInfoVo classInfoVo = sqlSession.selectOne(NAMESPACE + "selectByCno", c_no);
		return classInfoVo;
	}
	
	
	// 타임코드로 주말 주간 야간 조회
	public List<ClassInfoVo> classListByTimeCode(int time_code){
		List<ClassInfoVo> timeList = sqlSession.selectList(NAMESPACE + "classListByTimeCode", time_code);
		return timeList;
	}
	
	
	
	// 수업과정별 나누기
	public List<ClassInfoVo> classListByCateCode(int cate_code){
		List<ClassInfoVo> cate_list = sqlSession.selectList(NAMESPACE + "classListByCateCode", cate_code);
		return cate_list;
	}
	
	
	// 수강신청하기
	public void insertOnlineRegist(OnlineRegistVo vo) {
		System.out.println("dao, OnlineRegistVo:" +  vo);
		sqlSession.insert(NAMESPACE + "insertOnlineRegist", vo);
	}
	
	
	// 주민번호로 나의 신청현황 확인하기
	public int selectMine(String r_num){
		int mine = sqlSession.selectOne(NAMESPACE + "selectMine", r_num);
		return mine;
	}
	
	public List<OnlineRegistVo> selectMineList(String r_num){
		List<OnlineRegistVo> mineList = sqlSession.selectList(NAMESPACE + "selectMineList", r_num);
		return mineList;
	}
	
}
	