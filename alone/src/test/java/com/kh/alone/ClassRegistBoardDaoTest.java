package com.kh.alone;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.alone.dao.ClassRegistBoardDao;
import com.kh.alone.vo.RegistBoardVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class ClassRegistBoardDaoTest {
	
	@Inject
	private ClassRegistBoardDao classRegistBoardDao;

	@Test
	public void testSelectAll() {
		System.out.println("classRegistBoardDao:" + classRegistBoardDao);
		
		String time = classRegistBoardDao.getTime();
		System.out.println("list: " + time);
	}
	
	@Test
	public void testrRegistClassBoard() {
		RegistBoardVo vo = new RegistBoardVo();
		vo.setClass_board_enroll("1");
		vo.setClass_board_title("2");
		vo.setClass_board_content("3");
		vo.setClass_board_userid("user01");
		classRegistBoardDao.registClassBoard(vo);
	}
}
