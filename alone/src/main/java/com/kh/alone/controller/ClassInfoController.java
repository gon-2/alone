package com.kh.alone.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.alone.service.ClassInfoService;
import com.kh.alone.vo.ClassInfoVo;
import com.kh.alone.vo.OnlineRegistVo;

@Controller
@RequestMapping("/classInfo")
public class ClassInfoController {
	
	private static final int WEEKLY = 1;
	private static final int WEEKEND = 2;
	private static final int NIGHT = 3;
	
	private static final int PROGRAM = 1;
	private static final int OFFICE = 2;
	private static final int PRODUCT = 3;
	private static final int PRINT = 4;
	private static final int DESIGN = 5;
	
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
		
		List<ClassInfoVo> weekly = service.classListByTimeCode(WEEKLY);
		List<ClassInfoVo> weekend = service.classListByTimeCode(WEEKEND);
		List<ClassInfoVo> night = service.classListByTimeCode(NIGHT);
		
		List<ClassInfoVo> pro = service.classListByCateCode(PROGRAM);
		List<ClassInfoVo> design = service.classListByCateCode(OFFICE);
		List<ClassInfoVo> product = service.classListByCateCode(PRODUCT);
		List<ClassInfoVo> print = service.classListByCateCode(PRINT);
		List<ClassInfoVo> office = service.classListByCateCode(DESIGN);
		
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
		
		return "classInfo/onlineAgree";
	}
	
	//메인페이지에서 수강 신청 하기 눌렀을때 데이터 넘겨주기
	@RequestMapping(value="/homeRegist", method=RequestMethod.GET)
	public String selectTitle(Model model, int info_code, HttpSession session) {
		System.out.println("ㅇㅇㅇㅇㅇㅇ" + info_code);
		ClassInfoVo classInfoVo = service.selectByCno(info_code);
		session.setAttribute("classInfoVo", classInfoVo);
		return"redirect:/classInfo/onlineAgree";
	}
	
	// 온라인 접수 동의 후 입력양식
	@RequestMapping(value="/onlineRegist", method=RequestMethod.GET)
	public String onlineRegist(Model model, HttpSession session) {
		return "/classInfo/onlineRegist";
	}
	
	// 온라인 접수 동의 후 입력양식처리
	@RequestMapping(value="/onlineRegistRun", method=RequestMethod.POST)
	@ResponseBody
	public String onlineRegistRun(OnlineRegistVo vo) {
		System.out.println("onlineRegistRun");
		System.out.println("컨트롤러 입력 값 받아오기: " + vo);
		service.insertOnlineRegist(vo);
		return "success";
	}
	
	
	
	
	// 주민번호로 확인하는 진행현황확인 폼
	@RequestMapping(value="/myStatusForm", method=RequestMethod.GET)
	public String myStatusForm() {
		
		return "/classInfo/myStatusForm";
	}
	
	// 주민번호로 확인하는 진행현황확인 처리
	@RequestMapping(value="/myStatusRun", method=RequestMethod.POST)
	@ResponseBody
	public String myStatus(OnlineRegistVo vo) {
		int r_num = vo.getR_num();
		int mine = service.selectMine(r_num);
		if (mine == 0) {
			return "false";
		}
		return "success";
	}
	
	// 주민번호로 확인하는 진행현황 보여주기
	@RequestMapping(value="/myStatusView", method=RequestMethod.GET)
	public String myStatusView(Model model, int r_num) {
		List<OnlineRegistVo> mine = service.selectMineList(r_num);
		model.addAttribute("mine", mine);
		return "/classInfo/myStatusView";
	}
	

}
