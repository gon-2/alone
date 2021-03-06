/*
 * 2021-01-07
 * Author : 이정훈
 * code Explanation : 자주 묻는 질문 컨트롤러
 */

package com.kh.alone.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.alone.service.FaqService;
import com.kh.alone.vo.InquiryBoardVo;
import com.kh.alone.vo.RegistBoardVo;

@Controller
@RestController
@RequestMapping("/faq")
public class FaqController {
	
	@Inject
	private FaqService faqservice;
	
	
	// 자주묻는 질문 - 조회수 10개 이상의 수강신청 게시글 출력
	@RequestMapping(value="/classboard" , method=RequestMethod.GET)
	public List<RegistBoardVo> classBoardSetViewcnt(Model model) {
		List<RegistBoardVo> classboardlist = faqservice.classBoardSetViewcnt();
		model.addAttribute("classboardlist", classboardlist);
		System.out.println("QnaController , classBoardSetViewcnt, classboardlist >> " + classboardlist);
		return classboardlist;
	}
	// 자주묻는 질문 - 조회수 10개 이상의 건의사항 게시글 출력
	@RequestMapping(value="/inquiryBoard" , method=RequestMethod.GET)
	public List<InquiryBoardVo> inquiryBoardSetViewcnt(Model model){
		List<InquiryBoardVo> inquiryboardlist = faqservice.inquiryBoardSetViewcnt();
		model.addAttribute("inquiryboardlist" , inquiryboardlist);
		System.out.println("QnaController , inquiryBoardSetViewcnt , inquiryboardlist >> " + inquiryboardlist);
		return inquiryboardlist;
	}
}
