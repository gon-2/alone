/*
 * 2021-01-04
 * Author : 이정훈
 * code Explanation : 수강신청 상담 게시판 VO
 * 상담 게시글 번호 , 제목 , 내용 , 게시자 , 게시일 , 조회수 , 댓글내용 순서
 */

package com.kh.alone.vo;

import java.sql.Timestamp;

public class RegistBoardVo {
	private int class_board_number;
	private String class_board_enroll;
	private String class_board_title;
	private String class_board_content;
	private String class_board_userid;
	private Timestamp class_board_postdate;
	private int class_board_viewcnt;
	private String class_board_comment;
	
	public RegistBoardVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public int getClass_board_number() {
		return class_board_number;
	}

	public void setClass_board_number(int class_board_number) {
		this.class_board_number = class_board_number;
	}

	public String getClass_board_enroll() {
		return class_board_enroll;
	}

	public void setClass_board_enroll(String class_board_enroll) {
		this.class_board_enroll = class_board_enroll;
	}

	public String getClass_board_title() {
		return class_board_title;
	}

	public void setClass_board_title(String class_board_title) {
		this.class_board_title = class_board_title;
	}

	public String getClass_board_content() {
		return class_board_content;
	}

	public void setClass_board_content(String class_board_content) {
		this.class_board_content = class_board_content;
	}

	public String getClass_board_userid() {
		return class_board_userid;
	}

	public void setClass_board_userid(String class_board_userid) {
		this.class_board_userid = class_board_userid;
	}

	public Timestamp getClass_board_postdate() {
		return class_board_postdate;
	}

	public void setClass_board_postdate(Timestamp class_board_postdate) {
		this.class_board_postdate = class_board_postdate;
	}

	public int getClass_board_viewcnt() {
		return class_board_viewcnt;
	}

	public void setClass_board_viewcnt(int class_board_viewcnt) {
		this.class_board_viewcnt = class_board_viewcnt;
	}

	public String getClass_board_comment() {
		return class_board_comment;
	}

	public void setClass_board_comment(String class_board_comment) {
		this.class_board_comment = class_board_comment;
	}

	@Override
	public String toString() {
		return "ClassRegistBoardVo [class_board_number=" + class_board_number + ", class_board_enroll="
				+ class_board_enroll + ", class_board_title=" + class_board_title + ", class_board_content="
				+ class_board_content + ", class_board_userid=" + class_board_userid + ", class_board_postdate="
				+ class_board_postdate + ", class_board_viewcnt=" + class_board_viewcnt + ", class_board_comment="
				+ class_board_comment + "]";
	}
	
	
	
}
