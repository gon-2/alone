package com.kh.alone.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.alone.service.ClassInfoService;
import com.kh.alone.vo.ClassInfoVo;

@Controller
@RequestMapping("/classInfo")
public class ClassInfoController {
	
	@Inject
	private ClassInfoService service;
	
	@RequestMapping(value="/list_all", method=RequestMethod.GET)
	public String selectAll(Model model) {
		List<ClassInfoVo> list = service.selectAll();
		model.addAttribute("list", list);
		return "classInfo/list_all";
	}
}
