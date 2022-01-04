package com.kh.alone.vo;

public class ClassInfoVo {
	String c_cate; //수업 카테고리 어떤종류의 과목인지
	String c_name; //수업 이름
	String c_term; //수업 기간
	String c_time; //수업 시간
	int c_room;    //강의실 호수
	int c_total;   //총원
	String c_pay;  //수강료
	String c_day;  // 주간 주말 야간반 
	
	public ClassInfoVo() {
		super();
	}
	public String getC_cate() {
		return c_cate;
	}
	public void setC_cate(String c_cate) {
		this.c_cate = c_cate;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_term() {
		return c_term;
	}
	public void setC_term(String c_term) {
		this.c_term = c_term;
	}
	public String getC_time() {
		return c_time;
	}
	public void setC_time(String c_time) {
		this.c_time = c_time;
	}
	public int getC_room() {
		return c_room;
	}
	public void setC_room(int c_room) {
		this.c_room = c_room;
	}
	public int getC_total() {
		return c_total;
	}
	public void setC_total(int c_total) {
		this.c_total = c_total;
	}
	public String getC_pay() {
		return c_pay;
	}
	public void setC_pay(String c_pay) {
		this.c_pay = c_pay;
	}
	public String getC_day() {
		return c_day;
	}
	public void setC_day(String c_day) {
		this.c_day = c_day;
	}
	@Override
	public String toString() {
		return "ClassInfoVo [c_cate=" + c_cate + ", c_name=" + c_name + ", c_term=" + c_term + ", c_time=" + c_time
				+ ", c_room=" + c_room + ", c_total=" + c_total + ", c_pay=" + c_pay + ", c_day=" + c_day + "]";
	}
	
	
}
