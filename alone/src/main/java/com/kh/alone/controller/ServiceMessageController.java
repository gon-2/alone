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
public class ServiceMessageController {
	
	@Inject
	private ServiceMessageService messageservice;
	
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
	
	@ResponseBody
	@RequestMapping(value="/recieveMessage" , method=RequestMethod.GET)
	public List<ServiceMessageVo> recieveMessage(String service_message_receiver , Model model) {
		List<ServiceMessageVo> recieverList = messageservice.recieveMessage(service_message_receiver);
		System.out.println("ServiceMessageController , recieveMessage , recieverList >> " + recieverList);
		if(recieverList == null) {
			return null;
		}
		
		return recieverList;
	}
}
