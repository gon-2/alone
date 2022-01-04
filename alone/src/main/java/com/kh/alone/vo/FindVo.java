package com.kh.alone.vo;

public class FindVo {
	
	private int fno;
	private String company;
	private String fname;
	private String fday;
	private String course_name;
	private String images;
	
	public FindVo() {
		super();
	}

	public FindVo(int fno, String company, String fname, String fday, String course_name, String images) {
		super();
		this.fno = fno;
		this.company = company;
		this.fname = fname;
		this.fday = fday;
		this.course_name = course_name;
		this.images = images;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getFday() {
		return fday;
	}

	public void setFday(String fday) {
		this.fday = fday;
	}

	public String getCourse_name() {
		return course_name;
	}

	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	@Override
	public String toString() {
		return "FindVo [fno=" + fno + ", company=" + company + ", fname=" + fname + ", fday=" + fday + ", course_name="
				+ course_name + ", images=" + images + "]";
	}
}
