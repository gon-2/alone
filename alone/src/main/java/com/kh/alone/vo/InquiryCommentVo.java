/*
 * 2021-01-12
 * Author : 이정훈
 * code Explanation : 고객센터 건의사항 댓글 VO
 */
package com.kh.alone.vo;

import java.sql.Timestamp;

public class InquiryCommentVo {
	private int inquiry_comment_no;
	private String inquiry_comment_userid;
	private String inquiry_comment_content;
	private Timestamp inquiry_comment_date;
	
	public InquiryCommentVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getInquiry_comment_no() {
		return inquiry_comment_no;
	}

	public void setInquiry_comment_no(int inquiry_comment_no) {
		this.inquiry_comment_no = inquiry_comment_no;
	}

	public String getInquiry_comment_userid() {
		return inquiry_comment_userid;
	}

	public void setInquiry_comment_userid(String inquiry_comment_userid) {
		this.inquiry_comment_userid = inquiry_comment_userid;
	}

	public String getInquiry_comment_content() {
		return inquiry_comment_content;
	}

	public void setInquiry_comment_content(String inquiry_comment_content) {
		this.inquiry_comment_content = inquiry_comment_content;
	}

	public Timestamp getInquiry_comment_date() {
		return inquiry_comment_date;
	}

	public void setInquiry_comment_date(Timestamp inquiry_comment_date) {
		this.inquiry_comment_date = inquiry_comment_date;
	}

	@Override
	public String toString() {
		return "InquiryCommentVo [inquiry_comment_no=" + inquiry_comment_no + ", inquiry_comment_userid="
				+ inquiry_comment_userid + ", inquiry_comment_content=" + inquiry_comment_content
				+ ", inquiry_comment_date=" + inquiry_comment_date + "]";
	}
}
