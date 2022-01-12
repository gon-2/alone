package com.kh.alone.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.alone.service.InquiryBoardService;
import com.kh.alone.vo.InquiryBoardVo;
import com.kh.alone.vo.PagingDto;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {
	
	@Inject
	private InquiryBoardService inquireboardservice;
	
	@ResponseBody
	@RequestMapping(value="/insertrun" , method=RequestMethod.POST)
	public String insertinquire(InquiryBoardVo inboardVo , RedirectAttributes rttr) {
		inquireboardservice.insertinquire(inboardVo);
		System.out.println("InquiryController , insertinquire , inboardVo >> " + inboardVo);
		rttr.addFlashAttribute("msg" , "success");
		return "success";
	}
	// 게시판 리스트 조회
	@RequestMapping(value="/listall" , method=RequestMethod.GET)
	public String listAll(PagingDto dto , Model model) {
		int count = inquireboardservice.countBoard(dto);
		dto.setCount(count);
		dto.setPageInfo();
		List<InquiryBoardVo> list = inquireboardservice.inquirylist(dto);
		model.addAttribute("list" , list);
		model.addAttribute("dto" , dto);
		return "/inquiry/inquiry_list";
	}
	
	// 게시글 올리는 폼
	@RequestMapping(value="/form" , method=RequestMethod.GET)
	public String form() {
		return "/inquiry/inquiry_form";
	}
	
	// 게시글 제목 클릭하면 해당 내용들 가져오기
	@RequestMapping(value="/getBoard" , method=RequestMethod.GET)
	public String getBoard(String inquiry_title , Model model) {
		InquiryBoardVo inquiryBoardVo = inquireboardservice.getBoard(inquiry_title);
		model.addAttribute("inquiryBoardVo" , inquiryBoardVo);
		return "/inquiry/inquiry_getBoard";
	}
	
	// 비밀번호 일치시 내용 보기
/*	@RequestMapping(value="/checkPassword" , method=RequestMethod.POST)
	@ResponseBody
	public String checkPassword(String inquiry_password) {
		InquiryBoardVo inquiryBoardVo = inquireboardservice.checkPassword(inquiry_password);
		
		System.out.println("InquiryController , checkPassword , inquiryBoardVo >> " + inquiryBoardVo);
		
		if(inquiryBoardVo == null) {
			return "false";
		}
		return "true";
	}*/
	
	@ResponseBody
	@RequestMapping(value="/deleteBoard" , method=RequestMethod.POST)
	public String deleteBoard(String inquiry_password , int inquiry_number) {
		inquireboardservice.deleteBoard(inquiry_number, inquiry_password);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping(value="/updateBoard" , method=RequestMethod.POST)
	public String updateBoard(InquiryBoardVo inboardvo) {
		inquireboardservice.updateBoard(inboardvo);
		return "success";
	}
	
}
