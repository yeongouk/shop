package kr.kosmo.jobkorea.manageD.controller;


import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kosmo.jobkorea.manageD.model.HomeworkModel;
import kr.kosmo.jobkorea.manageD.service.WorkService;

@Controller
@RequestMapping("/manageD")
public class HomeworkMgtController {
	
	@Autowired
	WorkService workService;
	
	@Value("${fileUpload.rootPath}")
	private String rootPath;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	
	
	/**
	 *  과제관리 초기화면
	 */
	@RequestMapping("homeworkMgt.do")
	public String initHomework(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".initHomework");
		logger.info("   - paramMap : " + paramMap);
		
		logger.info("+ End " + className + ".initHomework");

		return "manageD/homework";
	}
	
	
	/**
	 * 과제관리 목록 조회
	 */
	@RequestMapping("listHomework.do")
	public String listHomework(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listHomework");
		logger.info("   - paramMap : " + paramMap);
		
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
				
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 과제 목록 조회
		logger.info("퀙!!!!!!!1"+paramMap);
		List<HomeworkModel> listHomeworkModel = workService.listHomework(paramMap);
		model.addAttribute("listHomeworkModel", listHomeworkModel);
		
		// 공통 그룹코드 목록 카운트 조회
		      
		              
		int totalCount = workService.countListHomework(paramMap);
		model.addAttribute("totalCntHomework", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageComnGrpCod",currentPage);
		logger.info("+ End " + className + ".listHomework");
		
		return "/manageD/homeworkList";
	}	
	
	/***단건 조회*/
	@RequestMapping("/selectHomework.do")
	@ResponseBody
	public Map<String, Object> selectHomework(Model model, @RequestParam Map<String, Object> map, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		model.addAttribute("loginID", session.getAttribute("loginID"));
		
		logger.info("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+map.get("seq"));
		HomeworkModel Model = workService.selectHomeworkDtl(map);
		
		String result = "SUCCESS";
		String resultMsg="조회실패";
				
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("Model", Model);

		return resultMap;
		
	}
	
	 
	@RequestMapping("/documentDown.do")
	public void documentDown(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
		HttpServletResponse response, HttpSession session) throws Exception {
	
		logger.info("+ Start " + className + ".documentDown");
		HomeworkModel documentDown = workService.documentDown(paramMap);
		
		byte fileByte[] = FileUtils.readFileToByteArray(new File(rootPath+File.separator+documentDown.getFilepath()));
		
		response.setContentType("application/octet-stream");
	    response.setContentLength(fileByte.length);
	    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(documentDown.getFilename(),"UTF-8")+"\";");
	    response.setHeader("Content-Transfer-Encoding", "binary");
	    response.getOutputStream().write(fileByte);
	     
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
	    
	    logger.info("+ End " + className + ".documentDown");
		
	}
	

}
