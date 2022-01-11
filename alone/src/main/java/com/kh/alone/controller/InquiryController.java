package com.kh.alone.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.alone.service.InquiryBoardService;
import com.kh.alone.vo.InquiryBoardVo;
import com.kh.alone.vo.PagingDto;

@Controller
@RestController
@RequestMapping("/inquiry")
public class InquiryController {
	
	@Inject
	private InquiryBoardService inquireboardservice;
	
	
	@RequestMapping(value="/insertrun" , method=RequestMethod.POST)
	public String insertinquire(InquiryBoardVo inboardVo , RedirectAttributes rttr) {
		inquireboardservice.insertinquire(inboardVo);
		System.out.println("InquiryController , insertinquire , inboardVo >> " + inboardVo);
		rttr.addFlashAttribute("msg" , "success");
		return "success";
	}
	
	@RequestMapping(value="/listall" , method=RequestMethod.GET)
	public String listAll(PagingDto dto) {
		return "";
	}
	
}
