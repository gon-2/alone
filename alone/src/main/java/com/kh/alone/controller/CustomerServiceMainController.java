/*
 * 2021-01-04
 * Author : 이정훈
 * code Explanation : 고객센터 메인 홈페이지 컨트롤러
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
import com.kh.alone.vo.RegistBoardVo;

@Controller
@RequestMapping("/customer_main")
public class CustomerServiceMainController {
	
	@Inject
	private ClassRegistBoardService registBoardService;
	
	// 고객센터 홈페이지
	@RequestMapping(value="/home" , method=RequestMethod.GET)
	public String MainPage(Model model , HttpSession session) {
		List<RegistBoardVo> classregistList = registBoardService.countThird();
		model.addAttribute("classregistList" , classregistList);
		return "/service_center/main_page";
	}
	
	// 공지사항 페이지
	@RequestMapping(value="/notice" , method=RequestMethod.GET)
	public String NoticePage() {
		return "/service_center/notice_page";
	}
	
	// 문의사항 페이지
	@RequestMapping(value="/inquire" , method=RequestMethod.GET)
	public String inquirePage() {
		return "/service_center/inquire_page";
	}
	
	// FAQ 페이지
	@RequestMapping(value="/qna" , method=RequestMethod.GET)
	public String FaqPage() {
		return "/service_center/faq_page";
	}
	
	// 수강생 상담 페이지
	@RequestMapping(value="/consult" , method=RequestMethod.GET)
	public String consultPage() {
		return "/service_center/consult_page";
	}

	
}
