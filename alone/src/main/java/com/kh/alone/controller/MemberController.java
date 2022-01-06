package com.kh.alone.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.alone.service.MemberService;
import com.kh.alone.vo.ClassInfoVo;
import com.kh.alone.vo.MemberVo;
import com.kh.alone.vo.PagingDto;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	// 모집현황 페이지에서 조회기능
//		@RequestMapping(value="modify_form", method=RequestMethod.GET)
//		public String selectAll(Model model) {
////			List<MemberVo> list = memberService.selectAll();
//			List<MemberVo> weekly = memberService.selectWeekly();
//			List<MemberVo> weekend = memberService.selectWeekend();
//			List<MemberVo> night = memberService.selectNight();
//		
////			model.addAttribute("list", list);
//			model.addAttribute("weekly", weekly);
//			model.addAttribute("weekend", weekend);
//			model.addAttribute("night", night);
//			
//			return "member/modify_form";
//		}
//		
//		
//	@RequestMapping(value="/list_all", method=RequestMethod.GET)
//	public String memberListAll(Model model, PagingDto pagingDto) {
//		System.out.println("MemberController, memberListAll, pagingDto:" + pagingDto);
//		List<MemberVo> list = memberService.selectAll(pagingDto);
//		model.addAttribute("list", list);
//		model.addAttribute("pagingDto", pagingDto);
//		return "member/list_all";
//	}
//	
	// 회원등록
	@RequestMapping(value="/regist_form", method=RequestMethod.GET)
	public String memberRegistForm() {
		return "member/regist_form";
	}
	// 등록처리
	@RequestMapping(value="/regist_run", method=RequestMethod.POST)
	public String memberRegistRun(MemberVo memberVo, RedirectAttributes rttr) {
		memberService.insertTeam(memberVo);
		return "redirect:/member/list_all";
	}
	// 로그인
	@RequestMapping(value="/login_form", method=RequestMethod.GET)
	public String login() {
		return "member/login_form";
	}

//	// 로그인처리 
//	@RequestMapping(value="/login_run", method=RequestMethod.POST)
//	public String memberLogin(MemberVo memberVo) {
//		System.out.println(memberVo);
//		memberService.login(memberVo);
//		return "redirect:/member/login_run";
//	}
	
	// 회원정보 수정
	@RequestMapping(value="/modify_form", method = RequestMethod.GET)
	public String memberModify(String userid, Model model) {
		MemberVo memberVo = memberService.memberModify(userid);
		model.addAttribute("memberVo", memberVo);
		return "member/modify_form";
	}
	


}