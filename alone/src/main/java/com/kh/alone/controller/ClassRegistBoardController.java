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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.alone.service.ClassRegistBoardService;
import com.kh.alone.vo.PagingDto;
import com.kh.alone.vo.RegistBoardVo;


@Controller
@RequestMapping("/class_board")
public class ClassRegistBoardController {
	
	@Inject
	private ClassRegistBoardService registboardservice;
	
	// 글 올리기 폼 이동
	@RequestMapping(value="/form" , method=RequestMethod.GET)
	public String classboardForm() {
		return "/board_form/class_regist_board_page";
	}
	// 글 올리기 실행 후 수강신청 페이지로 이동해서 보여줌.
	@RequestMapping(value="/run" , method=RequestMethod.POST)
	public String classboardRun(RegistBoardVo registboardvo) {
		registboardservice.registClassBoard(registboardvo);
		return "redirect:/class_board/class_regist";
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
		return "/service_center/class_regist_page";
	}
	
	
}
