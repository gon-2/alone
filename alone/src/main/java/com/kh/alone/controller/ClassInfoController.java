package com.kh.alone.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.alone.service.ClassInfoService;
import com.kh.alone.vo.ClassInfoVo;
import com.kh.alone.vo.StudentClassRegistVo;

@Controller
@RequestMapping("/classInfo")
public class ClassInfoController {
	
	private static final int WEEKLY = 1;
	private static final int NIGHT = 2;
	private static final int WEEKEND = 3;
	
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
		List<ClassInfoVo> night = service.classListByTimeCode(NIGHT);
		List<ClassInfoVo> weekend = service.classListByTimeCode(WEEKEND);
		
		List<ClassInfoVo> program = service.classListByTimeCode(PROGRAM);
		List<ClassInfoVo> office = service.classListByTimeCode(OFFICE);
		List<ClassInfoVo> product = service.classListByTimeCode(PRODUCT);
		List<ClassInfoVo> print = service.classListByTimeCode(PRINT);
		List<ClassInfoVo> design = service.classListByTimeCode(DESIGN);
		
		
		model.addAttribute("list", list);
		model.addAttribute("weekly", weekly);
		model.addAttribute("night", night);
		model.addAttribute("weekend", weekend);
		model.addAttribute("program", program);
		model.addAttribute("office", office);
		model.addAttribute("product", product);
		model.addAttribute("print", print);
		model.addAttribute("design", design);
		return "classInfo/list_all";
	}
	
	
	
	// 온라인 접수 동의(메뉴바에서 접근)
	@RequestMapping(value="/onlineAgree", method=RequestMethod.GET)
	public String onlineAgree() {
		return "classInfo/onlineAgree";
	}
	
	
	
	//메인페이지에서 수강 신청 하기 눌렀을때 데이터 넘겨주기
	@RequestMapping(value="/homeRegist", method=RequestMethod.GET)
	public String selectTitle(Model model, int info_code) {
		List<ClassInfoVo> list = service.selectAll();
		model.addAttribute("list", list);
		ClassInfoVo classInfoVo = service.selectByCno(info_code);
		model.addAttribute("classInfoVo", classInfoVo);
		return "classInfo/onlineAgree";
	}
	
	// 온라인 접수 동의 후 입력양식폼
	@RequestMapping(value="/onlineRegist", method=RequestMethod.GET)
	public String onlineRegist(HttpSession session, Model model, int info_code) {
		List<ClassInfoVo> list = service.selectAll();
		
		List<ClassInfoVo> weekly = service.classListByTimeCode(WEEKLY);
		List<ClassInfoVo> night = service.classListByTimeCode(NIGHT);
		List<ClassInfoVo> weekend = service.classListByTimeCode(WEEKEND);
		ClassInfoVo classInfoVo = service.selectByCno(info_code);
		
		model.addAttribute("classInfoVo", classInfoVo);
		model.addAttribute("list", list);
		model.addAttribute("weekly", weekly);
		model.addAttribute("night", night);
		model.addAttribute("weekend", weekend);
		return "/classInfo/onlineRegist";
	}
	
	// 온라인 접수 동의 후 입력양식처리
	@ResponseBody
	@RequestMapping(value="/onlineRegistRun", method=RequestMethod.POST)
	public String onlineRegistRun(StudentClassRegistVo vo) {
		System.out.println("onlineRegistRun");
		System.out.println("컨트롤러 입력 값 받아오기: " + vo);
		service.insertOnlineRegist(vo);
		return "success";
	}
	
	// 훈련직종분류 c_time선택했을때 비동기방식으로 넘겨서 데이터 정하기
	@RequestMapping(value="/classListByTimeCode/{time_code}", method=RequestMethod.GET)
	@ResponseBody
	public List<ClassInfoVo> classListByTimeCode(@PathVariable("time_code") int time_code) {
		System.out.println("time_code:" + time_code);
		service.classListByTimeCode(time_code);
		List<ClassInfoVo> timeList = service.classListByTimeCode(time_code);
		return timeList;
	}
	
	// 훈련직종분류 선택후 cate_code선택했을때 비동기방식으로 넘겨서 데이터 정하기
	@RequestMapping(value="/classListByCateCode/{cate_code}", method=RequestMethod.GET)
	@ResponseBody
	public List<ClassInfoVo> classListByCateCode(@PathVariable("cate_code") int cate_code) {
		System.out.println("cate_code: " + cate_code);
		service.classListByTimeCode(cate_code);
		List<ClassInfoVo> cateList = service.classListByCateCode(cate_code);
		System.out.println("cateList : " + cateList);
		return cateList;
	}
	
	// 주민번호로 확인하는 진행현황확인 폼
	@RequestMapping(value="/myStatusForm", method=RequestMethod.GET)
	public String myStatusForm() {
		
		return "/classInfo/myStatusForm";
	}
	
	// 주민번호로 확인하는 진행현황확인 처리
	@RequestMapping(value="/myStatusRun", method=RequestMethod.POST)
	public String myStatus(String r_num, Model model) {
		StudentClassRegistVo mine = service.selectMine(r_num);
		model.addAttribute("r_num", r_num);
		model.addAttribute("mine", mine);
		
		List<StudentClassRegistVo> mineList = service.selectMineList(r_num);
		model.addAttribute("mineList", mineList);
		return  "/classInfo/myStatusView";
	}
	

}
