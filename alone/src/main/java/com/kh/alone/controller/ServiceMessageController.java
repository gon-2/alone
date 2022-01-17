/*
 * 2021-01-14
 * Author : 이정훈
 * code Explanation : 학생 상담 메시지 controller
 */

package com.kh.alone.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.alone.service.ServiceMessageService;
import com.kh.alone.vo.ServiceMessageVo;

@Controller
@RequestMapping("/message")
public class ServiceMessageController {
	
	@Inject
	private ServiceMessageService messageservice;
	
	// 메세지 보내기
	@ResponseBody
	@RequestMapping(value="/sendMessage" , method=RequestMethod.POST)
	public String sendMessage(ServiceMessageVo messagevo , String service_message_receiver) {
		messageservice.sendMessage(messagevo , service_message_receiver);
		System.out.println("ServiceMessageController , sendMessage , messagevo >>" + messagevo);
		if(messagevo == null) {
			return "fail";
		}
		return "success";
	}
	
	// 메세지 받기 
	@ResponseBody
	@RequestMapping(value="/recieveMessage" , method=RequestMethod.GET)
	public List<ServiceMessageVo> recieveMessage(String service_message_receiver) {
		List<ServiceMessageVo> recieverList = messageservice.recieveMessage(service_message_receiver);
		System.out.println("ServiceMessageController , recieveMessage , recieverList >> " + recieverList);
		if(recieverList == null) {
			return null;
		}
		
		return recieverList;
	}
	
	// 전체 메시지 리스트
	@RequestMapping(value="/messageList" , method=RequestMethod.GET)
	public String MessageList(Model model){
		List<ServiceMessageVo> recieverLists = messageservice.recieveMessages();
		System.out.println("ServiceMessageController , recieveMessage , recieverList >> " + recieverLists);
		model.addAttribute("recieverLists" , recieverLists);
		return "/consult/message_list_page";
	}
	
	// 하나의 메시지 확인
	@RequestMapping(value="/getMessage" , method=RequestMethod.GET)
	public String getMessage(Model model , String tbl_service_message) {
		ServiceMessageVo messageVo = messageservice.getMessage(tbl_service_message);
		System.out.println("ServiceMessageController , recieveMessage , messageVo >> " + messageVo);
		System.out.println("ServiceMessageController , recieveMessage , tbl_service_message >> " + tbl_service_message);
		model.addAttribute("messageVo" , messageVo);
		return "/consult/message_get_page";
	}
	
}
