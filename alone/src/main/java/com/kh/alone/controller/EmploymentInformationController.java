package com.kh.alone.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.alone.service.LookJobService;
import com.kh.alone.vo.FindVo;
import com.kh.alone.vo.JobTestVo;
import com.kh.alone.vo.LookJobVo;
import com.kh.alone.vo.PagingVo;
import com.kh.alone.vo.ReferenceVo;


@Controller
@RequestMapping("/employ")
public class EmploymentInformationController {
	
	@Inject
	private LookJobService lookJobService;
	
	@RequestMapping(value="/lookJob", method=RequestMethod.GET)
	public String employLookJob(Model model) {
		List<LookJobVo> employList = lookJobService.selectAll();
		model.addAttribute("employList", employList);
		return "employ/lookJob";
	}
	
	@RequestMapping(value="/lookJobInformation", method=RequestMethod.GET)
	public String LookJobInformation(Model model, int jobno) {
		System.out.println(jobno);
		LookJobVo lookJobVo = lookJobService.getLookJob(jobno);
		model.addAttribute("lookJobVo", lookJobVo);
		return "employ/lookJobInformation";
	}
	
	@RequestMapping(value="/lookJobInforMationRegist", method=RequestMethod.GET)
	public String lookJobInforMationRegist() {
		return "employ/lookJobInforMationRegist";
	}
	
	@RequestMapping(value="/lookJobTestList", method=RequestMethod.GET)
	public String lookJobTestList(Model model) {
		List<JobTestVo> list = lookJobService.lookJobTestList();
		model.addAttribute("list", list);
		return "employ/lookJobTestList";
	}
	
	@RequestMapping(value="/lookJobTest", method=RequestMethod.GET)
	public String lookJobTest(Model model, int tno) {
		JobTestVo JobTestvo = lookJobService.getTest(tno);
		List<JobTestVo> imageList = lookJobService.testImage(tno);
		model.addAttribute("imageList", imageList);
		model.addAttribute("JobTestvo", JobTestvo);
		return "employ/lookJobTest";
	}
	
	@RequestMapping(value="/findPositionList", method=RequestMethod.GET)
	public String findPositionList(Model model) {
		List<FindVo> list = lookJobService.findPositionList();
		model.addAttribute("list", list);
		return "employ/findPositionList";
	}
	
	@RequestMapping(value="/findPosition", method=RequestMethod.GET)
	public String findPosition(Model model, int fno) {
		FindVo findVo = lookJobService.getFind(fno);
		List<FindVo> imageList = lookJobService.findImage(fno);
		model.addAttribute("imageList", imageList);
		model.addAttribute("findVo", findVo);
		return "employ/findPosition";
	}
	
	@RequestMapping(value="/referenceRoomList", method=RequestMethod.GET)
	public String referenceRoomList(Model model, PagingVo pagingVo) {
		int count = lookJobService.r_getCount(pagingVo);
		pagingVo.setCount(count);
		pagingVo.setPageInfo();
	    System.out.println("BoardController, boardListAll, pagingVo:" + pagingVo);
		List<ReferenceVo> list = lookJobService.referenceRoomList(pagingVo);
		model.addAttribute("pagingVo", pagingVo);
		model.addAttribute("list", list);
		return "employ/referenceRoomList";
	}
	
	@RequestMapping(value="/referenceRoom", method=RequestMethod.GET)
	public String referenceRoom(Model model, int rno, PagingVo pagingVo) {
		int count = lookJobService.r_getCount(pagingVo);
		pagingVo.setCount(count);
		pagingVo.setPageInfo();
		ReferenceVo referenceVo = lookJobService.getReference(rno);
		ReferenceVo pageVo = lookJobService.pageMove(rno);
		List<ReferenceVo> data = lookJobService.referenceImage(rno);
		List<ReferenceVo> list = lookJobService.referenceRoomList(pagingVo);
		System.out.println(pageVo);
		System.out.println(data);
		model.addAttribute("data", data);
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("referenceVo", referenceVo);
		model.addAttribute("list", list);
		return "employ/referenceRoom";
	}
	
	@RequestMapping(value="/referenceRoomRegist", method=RequestMethod.GET)
	public String referenceRoomRegist() {
		return "employ/referenceRoomRegist";
	}
	
	@RequestMapping(value="/referenceRoomRegist_run", method=RequestMethod.POST)
	public String referenceRoomRegist_run(ReferenceVo referenceVo) {
		System.out.println(referenceVo);
		lookJobService.insertReferenceRoom(referenceVo);
		return "redirect:/employ/referenceRoomList";
	}
}
