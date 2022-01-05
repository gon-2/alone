package com.kh.alone.vo;

public class OnlineRegistVo {
	String r_num; 				//주민번호
	String c_day;				//훈련직종분류(주간, 야간, 주말)
	String c_cate;				//교육과정분류(디자인, 프로그램 이런거)
	String c_title;				//과정명
	String c_name;				//신청자 이름
	String gender;				//성별
	String foreigner;			//내/외국인
	String phone_num;			//휴대전화
	String home_num;			//일반전화
	String e_mail;				//이메일
	String regist_path;			//지원경로
	String employment;			//국민취업지원제도(1유형, 2유형, 미참여)
	String employment_center;	//참여센터
	String employment_counselor;//담당자
	String employment_num;		//연락처
	public OnlineRegistVo() {
		super();
	}
	public String getR_num() {
		return r_num;
	}
	public void setR_num(String r_num) {
		this.r_num = r_num;
	}
	public String getC_day() {
		return c_day;
	}
	public void setC_day(String c_day) {
		this.c_day = c_day;
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
	public String getEmployment_counselor() {
		return employment_counselor;
	}
	public void setEmployment_counselor(String employment_counselor) {
		this.employment_counselor = employment_counselor;
	}
	public String getEmployment_num() {
		return employment_num;
	}
	public void setEmployment_num(String employment_num) {
		this.employment_num = employment_num;
	}
	@Override
	public String toString() {
		return "OnlineRegist [r_num=" + r_num + ", c_day=" + c_day + ", c_cate=" + c_cate + ", c_title=" + c_title
				+ ", c_name=" + c_name + ", gender=" + gender + ", foreigner=" + foreigner + ", phone_num=" + phone_num
				+ ", home_num=" + home_num + ", e_mail=" + e_mail + ", regist_path=" + regist_path + ", employment="
				+ employment + ", employment_center=" + employment_center + ", employment_counselor="
				+ employment_counselor + ", employment_num=" + employment_num + "]";
	}
	
}
