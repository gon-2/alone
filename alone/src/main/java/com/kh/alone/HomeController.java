package com.kh.alone;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.alone.service.ClassInfoService;
import com.kh.alone.service.HomeService;
import com.kh.alone.vo.ClassInfoVo;
import com.kh.alone.vo.MemberVo;

@Controller
public class HomeController {
	
	private static final int WEEKLY = 1;
	private static final int WEEKEND = 2;
	private static final int NIGHT = 3;
	
	
	
	@Inject
	private ClassInfoService service;
	@Inject
	private HomeService homeService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	//메인화면에서 수업 목록 띄워주기
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		List<ClassInfoVo> list = service.selectAll();
		List<ClassInfoVo> weekly = service.classListByTimeCode(WEEKLY);
		List<ClassInfoVo> weekend = service.classListByTimeCode(WEEKEND);
		List<ClassInfoVo> night = service.classListByTimeCode(NIGHT);
		
		
		model.addAttribute("list", list);
		model.addAttribute("weekly", weekly);
		model.addAttribute("weekend", weekend);
		model.addAttribute("night", night);
		return "home";
	}
	
	@RequestMapping(value="/login_form", method=RequestMethod.GET)
	public String login_form(Model model) {
		return "login_form";
	}
	
	@RequestMapping(value="/checkId/{userid}/{userpw}", method=RequestMethod.GET)
	@ResponseBody
	public String checkId(@PathVariable("userid") String userid, @PathVariable("userpw") String userpw) {
		MemberVo loginResult = homeService.checkId(userid);
		if (loginResult == null) {
			return "idFail";
		} else if (loginResult != null) {
			String userpwResult = loginResult.getUserpw();
			if (userpwResult.equals(userpw)) {
				return "success";
			} 
		}
		return "pwFail";
	}
	
	@RequestMapping(value="/login_run/{userid}/{userpw}/{saveId}", method=RequestMethod.GET)
	public String loginRun(RedirectAttributes rttr,	HttpSession session,
			@PathVariable("userid") String userid, @PathVariable("userpw") String userpw, @PathVariable("saveId") String saveId) {
		MemberVo memberVo = homeService.login(userid, userpw);
		
		System.out.println("login_run, memberVo:" + memberVo);
		
		session.setAttribute("memberVo", memberVo);
		String targetLocation = (String) session.getAttribute("targetLocation");
		
		System.out.println(targetLocation);
		
		session.removeAttribute("targetLocation");
		if(targetLocation == null) {
			return "redirect:/";
		} else {
			return "redirect:" + targetLocation;
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
}
