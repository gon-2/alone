package com.kh.alone.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
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
	
	
	// 댓글 입력하기
	@ResponseBody
	@RequestMapping(value="/insertcomment" , method=RequestMethod.POST)
	public String insertcomment(RegistCommentVo commentvo) {
		System.out.println("ClassRegistBoardController , insertcomment , commentvo >> " + commentvo);
		registcommentservice.insertcomment(commentvo);
		return "success";
	}
}
