package com.kh.alone.vo;

public class LoginVo {

	private String userid;
	private String userpw;
	private String saveId;
	
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
	public String getSaveId() {
		return saveId;
	}
	public void setSaveId(String saveId) {
		this.saveId = saveId;
	}
	
	@Override
	public String toString() {
		return "LoginDto [userid=" + userid + ", userpw=" + userpw + ", saveId=" + saveId + "]";
	}
}
