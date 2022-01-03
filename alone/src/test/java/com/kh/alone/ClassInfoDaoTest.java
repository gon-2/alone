package com.kh.alone;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.alone.dao.ClassInfoDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class ClassInfoDaoTest {
	
	@Inject
	private ClassInfoDao classInfoDao;

	@Test
	public void testSelectAll() {
		System.out.println(classInfoDao);
		classInfoDao.selectAll();
	}
	
	@Test
	public void testGetTime() {
		System.out.println(classInfoDao);
		String time = classInfoDao.getTime();
		System.out.println(time);
	}
}
