package com.kh.alone.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/upload")
public class UploadController {
	
	private static final String UPLOAD_PATH = "J:/upload";

	@RequestMapping(value ="/upload", method=RequestMethod.POST)
	@ResponseBody
	public String upload(@RequestParam("file") MultipartFile file, ModelAndView mv, Model model) throws IllegalStateException, IOException {
		System.out.println(file);
		if(!file.getOriginalFilename().isEmpty()) {
			file.transferTo(new File(UPLOAD_PATH, file.getOriginalFilename()));
			model.addAttribute("msg", "File uploaded successfully.");
		}else {
			model.addAttribute("msg", "Please select a valid mediaFile..");
		}
		return "success";
	}
	
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	@ResponseBody
	public byte[] fileDown(String fileName, HttpServletResponse response) throws Exception{
		System.out.println("download.do, fileName: "+fileName);
		// 파일을 저장했던 위치에서 첨부파일을 읽어 byte[]형식으로 변환한다.
		byte[] fileByte = org.apache.commons.io.FileUtils.readFileToByteArray(new File(UPLOAD_PATH + "/" +fileName));
		System.out.println(fileByte);
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(
				fileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
      
		return fileByte;
	}
}
