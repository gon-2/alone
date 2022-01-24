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
import com.kh.alone.service.LookJobService;
import com.kh.alone.service.ReviewService;
import com.kh.alone.vo.ClassInfoVo;
import com.kh.alone.vo.FindVo;
import com.kh.alone.vo.MemberVo;
import com.kh.alone.vo.ReviewVo;

@Controller
public class HomeController {
	
	private static final int WEEKLY = 1;
	private static final int NIGHT = 2;
	private static final int WEEKEND = 3;
	
	
	
	@Inject
	private ClassInfoService classInfoService;
	@Inject
	private HomeService homeService;
	@Inject
	private ReviewService reviewService;
	@Inject
	private LookJobService lookJobService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	//메인화면에서 수업 목록 띄워주기
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		List<ClassInfoVo> list = classInfoService.selectAll();
		List<ClassInfoVo> weekly = classInfoService.classListByTimeCode(WEEKLY);
		List<ClassInfoVo> night = classInfoService.classListByTimeCode(NIGHT);
		List<ClassInfoVo> weekend = classInfoService.classListByTimeCode(WEEKEND);
		List<ReviewVo> mainList = reviewService.mainReview();
		List<FindVo> findList = lookJobService.mainLookJob();
		
		model.addAttribute("findList", findList);
		model.addAttribute("list", list);
		model.addAttribute("weekly", weekly);
		model.addAttribute("night", night);
		model.addAttribute("weekend", weekend);
		model.addAttribute("mainList", mainList);
		return "home";
	}
	
	// 회원가입 페이지 이동
	@RequestMapping(value="/regist_form", method=RequestMethod.GET)
	public String regist_form() {
		return "regist_form";
	}
	
	// 로그인 페이지 이동
	@RequestMapping(value="/login_form", method=RequestMethod.GET)
	public String login_form() {
		return "login_form";
	}
	
	// 로그인 체크
	@RequestMapping(value="/checkId", method=RequestMethod.POST)
	@ResponseBody
	public String checkId(MemberVo vo) {
		System.out.println(vo);
		String userid = vo.getUserid();
		String userpw = vo.getUserpw();
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
	
	// 로그인 처리
	@RequestMapping(value="/login_run", method=RequestMethod.POST)
	public String loginRun(RedirectAttributes rttr,	HttpSession session, MemberVo vo) {
		String userid = vo.getUserid();
		String userpw = vo.getUserpw();
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
	
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 아이디/비밀번호 찾기 파업창
	@RequestMapping(value = "/search_Id_Pw", method = RequestMethod.GET)
	public String search_Id_Pw() {
		return "search_Id_Pw";
	}
	
	// 아이디 찾기
	@RequestMapping(value = "/id_search", method = RequestMethod.POST)
	@ResponseBody
	public String id_search(MemberVo vo) {
		System.out.println(vo);
		MemberVo memberVo = homeService.id_search(vo);
		if (memberVo == null) {
			return "fail";
		}
		String userid = memberVo.getUserid();
		return userid;
	}
	
	// 비밀번호 찾기
	@RequestMapping(value = "/pw_search", method = RequestMethod.POST)
	@ResponseBody
	public String pw_search(MemberVo vo) {
		System.out.println(vo);
		MemberVo memberVo = homeService.pw_search(vo);
		if (memberVo == null) {
			return "fail";
		}
		String userpw = memberVo.getUserpw();
		return userpw;
	}
}
