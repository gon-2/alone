package com.kh.alone.vo;

public class OnlineRegistVo {
	private int r_num;
	private int c_time;
	private int c_cate;
	private int c_title;
	private String c_name;
	private String gender;
	private String foreigner;
	private String phone_num;
	private String home_num;
	private String e_mail;
	private String regist_path;
	private String employment;
	private String employment_center;
	private String employment_staff;
	private String employment_num;
	
	public OnlineRegistVo() {
		super();
	}
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public int getC_time() {
		return c_time;
	}
	public void setC_time(int c_time) {
		this.c_time = c_time;
	}
	public int getC_cate() {
		return c_cate;
	}
	public void setC_cate(int c_cate) {
		this.c_cate = c_cate;
	}
	public int getC_title() {
		return c_title;
	}
	public void setC_title(int c_title) {
		this.c_title = c_title;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getForeigner() {
		return foreigner;
	}
	public void setForeigner(String foreigner) {
		this.foreigner = foreigner;
	}
	public String getPhone_num() {
		return phone_num;
	}
	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}
	public String getHome_num() {
		return home_num;
	}
	public void setHome_num(String home_num) {
		this.home_num = home_num;
	}
	public String getE_mail() {
		return e_mail;
	}
	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}
	public String getRegist_path() {
		return regist_path;
	}
	public void setRegist_path(String regist_path) {
		this.regist_path = regist_path;
	}
	public String getEmployment() {
		return employment;
	}
	public void setEmployment(String employment) {
		this.employment = employment;
	}
	public String getEmployment_center() {
		return employment_center;
	}
	public void setEmployment_center(String employment_center) {
		this.employment_center = employment_center;
	}
	public String getEmployment_staff() {
		return employment_staff;
	}
	public void setEmployment_staff(String employment_staff) {
		this.employment_staff = employment_staff;
	}
	public String getEmployment_num() {
		return employment_num;
	}
	public void setEmployment_num(String employment_num) {
		this.employment_num = employment_num;
	}
	@Override
	public String toString() {
		return "OnlineRegistVo [r_num=" + r_num + ", c_time=" + c_time + ", c_cate=" + c_cate + ", c_title=" + c_title
				+ ", c_name=" + c_name + ", gender=" + gender + ", foreigner=" + foreigner + ", phone_num=" + phone_num
				+ ", home_num=" + home_num + ", e_mail=" + e_mail + ", regist_path=" + regist_path + ", employment="
				+ employment + ", employment_center=" + employment_center + ", employment_staff=" + employment_staff
				+ ", employment_num=" + employment_num + "]";
	}
}
