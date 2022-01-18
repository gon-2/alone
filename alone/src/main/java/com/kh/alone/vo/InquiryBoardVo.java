/*
 * 2021-01-11
 * Author : 이정훈
 * code Explanation : 건의사항 게시판 VO
 * 건의사항 글 번호 , 아이디 , 글 제목 , 글 내용 , 파일 명 , 비밀번호 , 게시일자 , 조회수
 */


package com.kh.alone.vo;

import java.sql.Timestamp;
import java.util.Arrays;

import oracle.sql.BLOB;

public class InquiryBoardVo {
	private int inquiry_number;						// 글 번호
	private String inquiry_userid;					// 게시자
	private String inquiry_title;					// 글 제목
	private String inquiry_content;					// 글 내용
	private String inquiry_password;				// 삭제 비밀번호
	private Timestamp inquiry_date;					// 게시일자
	private int inquiry_viewcnt;					// 조회수
	
	public InquiryBoardVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getInquiry_number() {
		return inquiry_number;
	}

	public void setInquiry_number(int inquiry_number) {
		this.inquiry_number = inquiry_number;
	}

	public String getInquiry_userid() {
		return inquiry_userid;
	}

	public void setInquiry_userid(String inquiry_userid) {
		this.inquiry_userid = inquiry_userid;
	}

	public String getInquiry_title() {
		return inquiry_title;
	}

	public void setInquiry_title(String inquiry_title) {
		this.inquiry_title = inquiry_title;
	}

	public String getInquiry_content() {
		return inquiry_content;
	}

	public void setInquiry_content(String inquiry_content) {
		this.inquiry_content = inquiry_content;
	}

	public String getInquiry_password() {
		return inquiry_password;
	}

	public void setInquiry_password(String inquiry_password) {
		this.inquiry_password = inquiry_password;
	}
	
	public Timestamp getInquiry_date() {
		return inquiry_date;
	}

	public void setInquiry_date(Timestamp inquiry_date) {
		this.inquiry_date = inquiry_date;
	}

	public int getInquiry_viewcnt() {
		return inquiry_viewcnt;
	}

	public void setInquiry_viewcnt(int inquiry_viewcnt) {
		this.inquiry_viewcnt = inquiry_viewcnt;
	}

	@Override
	public String toString() {
		return "InquiryBoardVo [inquiry_number=" + inquiry_number + ", inquiry_userid=" + inquiry_userid
				+ ", inquiry_title=" + inquiry_title + ", inquiry_content=" + inquiry_content + ", inquiry_password="
				+ inquiry_password + ", inquiry_date=" + inquiry_date + ", inquiry_viewcnt=" + inquiry_viewcnt + "]";
	}
	
	
}
