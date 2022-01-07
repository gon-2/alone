package com.kh.alone;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.alone.dao.ClassRegistBoardDao;
import com.kh.alone.dao.RegistCommentDao;
import com.kh.alone.vo.RegistBoardVo;
import com.kh.alone.vo.RegistCommentVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class ClassRegistBoardDaoTest {
	
	@Inject
	private RegistCommentDao registCommentDao;

	@Test
	public void insertcomment() {
		RegistCommentVo vo = new RegistCommentVo();
		vo.setClass_board_comment_userid("user02");
		vo.setClass_board_comment_content("하이2");
		registCommentDao.insertcomment(vo);
	}
}
