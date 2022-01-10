package com.kh.alone.vo;

public class ClassInfoVo {
	private int info_code; // 시퀀스랑 연결
	private String c_title; //수업 이름
	private int c_time; //수업 기간
	private String start_date; //수업 기간
	private String end_date; //수업 시간
	private int price;    //강의실 호수
	private int class_room;   //총원
	private int class_total;  //수강료
	private int cate_code;  // (프로그램, 디자인) 각각 수업종류
	private int time_code;  // (주간반 야간반 주말반)수업 타임 분류
	
	public ClassInfoVo() {
		super();
	}

	public int getInfo_code() {
		return info_code;
	}

	public void setInfo_code(int info_code) {
		this.info_code = info_code;
	}

	public String getC_title() {
		return c_title;
	}

	public void setC_title(String c_title) {
		this.c_title = c_title;
	}

	public int getC_time() {
		return c_time;
	}

	public void setC_time(int c_time) {
		this.c_time = c_time;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getClass_room() {
		return class_room;
	}

	public void setClass_room(int class_room) {
		this.class_room = class_room;
	}

	public int getClass_total() {
		return class_total;
	}

	public void setClass_total(int class_total) {
		this.class_total = class_total;
	}

	public int getCate_code() {
		return cate_code;
	}

	public void setCate_code(int cate_code) {
		this.cate_code = cate_code;
	}

	public int getTime_code() {
		return time_code;
	}

	public void setTime_code(int time_code) {
		this.time_code = time_code;
	}

	@Override
	public String toString() {
		return "ClassInfoVo [info_code=" + info_code + ", c_title=" + c_title + ", c_time=" + c_time + ", start_date="
				+ start_date + ", end_date=" + end_date + ", price=" + price + ", class_room=" + class_room
				+ ", class_total=" + class_total + ", cate_code=" + cate_code + ", time_code=" + time_code + "]";
	}
	
}
