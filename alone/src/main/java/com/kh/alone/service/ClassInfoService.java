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
	
	public List<ClassInfoVo> selectAll(){
		List<ClassInfoVo> list = dao.selectAll();
		return list;
	}
}
