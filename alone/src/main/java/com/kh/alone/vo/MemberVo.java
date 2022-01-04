package com.kh.alone.vo;

import java.sql.Timestamp;
import java.util.Arrays;

public class MemberVo {
	private String userid;
	private String userpw;
	private String userpwd;
	private String username;
	private String birthdate;
	private String email;
	private String gender;
	private String pnumber;
	
	public MemberVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberVo(String userid, String userpw, String userpwd, String username, String birthdate, String email,
			String gender, String pnumber) {
		super();
		this.userid = userid;
		this.userpw = userpw;
		this.userpwd = userpwd;
		this.username = username;
		this.birthdate = birthdate;
		this.email = email;
		this.gender = gender;
		this.pnumber = pnumber;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPnumber() {
		return pnumber;
	}

	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
	}

	@Override
	public String toString() {
		return "BoardVo [userid=" + userid + ", userpw=" + userpw + ", userpwd=" + userpwd + ", username=" + username
				+ ", birthdate=" + birthdate + ", email=" + email + ", gender=" + gender + ", pnumber=" + pnumber + "]";
	}
	
	
}