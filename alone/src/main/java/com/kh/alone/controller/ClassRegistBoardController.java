/*
 * 2021-01-04
 * Author : 이정훈
 * code Explanation : 수강신청 게시판 컨트롤러
 */

package com.kh.alone.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.alone.service.ClassRegistBoardService;
import com.kh.alone.service.RegistCommentService;
import com.kh.alone.vo.PagingDto;
import com.kh.alone.vo.RegistBoardVo;
import com.kh.alone.vo.RegistCommentVo;


@Controller
@RequestMapping("/class_board")
public class ClassRegistBoardController {
	
	@Inject
	private ClassRegistBoardService registboardservice;
	
	
	// 글 올리기 폼 이동
	@RequestMapping(value="/form" , method=RequestMethod.GET)
	public String classboardForm() {
		return "/class_regist/class_regist_board_page";
	}
	
	// 글 올리기 실행 후 수강신청 페이지로 이동해서 보여줌.
	@RequestMapping(value="/run" , method=RequestMethod.POST)
	public String classboardRun(RegistBoardVo registboardvo) {
		registboardservice.registClassBoard(registboardvo);
		return "redirect:/class_board/class_regist";
	}
	
	// 글 제목 클릭했을 때 내용 보이기
	@RequestMapping(value="/getBoard" , method=RequestMethod.GET)
	public String getBoard(String class_board_title, Model model) {
		RegistBoardVo registboardvo = registboardservice.getBoard(class_board_title);
		model.addAttribute("registboardvo" , registboardvo);
		return "/class_regist/class_regist_board_getBoard";
	}
	
	// 수강신청 페이지 리스트
	@RequestMapping(value="/class_regist" , method=RequestMethod.GET)
	public String classRegistPage(Model model , PagingDto dto) {
		int count = registboardservice.cntBoard(dto);
		dto.setCount(count);
		dto.setPageInfo();
		List<RegistBoardVo> list = registboardservice.listBoard(dto);
		model.addAttribute("dto" , dto);
		model.addAttribute("list", list);
		return "/class_regist/class_regist_page";
	}
	
	// 게시판 삭제 , (댓글 삭제 이후 게시글 삭제)
	@RequestMapping(value="/deleteBoard" , method=RequestMethod.GET)
	public String deleteBoard(String class_board_content) {
		registboardservice.deleteBoard(class_board_content);
		System.out.println("ClassRegistBoardController , deleteBoard , class_board_title >> " + class_board_content);
		return "redirect:/class_board/class_regist"; 
	}
	
	// 게시글 수정 , ( 아이디 기준 업데이트 ) 
	@RequestMapping(value="/modcontent" , method=RequestMethod.POST)
	@ResponseBody
	public String modcontent(RegistBoardVo registBoardVo) {
		registboardservice.modcontent(registBoardVo);
		if(registBoardVo == null) {
			return "fail";
		}
		return "success";
	}
}
