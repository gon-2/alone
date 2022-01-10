/*
 * 2021-01-07
 * Author : 이정훈
 * code Explanation : 스프링 버전 확인
 */


package com.kh.alone;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/*.xml")
public class SpringVersionTest {
	@Test
	public void TestVersion() {
		String getVersion = org.springframework.core.SpringVersion.getVersion();
		System.out.println(getVersion);
	}
}
