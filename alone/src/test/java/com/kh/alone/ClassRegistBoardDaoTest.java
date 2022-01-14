/*
 * 2021-01-06
 * Author : 이정훈
 * code Explanation : 고객센터 수강신청 댓글 테스트
 */

package com.kh.alone;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.alone.dao.ClassRegistBoardDao;
import com.kh.alone.dao.InquiryBoardDao;
import com.kh.alone.dao.RegistCommentDao;
import com.kh.alone.dao.ServiceMessageDao;
import com.kh.alone.vo.InquiryBoardVo;
import com.kh.alone.vo.RegistBoardVo;
import com.kh.alone.vo.RegistCommentVo;
import com.kh.alone.vo.ServiceMessageVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class ClassRegistBoardDaoTest {
	
	@Inject
	private RegistCommentDao registCommentDao;
	
	@Inject
	private InquiryBoardDao dao;
	
	@Inject
	private ServiceMessageDao messagedao;

	@Test
	public void insertcommentTest() {
		RegistCommentVo vo = new RegistCommentVo();
		vo.setClass_board_comment_userid("user02");
		vo.setClass_board_comment_content("하이2");
		registCommentDao.insertcomment(vo);
	}
	
/*	@Test
	public void insertinquire() {
		InquiryBoardVo vo = new InquiryBoardVo();
		vo.setInquiry_number(2);
		vo.setInquiry_title("제목1");
		vo.setInquiry_content("내용1");
		vo.setInquiry_userid("user01");
		vo.setInquiry_password("1234");
		vo.setInquiry_photoname("C:\\fakepath\\suneung.jpg");
		dao.insertinquire(vo);
	}
	*/
	@Test
	public void testcheckPassword() {
		String password = "1234";
		InquiryBoardVo vo = dao.checkPassword(password);
		System.out.println("vo >> " + vo);
	}
	
/*	@Test
	public void getcomment() {
		int class_board_number = 65;
		RegistCommentVo registcommentvo = registCommentDao.onecomment(class_board_number);
		System.out.println("registcommentvo >> " + registcommentvo);
	}
*/
	
	@Test
	public void getMessage() {
		String service_message_receiver = "user02";
		List<ServiceMessageVo> receiver = messagedao.recieveMessage(service_message_receiver);
		System.out.println("receiver >> " + receiver);
	}
}
