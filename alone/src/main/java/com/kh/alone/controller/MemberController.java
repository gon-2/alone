package com.kh.alone.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.alone.service.MemberService;
import com.kh.alone.vo.MemberVo;
import com.kh.alone.vo.PagingDto;



@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Inject
	private MemberService memberService;

	
	@RequestMapping(value="/list_all", method=RequestMethod.GET)
	public String memberListAll(Model model, PagingDto pagingDto) {
		System.out.println("MemberController, memberListAll, pagingDto:" + pagingDto);
		List<MemberVo> list = memberService.selectAll(pagingDto);
		model.addAttribute("list", list);
		model.addAttribute("pagingDto", pagingDto);
		return "member/list_all";
	}
	

	@RequestMapping(value="/regist_form", method=RequestMethod.GET)
	public String memberRegistForm() {
		return "member/regist_form";
	}
	

	@RequestMapping(value="/regist_run", method=RequestMethod.POST)
	public String memberRegistRun(MemberVo boardVo, RedirectAttributes rttr) {
		memberService.insertTeam(boardVo);
		return "redirect:/member/list_all";
	}
	
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String mypage() {
		return "board/mypage";
	}
	

	
	
}
