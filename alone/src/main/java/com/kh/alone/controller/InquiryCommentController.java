/*
 * 2021-01-12
 * Author : 이정훈
 * code Explanation : 고객센터 건의사항 댓글 컨트롤러
 */

package com.kh.alone.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.alone.service.InquiryCommentService;
import com.kh.alone.vo.InquiryCommentVo;

@Controller
@RestController
public class InquiryCommentController {
	
	@Inject
	private InquiryCommentService commentservice;
	
	// 댓글 작성하기
	@RequestMapping(value="/insertcomment" , method=RequestMethod.POST)
	public String insertcomment(InquiryCommentVo commentvo) {
		commentservice.insertcomment(commentvo);
		System.out.println("InquiryCommentController , insertcomment , commentvo >> " + commentvo);
		if(commentvo == null) {
			return "fail";
		}
		return "success";
	}
	
	// 댓글 보기
	@RequestMapping(value="/showcomment" , method=RequestMethod.GET)
	public List<InquiryCommentVo> showcomment(String inquiry_userid) {
		List<InquiryCommentVo> commentList = commentservice.showcomment(inquiry_userid);
		System.out.println("InquiryCommentController , showcomment , commentList >> " + commentList);
		return commentList;
	}
	
}
