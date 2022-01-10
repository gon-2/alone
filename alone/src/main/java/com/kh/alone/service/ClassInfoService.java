package com.kh.alone.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.alone.dao.ClassInfoDao;
import com.kh.alone.vo.ClassInfoVo;
import com.kh.alone.vo.OnlineRegistVo;

@Service
public class ClassInfoService {
	
	@Inject
	private ClassInfoDao dao;
	
	// 수업추가하기
	public void insertClassInfo(ClassInfoVo vo) {
		dao.insertClassInfo(vo);
	}
	
	// 모집현황 전체조회
	public List<ClassInfoVo> selectAll(){
		List<ClassInfoVo> list = dao.selectAll();
		System.out.println("서비스 list" + list);
		return list;
	}
	
	// title로 조회
	public ClassInfoVo selectByCno(int c_no){
		ClassInfoVo classInfoVo = dao.selectByCno(c_no);
		return classInfoVo;
	}
	
	
	// 타임코드로 조회
	public List<ClassInfoVo> classListByTimeCode(int time_code){
		List<ClassInfoVo> timeList = dao.classListByTimeCode(time_code);
		return timeList;
	}
		
	// 수업과정별 나누기
	public List<ClassInfoVo> classListByCateCode(int cate_code){
		List<ClassInfoVo> cate_list = dao.classListByCateCode(cate_code);
		return cate_list;
	}
	
	
	// 수강신청하기
	public void insertOnlineRegist(OnlineRegistVo vo) {
		dao.insertOnlineRegist(vo);
	}
	
	// 주민번호로 나의 온라인 신청현황 확인하기
	public int selectMine(String r_num){
		int mine = dao.selectMine(r_num);
		return mine;
	}
	
	public List<OnlineRegistVo> selectMineList(String r_num){
		List<OnlineRegistVo> mineList = dao.selectMineList(r_num);
		return mineList;
	}
}
