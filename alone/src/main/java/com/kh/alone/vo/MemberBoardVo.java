package com.kh.alone.vo;

import java.sql.Timestamp;
import java.util.Arrays;

public class MemberBoardVo {
	private int bno;
	private String title;
	private String content;
	private String userid;
	private Timestamp regdate;
	private int re_group;
	private int re_seq;
	private int re_level;
	
	public MemberBoardVo() {
		super();
	}

	public MemberBoardVo(int bno, String title, String content, String userid, Timestamp regdate, int re_group,
			int re_seq, int re_level) {
		super();
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.userid = userid;
		this.regdate = regdate;
		this.re_group = re_group;
		this.re_seq = re_seq;
		this.re_level = re_level;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getRe_group() {
		return re_group;
	}

	public void setRe_group(int re_group) {
		this.re_group = re_group;
	}

	public int getRe_seq() {
		return re_seq;
	}

	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}

	public int getRe_level() {
		return re_level;
	}

	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}

	@Override
	public String toString() {
		return "MemberBoardVo [bno=" + bno + ", title=" + title + ", content=" + content + ", userid=" + userid
				+ ", regdate=" + regdate + ", re_group=" + re_group + ", re_seq=" + re_seq + ", re_level=" + re_level
				+ "]";
	}
	

	

}
