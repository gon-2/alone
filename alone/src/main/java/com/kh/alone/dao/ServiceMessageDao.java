/*
 * 2021-01-14
 * Author : 이정훈
 * code Explanation : 학생 상담 메시지 DAO
 */

package com.kh.alone.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.alone.vo.ServiceMessageVo;

@Repository
public class ServiceMessageDao {
	
	private static final String NAMESPACE = "com.kh.alone.mappers.servicemessage.";
	
	@Inject
	private SqlSession session;
	
	// 메세지 보내기
	public void sendMessage(ServiceMessageVo messagevo) {
		session.insert(NAMESPACE + "sendMessage" , messagevo);
	}
	// 읽은사람은 메세지의 개수 1씩 증가
	public void receiveCount(String service_message_receiver) {
		session.update(NAMESPACE + "receiveCount" , service_message_receiver);
	}
	// 메세지 받은 사람의 메세지 내용
	public List<ServiceMessageVo> recieveMessage(String service_message_receiver){
		List<ServiceMessageVo> recieverList = session.selectList(NAMESPACE + "recieveMessage" , service_message_receiver);
		return recieverList;
	}
	// 전체 메시지 내용
	public List<ServiceMessageVo> recieveMessages(){
		List<ServiceMessageVo> recieverList = session.selectList(NAMESPACE + "recieveMessages");
		return recieverList;
	}
	// 하나의 메세지 내용들
	public ServiceMessageVo getMessage(String tbl_service_message){
		ServiceMessageVo messageVo = session.selectOne(NAMESPACE + "getMessage" , tbl_service_message);
		return messageVo;
	}
	
	
}
