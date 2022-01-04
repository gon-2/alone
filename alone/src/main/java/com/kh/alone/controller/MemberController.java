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

	// 글 전체 목록(/board/list_all)
	@RequestMapping(value="/list_all", method=RequestMethod.GET)
	public String memberListAll(Model model, PagingDto pagingDto) {
		
//		int count = memberService.getCount(pagingDto);
//		pagingDto.setCount(count);
//		pagingDto.setPageInfo();
		System.out.println("MemberController, memberListAll, pagingDto:" + pagingDto);
		List<MemberVo> list = memberService.selectAll(pagingDto);
		model.addAttribute("list", list);
		model.addAttribute("pagingDto", pagingDto);
		return "member/list_all";
	}
	
	// 글쓰기 폼(/board/regist_form)
	@RequestMapping(value="/regist_form", method=RequestMethod.GET)
	public String memberRegistForm() {
		return "member/regist_form";
	}
	
	// 글쓰기 처리(/board/regist_run)
	@RequestMapping(value="/regist_run", method=RequestMethod.POST)
	public String memberRegistRun(MemberVo boardVo, RedirectAttributes rttr) {
//			System.out.println("BoardController, boardRegistRun, boardVo:" + boardVo);
		memberService.insertTeam(boardVo);
//			rttr.addFlashAttribute("message", "regist_success");
		return "redirect:/member/list_all";
	}
	
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String mypage() {
		return "board/mypage";
	}
	
	
	
	
//	
//	@RequestMapping(value="/content", method=RequestMethod.GET)
//	public String boardContent(int bno, PagingDto pagingDto, Model model) {
//		System.out.println("BoardController, boardContent, bno:" + bno);
//		BoardVo boardVo = boardService.getBoard(bno);
//		model.addAttribute("boardVo", boardVo);
//		model.addAttribute("pagingDto", pagingDto);
//		return "board/content";
//	}
	
	// 수정 처리
//	@RequestMapping(value="/modify_run", method=RequestMethod.POST)
//	public String modifyBoard(BoardVo boardVo, PagingDto pagingDto, 
//							  RedirectAttributes rttr) {
//		System.out.println("BoardController, modifyBoard, boardVo:" + boardVo);
//		System.out.println("BoardController, modifyBoard, pagingDto:" + pagingDto);
//		boardService.modifyBoard(boardVo);
//		rttr.addFlashAttribute("message", "modify_success");
//		return "redirect:/board/content?bno=" + boardVo.getBno() + 
//				"&page=" + pagingDto.getPage() + 
//				"&perPage=" + pagingDto.getPerPage() +
//				"&searchType=" + pagingDto.getSearchType() +
//				"&keyword=" + pagingDto.getKeyword();
//	}
	
	
	
}
