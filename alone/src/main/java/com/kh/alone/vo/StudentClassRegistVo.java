package com.kh.alone.vo;

public class StudentClassRegistVo {
	private	String r_num;
	private int info_code;
	private String student_name;
	private String gender;
	private String nationality;
	private String phone_num;
	private String home_num;
	private String e_mail;
	private String employment;
	private String employment_center;
	private String employment_staff;
	private String employment_num;
	
	public StudentClassRegistVo() {
		super();
	}

	public String getR_num() {
		return r_num;
	}

	public void setR_num(String r_num) {
		this.r_num = r_num;
	}

	public int getInfo_code() {
		return info_code;
	}

	public void setInfo_code(int info_code) {
		this.info_code = info_code;
	}

	public String getStudent_name() {
		return student_name;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
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
		return "StudentOnlineRegistVo [r_num=" + r_num + ", info_code=" + info_code + ", student_name=" + student_name
				+ ", gender=" + gender + ", nationality=" + nationality + ", phone_num=" + phone_num + ", home_num="
				+ home_num + ", e_mail=" + e_mail + ", employment=" + employment + ", employment_center="
				+ employment_center + ", employment_staff=" + employment_staff + ", employment_num=" + employment_num
				+ "]";
	}
	
}
