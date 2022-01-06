package com.kh.alone.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.alone.service.ClassInfoService;
import com.kh.alone.vo.ClassInfoVo;
import com.kh.alone.vo.OnlineRegistVo;

@RestController
@RequestMapping("/classInfo")
public class ClassInfoController {
	
	@Inject
	private ClassInfoService service;
	
	//관리자 수업관리페이지
	@RequestMapping(value="/admin_list_all", method=RequestMethod.GET)
	public String adminSelectall(Model model) {
		return "";
	}
	
	// 모집현황 페이지에서 조회기능
	@RequestMapping(value="/list_all", method=RequestMethod.GET)
	public String selectAll(Model model) {
		List<ClassInfoVo> list = service.selectAll();
		List<ClassInfoVo> weekly = service.selectWeekly();
		List<ClassInfoVo> weekend = service.selectWeekend();
		List<ClassInfoVo> night = service.selectNight();
		List<ClassInfoVo> pro = service.selectPro();
		List<ClassInfoVo> design = service.selectDesign();
		List<ClassInfoVo> product = service.selectProduct();
		List<ClassInfoVo> print = service.selectPrint();
		List<ClassInfoVo> office = service.selectOffice();
		
		model.addAttribute("list", list);
		model.addAttribute("weekly", weekly);
		model.addAttribute("weekend", weekend);
		model.addAttribute("night", night);
		model.addAttribute("pro", pro);
		model.addAttribute("design", design);
		model.addAttribute("product", product);
		model.addAttribute("print", print);
		model.addAttribute("office", office);
		return "classInfo/list_all";
	}
	
	
	
	//온라인 접수 동의
	@RequestMapping(value="/onlineAgree", method=RequestMethod.GET)
	public String onlineAgree() {
		return "/classInfo/onlineAgree";
	}
	
	// 온라인 접수 동의 후 입력양식
	@RequestMapping(value="/onlineRegist", method=RequestMethod.GET)
	public String onlineRegist(Model model) {
		return "/classInfo/onlineRegist";
	}
	
	// 온라인 접수 동의 후 입력양식
	@RequestMapping(value="/onlineRegistRun", method=RequestMethod.POST)
	public String onlineRegistRun(OnlineRegistVo vo, RedirectAttributes rttr ) {
		System.out.println("컨트롤러 입력 값 받아오기: " + vo);
		return "/redirect:/classInfo/myStatus";
	}
	
	
	
}
