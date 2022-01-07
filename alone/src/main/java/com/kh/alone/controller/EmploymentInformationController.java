package com.kh.alone.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	    System.out.println("BoardController, boardListAll, pagingDto:" + pagingVo);
		List<ReferenceVo> list = lookJobService.referenceRoomList(pagingVo);
		model.addAttribute("list", list);
		return "employ/referenceRoomList";
	}
	
	@RequestMapping(value="/referenceRoom", method=RequestMethod.GET)
	public String referenceRoom(Model model, int rno) {
		ReferenceVo referenceVo = lookJobService.getReference(rno);
		List<ReferenceVo> data = lookJobService.referenceImage(rno);
//		List<ReferenceVo> list = lookJobService.referenceRoomList(pagingVo);
		model.addAttribute("data", data);
		model.addAttribute("referenceVo", referenceVo);
//		model.addAttribute("list", list);
		return "employ/referenceRoom";
	}
}
