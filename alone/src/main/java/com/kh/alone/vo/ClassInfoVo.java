package com.kh.alone.vo;

public class ClassInfoVo {
	int classgroup; // 평일반, 주말반, 야간반
	String title;   // 수업제목
	String period;  // 교육기간
	int pay;    	// 수강료
	int classroom;  // 교육장소
	int person;		// 총원
	public ClassInfoVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getClassgroup() {
		return classgroup;
	}
	public void setClassgroup(int classgroup) {
		this.classgroup = classgroup;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
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
		return "ClassInfoVo [classgroup=" + classgroup + ", title=" + title + ", period=" + period + ", pay=" + pay
				+ ", classroom=" + classroom + ", person=" + person + "]";
	}
	
}
