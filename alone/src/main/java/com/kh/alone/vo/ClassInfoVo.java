package com.kh.alone.vo;

public class ClassInfoVo {
	String c_group;
	String c_cate;
	String c_title;
	String c_period;
	int classroom;
	int person;
	public ClassInfoVo() {
		super();
	}
	public String getC_group() {
		return c_group;
	}
	public void setC_group(String c_group) {
		this.c_group = c_group;
	}
	public String getC_cate() {
		return c_cate;
	}
	public void setC_cate(String c_cate) {
		this.c_cate = c_cate;
	}
	public String getC_title() {
		return c_title;
	}
	public void setC_title(String c_title) {
		this.c_title = c_title;
	}
	public String getC_period() {
		return c_period;
	}
	public void setC_period(String c_period) {
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
		return "ClassInfoVo [c_group=" + c_group + ", c_cate=" + c_cate + ", c_title=" + c_title + ", c_period="
				+ c_period + ", classroom=" + classroom + ", person=" + person + "]";
	}
}
