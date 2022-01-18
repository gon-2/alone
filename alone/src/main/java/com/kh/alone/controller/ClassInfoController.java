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
import com.kh.alone.service.ReviewService;
import com.kh.alone.vo.ClassInfoVo;
import com.kh.alone.vo.ReviewVo;
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
	private ClassInfoService classInfoService;
	
	@Inject
	private ReviewService reviewService;
	
	
	// 수업등록하기폼
	@RequestMapping(value="/insertClassInfo", method=RequestMethod.GET)
	public String insertClassInfo() {
		return "classInfo/insertClassInfo";
	}
	
	//수업 등록하기 처리
	@RequestMapping(value="/insertClassInfoRun", method=RequestMethod.POST)
	@ResponseBody
	public String insertClassInfoRun(ClassInfoVo vo) {
		System.out.println(vo);
		classInfoService.insertClassInfo(vo);
		return "success";
	}
	
	// 모집현황 페이지에서 조회기능
	@RequestMapping(value="/list_all", method=RequestMethod.GET)
	public String selectAll(Model model) {
		List<ClassInfoVo> list = classInfoService.selectAll();
		
		List<ClassInfoVo> weekly = classInfoService.classListByTimeCode(WEEKLY);
		List<ClassInfoVo> night = classInfoService.classListByTimeCode(NIGHT);
		List<ClassInfoVo> weekend = classInfoService.classListByTimeCode(WEEKEND);
		
		
		
		model.addAttribute("list", list);
		model.addAttribute("weekly", weekly);
		model.addAttribute("night", night);
		model.addAttribute("weekend", weekend);
		return "classInfo/list_all";
	}
	
	
	// 수업정보 상세보기
	@RequestMapping(value="/classInfoView", method=RequestMethod.GET)
	public String classInfoView(Model model, int info_code) {
		ClassInfoVo classInfoVo = classInfoService.getClassInfo(info_code);
		model.addAttribute("classInfoVo", classInfoVo);
		System.out.println("classInfoVo: " + classInfoVo);
		return "/classInfo/classInfoView";
		
	}
	
	
	// 온라인 접수 동의(메뉴바에서 접근)
	@RequestMapping(value="/onlineAgree", method=RequestMethod.GET)
	public String onlineAgree() {
		return "classInfo/onlineAgree";
	}
	
	
	
	//메인페이지에서 수강 신청 하기 눌렀을때 데이터 넘겨주기
	@RequestMapping(value="/homeRegist", method=RequestMethod.GET)
	public String selectTitle(Model model, int info_code) {
		List<ClassInfoVo> list = classInfoService.selectAll();
		model.addAttribute("list", list);
		ClassInfoVo classInfoVo = classInfoService.selectByCno(info_code);
		model.addAttribute("classInfoVo", classInfoVo);
		return "classInfo/onlineAgree";
	}
	
	// 온라인 접수 동의 후 입력양식폼
	@RequestMapping(value="/onlineRegist", method=RequestMethod.GET)
	public String onlineRegist(HttpSession session, Model model, int info_code) {
		List<ClassInfoVo> list = classInfoService.selectAll();
		
		List<ClassInfoVo> weekly = classInfoService.classListByTimeCode(WEEKLY);
		List<ClassInfoVo> night = classInfoService.classListByTimeCode(NIGHT);
		List<ClassInfoVo> weekend = classInfoService.classListByTimeCode(WEEKEND);
		ClassInfoVo classInfoVo = classInfoService.selectByCno(info_code);
		
		model.addAttribute("classInfoVo", classInfoVo);
		model.addAttribute("list", list);
		model.addAttribute("weekly", weekly);
		model.addAttribute("night", night);
		model.addAttribute("weekend", weekend);
		return "/classInfo/onlineRegist";
	}
	
	// 메뉴 카테고리에서 바로 이동하기
	@RequestMapping(value="/onlineRegist2", method=RequestMethod.GET)
	public String onlineRegist2(Model model) {
		List<ClassInfoVo> list = classInfoService.selectAll();
		
		List<ClassInfoVo> weekly = classInfoService.classListByTimeCode(WEEKLY);
		List<ClassInfoVo> night = classInfoService.classListByTimeCode(NIGHT);
		List<ClassInfoVo> weekend = classInfoService.classListByTimeCode(WEEKEND);
		
		
		model.addAttribute("list", list);
		model.addAttribute("weekly", weekly);
		model.addAttribute("night", night);
		model.addAttribute("weekend", weekend);
		return"/classInfo/onlineRegist";
	}
	
	// 온라인 접수 동의 후 입력양식처리
	@ResponseBody
	@RequestMapping(value="/onlineRegistRun", method=RequestMethod.POST)
	public String onlineRegistRun(StudentClassRegistVo vo) {
		System.out.println("onlineRegistRun");
		System.out.println("컨트롤러 입력 값 받아오기: " + vo);
		classInfoService.insertOnlineRegist(vo);
		return "success";
	}
	
	// 훈련직종분류 c_time선택했을때 비동기방식으로 넘겨서 데이터 정하기
	@RequestMapping(value="/classListByTimeCode/{time_code}", method=RequestMethod.GET)
	@ResponseBody
	public List<ClassInfoVo> classListByTimeCode(@PathVariable("time_code") int time_code) {
		System.out.println("time_code:" + time_code);
		classInfoService.classListByTimeCode(time_code);
		List<ClassInfoVo> timeList = classInfoService.classListByTimeCode(time_code);
		return timeList;
	}
	
	// 훈련직종분류 선택후 cate_code선택했을때 비동기방식으로 넘겨서 데이터 정하기
	@RequestMapping(value="/classListByCateCode/{cate_code}", method=RequestMethod.GET)
	@ResponseBody
	public List<ClassInfoVo> classListByCateCode(@PathVariable("cate_code") int cate_code) {
		System.out.println("cate_code: " + cate_code);
		classInfoService.classListByCateCode(cate_code);
		List<ClassInfoVo> cateList = classInfoService.classListByCateCode(cate_code);
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
		StudentClassRegistVo mine = classInfoService.selectMine(r_num);
		model.addAttribute("r_num", r_num);
		model.addAttribute("mine", mine);
		
		List<StudentClassRegistVo> mineList = classInfoService.selectMineList(r_num);
		model.addAttribute("mineList", mineList);
		return  "/classInfo/myStatusView";
	}
	
	
	// 수료생후기 리스트
	@RequestMapping(value="/reviewList", method=RequestMethod.GET)
	public String selectReviewList(Model model) {
		List<ReviewVo> list = reviewService.selectReviewList();
		
		
		List<ClassInfoVo> program = reviewService.selectReviewListByCateCode(PROGRAM);
		List<ClassInfoVo> office = reviewService.selectReviewListByCateCode(OFFICE);
		List<ClassInfoVo> product = reviewService.selectReviewListByCateCode(PRODUCT);
		List<ClassInfoVo> print = reviewService.selectReviewListByCateCode(PRINT);
		List<ClassInfoVo> design = reviewService.selectReviewListByCateCode(DESIGN);
		
		model.addAttribute("list", list);
		model.addAttribute("program", program);
		model.addAttribute("office", office);
		model.addAttribute("product", product);
		model.addAttribute("print", print);
		model.addAttribute("design", design);
		return "/classInfo/reviewList";
	}
	
	// 후기 상세보기
	@RequestMapping(value="/reviewContent", method=RequestMethod.GET)
	public String reviewContent(Model model, int review_number) {
		ReviewVo reviewVo = reviewService.getReview(review_number);
		model.addAttribute("reviewVo", reviewVo);
		return "classInfo/reviewContent";
	}
	
	// 후기 작성하기 폼
	@RequestMapping(value="/reviewRegist", method=RequestMethod.GET)
	public String boardRegistForm() {
		return "classInfo/reviewRegist";
	}
	
	// 후기작성하기처리
	@RequestMapping(value="/reviewRegistRun", method=RequestMethod.POST)
	@ResponseBody
	public String reviewRegistRun(ReviewVo vo) {
		System.out.println("리뷰 vo" + vo);
		reviewService.insertReview(vo);
		return "success";
	}
	
	// 후기 수정하기
	@RequestMapping(value="/reviewModify", method=RequestMethod.GET)
	public String modifyReview(Model model, int review_number) {
		ReviewVo reviewVo = reviewService.getReview(review_number);
		model.addAttribute("reviewVo", reviewVo);
		return "classInfo/reviewModify";
	}
	
	// 후기 수정처리
	@RequestMapping(value="/reviewModifyRun", method=RequestMethod.POST)
	public String modifyReviewRun(ReviewVo reviewVo) {
		System.out.println(reviewVo);
		reviewService.modifyReview(reviewVo);
		return "redirect:/classInfo/reviewList";
	}
	
	// 후기 삭제
	@RequestMapping(value="/reviewDelete", method=RequestMethod.GET)
	public String reviewDelete(int review_number) {
		System.out.println("리뷰너머: " + review_number);
		reviewService.reviewDelete(review_number);
		return "redirect:/classInfo/reviewList";
	}
	
	
}
