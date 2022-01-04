package com.kh.alone.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.alone.service.ClassInfoService;
import com.kh.alone.vo.ClassInfoVo;

@Controller
@RequestMapping("/classInfo")
public class ClassInfoController {
	
	@Inject
	private ClassInfoService service;
	
	// 모집현황 페이지 전체, 주간반, 주말반, 야간반조회
	@RequestMapping(value="/list_all", method=RequestMethod.GET)
	public String selectAll(Model model) {
		List<ClassInfoVo> list = service.selectAll();
		List<ClassInfoVo> weekly = service.selectWeekly();
		List<ClassInfoVo> weekend = service.selectWeekend();
		List<ClassInfoVo> night = service.selectNight();
		
		model.addAttribute("list", list);
		model.addAttribute("weekly", weekly);
		model.addAttribute("weekend", weekend);
		model.addAttribute("night", night);
		System.out.println("컨트롤러list: " + list);
		System.out.println("컨트롤러weekly: " + weekly);
		System.out.println("컨트롤러weekend: " + weekend);
		System.out.println("컨트롤러night: " + night);
		return "classInfo/list_all";
	}
}
