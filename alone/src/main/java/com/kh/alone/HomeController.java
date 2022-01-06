package com.kh.alone;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.alone.service.ClassInfoService;
import com.kh.alone.vo.ClassInfoVo;

@Controller
public class HomeController {
	
	@Inject
	private ClassInfoService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		List<ClassInfoVo> list = service.selectAll();
		List<ClassInfoVo> weekly = service.selectWeekly();
		List<ClassInfoVo> weekend = service.selectWeekend();
		List<ClassInfoVo> night = service.selectNight();
		
		model.addAttribute("list", list);
		model.addAttribute("weekly", weekly);
		model.addAttribute("weekend", weekend);
		model.addAttribute("night", night);
		System.out.println("컨트롤러list: " + list);
		System.out.println("컨트롤러weekly: " + weekly);
		System.out.println("컨트롤러weekend: " + weekend);
		System.out.println("컨트롤러night: " + night);
		return "home";
	}
	
	@RequestMapping(value="/login_form", method=RequestMethod.GET)
	public String login_form(Model model) {
		
		return "/login_form";
	}
	
}
