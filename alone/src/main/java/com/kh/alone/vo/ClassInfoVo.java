package com.kh.alone.vo;

public class ClassInfoVo {
	String c_group;  // 주간반, 야간반, 주말반 
	String c_title;  // 수업제목
	int c_period; // 수업기간
	int classroom;   // 교실(몇호실인지)
	int person;      // 인원수
	public ClassInfoVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getC_group() {
		return c_group;
	}
	public void setC_group(String c_group) {
		this.c_group = c_group;
	}
	public String getC_title() {
		return c_title;
	}
	public void setC_title(String c_title) {
		this.c_title = c_title;
	}
	public int getC_period() {
		return c_period;
	}
	public void setC_period(int c_period) {
		this.c_period = c_period;
	}
	public int getClassroom() {
		return classroom;
	}
	public void setClassroom(int classroom) {
		this.classroom = classroom;
	}
	public int getPerson() {
		return person;
	}
	public void setPerson(int person) {
		this.person = person;
	}
	@Override
	public String toString() {
		return "ClassInfoVo [c_group=" + c_group + ", c_title=" + c_title + ", c_period=" + c_period + ", classroom="
				+ classroom + ", person=" + person + "]";
	}
	

}
