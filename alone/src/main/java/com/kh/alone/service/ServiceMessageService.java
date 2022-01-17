/*
 * 2021-01-14
 * Author : 이정훈
 * code Explanation : 학생 상담 메시지 Service
 */

package com.kh.alone.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.alone.dao.ServiceMessageDao;
import com.kh.alone.vo.ServiceMessageVo;

@Service
public class ServiceMessageService {
	@Inject
	private ServiceMessageDao messagedao;
	
	// 메세지 보내기
	@Transactional
	public void sendMessage(ServiceMessageVo messagevo , String service_message_receiver) {
		messagedao.sendMessage(messagevo);
		messagedao.receiveCount(service_message_receiver);
	}
	
	// 받은 사람의 메시지
	public List<ServiceMessageVo> recieveMessage(String service_message_receiver){
		List<ServiceMessageVo> recieverList = messagedao.recieveMessage(service_message_receiver);
		System.out.println("ServiceMessageService , receiveCount , recieverList >> " + recieverList);
		return recieverList;
	}

	// 전체 메시지 내용
	public List<ServiceMessageVo> recieveMessages(){
		List<ServiceMessageVo> recieverList = messagedao.recieveMessages();
		return recieverList;
	}
	
	// 하나의 메세지 내용들
	public ServiceMessageVo getMessage(String tbl_service_message){
		ServiceMessageVo messageVo = messagedao.getMessage(tbl_service_message);
		return messageVo;
	}

}
