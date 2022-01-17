package com.kh.alone.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.alone.vo.MemberVo;

public class DefaultInterceptor extends HandlerInterceptorAdapter{
	
	// preHandle : 컨트롤러 보다 먼저 수행되는 메소드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		
		MemberVo membervo = (MemberVo)session.getAttribute("memberVo");
		
		if(membervo == null) {
			String uri = request.getRequestURI();		// 요청을 받은 uri ( "/comment/insertcomment" ) 
			System.out.println("DefaultInterceptor >> preHandle >> uri: " + uri);
			String qs = request.getQueryString();		// /login_run?userid=user01&userpw=1234&saveid=user01
			System.out.println("DefaultInterceptor >> preHandle >> QueryString: " + qs);
			String targetURL = uri + "?" + qs;
			System.out.println("DefaultInterceptor >> preHandle >> targetURL: " + targetURL);
			session.setAttribute("targetURL" , targetURL);
			response.sendRedirect("/login_form");
			// return false는 컨트롤러의 요청경로로 가지 않는다는 것을 의미함.
			return false;
		}
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

}
