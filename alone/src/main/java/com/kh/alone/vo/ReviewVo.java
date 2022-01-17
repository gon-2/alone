package com.kh.alone.vo;

import java.sql.Date;

public class ReviewVo {
	private int review_number;
	private String review_title;
	private String content;
	private int cate_code;
	private String review_writer;
	private Date write_date;
	private int viewcnt;
	private String cate_code_name;
	
	public ReviewVo() {
		super();
	}
	public int getReview_number() {
		return review_number;
	}
	public void setReview_number(int review_number) {
		this.review_number = review_number;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCate_code() {
		return cate_code;
	}
	public void setCate_code(int cate_code) {
		this.cate_code = cate_code;
	}
	public String getReview_writer() {
		return review_writer;
	}
	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public String getCate_code_name() {
		return cate_code_name;
	}
	public void setCate_code_name(String cate_code_name) {
		this.cate_code_name = cate_code_name;
	}
	@Override
	public String toString() {
		return "ReviewVo [review_number=" + review_number + ", review_title=" + review_title + ", content=" + content
				+ ", cate_code=" + cate_code + ", review_writer=" + review_writer + ", write_date=" + write_date
				+ ", viewcnt=" + viewcnt + ", cate_code_name=" + cate_code_name + "]";
	}
	
	
	
}
