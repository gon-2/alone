package com.kh.alone.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.alone.dao.ClassInfoDao;
import com.kh.alone.vo.ClassInfoVo;

@Service
public class ClassInfoService {
	
	@Inject
	private ClassInfoDao dao;
	
	// 모집현황 전체조회
	public List<ClassInfoVo> selectAll(){
		List<ClassInfoVo> list = dao.selectAll();
		System.out.println("서비스 list" + list);
		return list;
	}
	
	// 주간반 조회
	public List<ClassInfoVo> selectWeekly(){
		List<ClassInfoVo> weekly = dao.selectWeekly();
		return weekly;
	}
	
	// 주말반 조회
	public List<ClassInfoVo> selectWeekend(){
		List<ClassInfoVo> weekend = dao.selectWeekend();
		return weekend;
	}
	
	// 야간반 조회
	public List<ClassInfoVo> selectNight(){
		List<ClassInfoVo> night = dao.selectNight();
		return night;
	}
	
	// 프로그래밍 조회
	public List<ClassInfoVo> selectPro(){
		List<ClassInfoVo> pro = dao.selectPro();
		return pro;
	}
	
	//디자인 조회
	public List<ClassInfoVo> selectDesign(){
		List<ClassInfoVo> design = dao.selectDesign();
		return design;
	}
	
	//제품디자인 조회
	public List<ClassInfoVo> selectProduct(){
		List<ClassInfoVo> product = dao.selectProduct();
		return product;
	}
	
	//3D프린트 조회
	public List<ClassInfoVo> selectPrint(){
		List<ClassInfoVo> print = dao.selectPrint();
		return print;
	}
	
	//사무자동화 조회
	public List<ClassInfoVo> selectOffice(){
		List<ClassInfoVo> office = dao.selectOffice();
		return office;
	}
}
