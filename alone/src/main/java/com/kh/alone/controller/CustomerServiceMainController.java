/*
 * 2021-01-12
 * Author : 이정훈
 * code Explanation : 메인 홈페이지 controller
 */

package com.kh.alone.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.alone.service.ClassRegistBoardService;
import com.kh.alone.service.CustomerSeviceMainService;
import com.kh.alone.vo.InquiryBoardVo;
import com.kh.alone.vo.RegistBoardVo;

@Controller
@RequestMapping("/customer_main")
public class CustomerServiceMainController {
	
	@Inject
	private CustomerSeviceMainService mainservice;
	
	// 고객센터 홈페이지
	@RequestMapping(value="/home" , method=RequestMethod.GET)
	public String MainPage(Model model , HttpSession session) {
		List<InquiryBoardVo> inquiryThirdList = mainservice.inquiryThird(); 	// 건의사항에 보일 최신글 3개 
		List<InquiryBoardVo> inquiryRecentList = mainservice.inquiryRecent();	// 자주묻는 질문 (건의사항) 에 보일 최신글 3개
		List<RegistBoardVo> classregistList = mainservice.classRecent();		// 수강신청에 보일 최신글 3개
		List<RegistBoardVo> regthirdlist = mainservice.classRegThird();			// 자주묻는 질문 (수강신청) 에 보일 최신글 3개
		model.addAttribute("inquiryThirdList" , inquiryThirdList);
		model.addAttribute("inquiryRecentList" , inquiryRecentList);
		model.addAttribute("classregistList" , classregistList);
		model.addAttribute("regthirdlist" , regthirdlist);
		return "/service_center/main_page";
	}
	
	// 건의사항 페이지
	@RequestMapping(value="/inquiry_list" , method=RequestMethod.GET)
	public String inquirePage() {
		return "/inquiry/inquiry_list";
	}
	
	// FAQ 페이지 ( 수강신청 에 대한 자주묻는 질문 ) 
	@RequestMapping(value="/faq" , method=RequestMethod.GET)
	public String FaqPage() {
		return "/service_center/faq_page";
	}

	// 수강생 상담 페이지
	@RequestMapping(value="/consult" , method=RequestMethod.GET)
	public String consultPage() {
		return "/service_center/consult_page";
	}

	
}
