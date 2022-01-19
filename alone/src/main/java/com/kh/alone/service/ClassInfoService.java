package com.kh.alone.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.alone.dao.ClassInfoDao;
import com.kh.alone.vo.ClassInfoVo;
import com.kh.alone.vo.StudentClassRegistVo;

@Service
public class ClassInfoService {
	
	@Inject
	private ClassInfoDao dao;
	
	// 수업추가하기
	public void insertClassInfo(ClassInfoVo vo) {
		dao.insertClassInfo(vo);
	}
	
	// 수업 수정하기
	public void classInfoModify(ClassInfoVo vo) {
		dao.classInfoModify(vo);
	}
	
	//수업 삭제하기
	public void classInfoDelete(int info_code) {
		dao.classInfoDelete(info_code);
	}
	
	// 관리자 신청현황조회
	public List<StudentClassRegistVo> adminList(){
		List<StudentClassRegistVo> list = dao.adminList();
		return list;
	}
	
	// 관리자 신청확인체크
	public void regist_check(String r_num) {
		dao.regist_check(r_num);
	}
	
	
	// 모집현황 전체조회
	public List<ClassInfoVo> selectAll(){
		List<ClassInfoVo> list = dao.selectAll();
		return list;
	}
	
	//수업 제목으로 조회
	public List<ClassInfoVo> classListByTitle(String c_title) {
		List<ClassInfoVo> classInfoVo = dao.classListByTitle(c_title);
		return classInfoVo;
	}
	
	// info_code로 조회
	public ClassInfoVo selectByCno(int info_code){
		ClassInfoVo classInfoVo = dao.selectByCno(info_code);
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
	public void insertOnlineRegist(StudentClassRegistVo vo) {
		dao.insertOnlineRegist(vo);
	}
	
	// 주민번호로 나의 온라인 신청현황 확인하기
	public StudentClassRegistVo selectMine(String r_num){
		StudentClassRegistVo mine = dao.selectMine(r_num);
		return mine;
	}
	
	public List<StudentClassRegistVo> selectMineList(String r_num){
		List<StudentClassRegistVo> mineList = dao.selectMineList(r_num);
		return mineList;
	}
	
	// 수업정보 상세보기
	public ClassInfoVo getClassInfo(int info_code) {
		ClassInfoVo vo = dao.getClassInfo(info_code);
		return vo;
	}
}
