package com.kh.alone.vo;

public class LookJobVo {
	private int jobno;
	private String company;
	private String employForm;
	private String companyNum;
	private String companyForm;
	private String representative;
	private String personInCharge;
	private String contact;
	private String fax;
	private String mail;
	private String address;
	private String department;
	private String work;
	private String workTime;
	private String salary;
	private String recruitmentStart;
	private String recruitmentEnd;
	private String content;
	
	public LookJobVo() {
		super();
	}
	
	public LookJobVo(int jobno, String company, String employForm, String companyNum, String companyForm, String representative,
			String personInCharge, String contact, String fax, String mail, String address, String department,
			String work, String workTime, String salary, String recruitmentStart, String recruitmentEnd, String content) {
		super();
		this.jobno = jobno;
		this.company = company;
		this.employForm = employForm;
		this.companyNum = companyNum;
		this.companyForm = companyForm;
		this.representative = representative;
		this.personInCharge = personInCharge;
		this.contact = contact;
		this.fax = fax;
		this.mail = mail;
		this.address = address;
		this.department = department;
		this.work = work;
		this.workTime = workTime;
		this.salary = salary;
		this.recruitmentStart = recruitmentStart;
		this.recruitmentEnd = recruitmentEnd;
		this.content = content;
	}
	
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getEmployForm() {
		return employForm;
	}
	public void setEmployForm(String employForm) {
		this.employForm = employForm;
	}
	public String getCompanyNum() {
		return companyNum;
	}
	public void setCompanyNum(String companyNum) {
		this.companyNum = companyNum;
	}
	public String getCompanyForm() {
		return companyForm;
	}
	public void setCompanyForm(String companyForm) {
		this.companyForm = companyForm;
	}
	public String getRepresentative() {
		return representative;
	}
	public void setRepresentative(String representative) {
		this.representative = representative;
	}
	public String getPersonInCharge() {
		return personInCharge;
	}
	public void setPersonInCharge(String personInCharge) {
		this.personInCharge = personInCharge;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getWork() {
		return work;
	}
	public void setWork(String work) {
		this.work = work;
	}
	public String getWorkTime() {
		return workTime;
	}
	public void setWorkTime(String workTime) {
		this.workTime = workTime;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getRecruitmentStart() {
		return recruitmentStart;
	}
	public void setRecruitmentStart(String recruitmentStart) {
		this.recruitmentStart = recruitmentStart;
	}
	public String getRecruitmentEnd() {
		return recruitmentEnd;
	}
	public void setRecruitmentEnd(String recruitmentEnd) {
		this.recruitmentEnd = recruitmentEnd;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getJobno() {
		return jobno;
	}
	public void setJobno(int jobno) {
		this.jobno = jobno;
	}

	@Override
	public String toString() {
		return "LookJobVo [jobno=" + jobno + ", company=" + company + ", employForm=" + employForm + ", companyNum="
				+ companyNum + ", companyForm=" + companyForm + ", representative=" + representative
				+ ", personInCharge=" + personInCharge + ", contact=" + contact + ", fax=" + fax + ", mail=" + mail
				+ ", address=" + address + ", department=" + department + ", work=" + work + ", workTime=" + workTime
				+ ", salary=" + salary + ", recruitmentStart=" + recruitmentStart + ", recruitmentEnd=" + recruitmentEnd
				+ ", content=" + content + "]";
	}
}
