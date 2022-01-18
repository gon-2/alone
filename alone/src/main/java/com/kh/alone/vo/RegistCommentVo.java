/*
 * 2021-01-06
 * Author : 이정훈
 * code Explanation : 수강신청 상담 게시판 댓글 VO
 * 상담 게시글 번호 , 제목 , 내용 , 게시자 , 게시일 , 조회수 , 댓글내용 순서
 */

package com.kh.alone.vo;

import java.sql.Timestamp;

public class RegistCommentVo {
	private int class_board_comment_no;						// 댓글 번호
	private String class_board_comment_content;				// 댓글 내용
	private String class_board_comment_userid;				// 댓글 아이디
	private Timestamp class_board_comment_date;				// 댓글 날짜
	private int class_board_comment_cnt;					// 댓글 개수
	
	public RegistCommentVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public int getClass_board_comment_no() {
		return class_board_comment_no;
	}



	public void setClass_board_comment_no(int class_board_comment_no) {
		this.class_board_comment_no = class_board_comment_no;
	}



	public String getClass_board_comment_content() {
		return class_board_comment_content;
	}

	public void setClass_board_comment_content(String class_board_comment_content) {
		this.class_board_comment_content = class_board_comment_content;
	}

	public String getClass_board_comment_userid() {
		return class_board_comment_userid;
	}

	public void setClass_board_comment_userid(String class_board_comment_userid) {
		this.class_board_comment_userid = class_board_comment_userid;
	}

	public Timestamp getClass_board_comment_date() {
		return class_board_comment_date;
	}

	public void setClass_board_comment_date(Timestamp class_board_comment_date) {
		this.class_board_comment_date = class_board_comment_date;
	}

	public int getClass_board_comment_cnt() {
		return class_board_comment_cnt;
	}

	public void setClass_board_comment_cnt(int class_board_comment_cnt) {
		this.class_board_comment_cnt = class_board_comment_cnt;
	}



	@Override
	public String toString() {
		return "RegistCommentVo [class_board_comment_no=" + class_board_comment_no + ", class_board_comment_content="
				+ class_board_comment_content + ", class_board_comment_userid=" + class_board_comment_userid
				+ ", class_board_comment_date=" + class_board_comment_date + ", class_board_comment_cnt="
				+ class_board_comment_cnt + "]";
	}

	
}
