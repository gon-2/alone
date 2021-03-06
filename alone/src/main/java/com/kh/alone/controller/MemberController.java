package com.kh.alone.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.alone.service.MemberService;
import com.kh.alone.vo.MemberBoardVo;
import com.kh.alone.vo.MemberVo;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Inject
	private MemberService memberService;
	
	
	@RequestMapping(value="/list_all", method=RequestMethod.GET)
	public String memberListAll(Model model) {
		System.out.println("MemberController, memberListAll");
		List<MemberVo> list = memberService.selectAll();
		model.addAttribute("list", list);
				return "/member/list_all";
	}
	
	// 회원등록
	@RequestMapping(value="/regist_form", method=RequestMethod.GET)
	public String memberRegistForm() {
		return "redirect:/regist_form";
	}
	
	// 등록처리
	@RequestMapping(value="/regist_run", method=RequestMethod.POST)
	public String memberRegistRun(MemberVo memberVo) {
		memberService.insertMember(memberVo);
		return "redirect:/";
	}
	
	// 회원정보 수정
	@RequestMapping(value="/modify_form", method=RequestMethod.GET)
	public String memberModify() {
		return "/member/modify_form";
	}
	// 수정처리 
	@RequestMapping(value="/modify_run", method=RequestMethod.POST)
	public String modifyRun(MemberVo memberVo) {
		memberService.modifyRun(memberVo);
		return "redirect:/";
	}
	// 내 게시판
	@RequestMapping(value="/board_form", method = RequestMethod.GET)
	public String memberBoardForm(Model model) {
		List<MemberBoardVo> list = memberService.memberBoardForm();
		model.addAttribute("list", list);
//		System.out.println(list);
		return "/member/board_form";
	}
	
	
	// 게시글 양식
	@RequestMapping(value="/board_form_reply", method=RequestMethod.GET)
	public String replyForm(MemberBoardVo memberBoardVo) {
		return "/member/board_form_reply";
	}
	
	// 게시글 글 처리
	@RequestMapping(value="/board_form_reply_run", method=RequestMethod.POST)
	public String replyRun(MemberBoardVo memberBoardVo) {
		System.out.println("MemberController, replyRun, memberBoardVo:" + memberBoardVo);
		memberService.insertReply(memberBoardVo);
		return "redirect:/member/board_form";
	}
	
	// 내 강의실
	@RequestMapping(value="/class_form", method=RequestMethod.GET)
	public String ClassForm() {
		return "/member/class_form";
	}
	
	// 내 강의실 처리 	
	@RequestMapping(value="/class_form_run", method=RequestMethod.GET)
	public String ClassFormRun() {
		return "/member/class_form_run";
	}
	
	// 내 강의실 처리2 	
	@RequestMapping(value="/class_form_run2", method=RequestMethod.GET)
	public String ClassFormRun2() {
		return "/member/class_form_run2";
	}
	
	// 회원탈퇴  
	@RequestMapping(value="/drop", method = RequestMethod.GET)
	public String memberOut() {
		//HttpSession session, Model model
		// 로그인한 다음에 테스트
//		String userid = "user01";
//		MemberVo memberVo = memberService.memberOut(userid);
//		model.addAttribute("memberVo", memberVo);		
		return "member/drop"; 
	}
	
	// 회원탈퇴 처리 
	@ResponseBody
	@RequestMapping(value="/drop_run", method = RequestMethod.POST)
	public String memberOutRun(HttpSession session) {
		System.out.println("/drop_run 실행 됨");
		MemberVo memberVo = (MemberVo)session.getAttribute("memberVo");
		String userid = memberVo.getUserid();
		try {
			memberService.memberOutRun(userid);
			
		} catch(Exception e){
			e.printStackTrace();
		}
//		System.out.println("MemberController, memberOut, userid : " + userid);
		return "success";
	}
	
	// 게시판 상세 보기- 답글
		@RequestMapping(value="/answer_form", method=RequestMethod.GET)
		public String getMemberBoard(Model model , MemberBoardVo memberBoardVo) {
			model.addAttribute("memberBoardVo" , memberBoardVo);
			return "/member/answer_form";
		}
		
	//  답글처리 	
		@RequestMapping(value="/answer_form_run", method=RequestMethod.POST)
		public String insertResponse(Model model, MemberBoardVo memberBoardVo) {
			System.out.println("MemberController, insertResponse, memberBoardVo:" + memberBoardVo);
			memberService.insertResponse(memberBoardVo);
			return "redirect:/member/board_form";
		}
}

