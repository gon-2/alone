/*
 * 2021-01-06
 * Author : 이정훈
 * code Explanation : 고객센터 수강신청 댓글 컨트롤러
 */

package com.kh.alone.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.alone.service.RegistCommentService;
import com.kh.alone.vo.RegistCommentVo;

@Controller
@RequestMapping("/comment")
public class ClassRegistBoardCommentController {
	
	@Inject
	private RegistCommentService registcommentservice;
	
	@RequestMapping(value="/insertcomment" , method=RequestMethod.POST)
	public String insertcomment(RegistCommentVo commentvo) {
		System.out.println("ClassRegistBoardController , insertcomment , commentvo >> " + commentvo);
		registcommentservice.insertcomment(commentvo);
		return "success";
	}
	
	// 댓글 보이기
/*	@RequestMapping(value="/listComment" , method=RequestMethod.GET)
	public List<RegistCommentVo> getcomment(Model model ,  int class_board_comment_no) {
		System.out.println("ClassRegistBoardCommentController , getcomment , class_board_comment_no >> " + class_board_comment_no);
		List<RegistCommentVo> list = registcommentservice.getcomment(class_board_comment_no);
		model.addAttribute("list" , list);
		return list;
	}*/
	
}
