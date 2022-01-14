/*
 * 2021-01-14
 * Author : 이정훈
 * code Explanation : 학생 상담 메시지 Vo
 */


package com.kh.alone.vo;

import java.sql.Timestamp;

public class ServiceMessageVo {
	private String service_message_sender;
	private String service_message_receiver;
	private String service_message_title;
	private String service_message_content;
	private int service_message_count;
	private Timestamp service_message_date;
	
	public ServiceMessageVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getService_message_sender() {
		return service_message_sender;
	}

	public void setService_message_sender(String service_message_sender) {
		this.service_message_sender = service_message_sender;
	}

	public String getService_message_receiver() {
		return service_message_receiver;
	}

	public void setService_message_receiver(String service_message_receiver) {
		this.service_message_receiver = service_message_receiver;
	}

	public String getService_message_title() {
		return service_message_title;
	}

	public void setService_message_title(String service_message_title) {
		this.service_message_title = service_message_title;
	}

	public String getService_message_content() {
		return service_message_content;
	}

	public void setService_message_content(String service_message_content) {
		this.service_message_content = service_message_content;
	}

	public Timestamp getService_message_date() {
		return service_message_date;
	}

	public void setService_message_date(Timestamp service_message_date) {
		this.service_message_date = service_message_date;
	}

	public int getService_message_count() {
		return service_message_count;
	}

	public void setService_message_count(int service_message_count) {
		this.service_message_count = service_message_count;
	}
	
	@Override
	public String toString() {
		return "ServiceMessageVo [service_message_sender=" + service_message_sender + ", service_message_receiver="
				+ service_message_receiver + ", service_message_title=" + service_message_title
				+ ", service_message_content=" + service_message_content + ", service_message_count="
				+ service_message_count + ", service_message_date=" + service_message_date + "]";
	}


	
	

}
