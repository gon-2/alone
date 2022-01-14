package com.kh.alone.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
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

import com.kh.alone.service.LookJobService;
import com.kh.alone.vo.LookJobVo;

@Controller
@RequestMapping("/upload")
public class UploadController {
	
	private static final String UPLOAD_PATH = "J:/upload";
	
	@Inject
	private LookJobService lookJobService;

	@RequestMapping(value ="/uploadAjax", method=RequestMethod.POST)
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
	
	@RequestMapping(value="uploadLookJob", method=RequestMethod.POST)
    public String requestupload2(MultipartHttpServletRequest mtfRequest, LookJobVo vo) {
		LookJobVo lookJobVo = lookJobService.getLookJobUpload(vo);
		int jobno = lookJobVo.getJobno();
		System.out.println(lookJobVo);
		System.out.println(mtfRequest);
        List<MultipartFile> fileList = mtfRequest.getFiles("file");
        System.out.println(fileList);
        String src = mtfRequest.getParameter("src");
        System.out.println("src value : " + src);

        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

            System.out.println("originFileName : " + originFileName);
            System.out.println("fileSize : " + fileSize);
            
            UUID uuid = UUID.randomUUID();
            String safeFile = uuid + "_" + originFileName;
            
            System.out.println(safeFile);
            lookJobService.insertJobImages(jobno, safeFile);
            try {
                mf.transferTo(new File(UPLOAD_PATH, safeFile));
            } catch (IllegalStateException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        return "redirect:/employ/lookJob";
    }


	
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	@ResponseBody
	public byte[] fileDown(String fileName, HttpServletResponse response) throws Exception{
		System.out.println("download.do, fileName: " + fileName);
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
