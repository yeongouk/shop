package kr.kosmo.jobkorea.manageC.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kosmo.jobkorea.manageC.service.SurveyCService;

@Controller
@RequestMapping("/manageC")
public class SurveyCController {
	
	@Autowired
	SurveyCService service;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	
	@RequestMapping("/survey.do")
	public String survey(Model model, @RequestParam Map<String, Object> map, HttpServletRequest request,
		HttpServletResponse response, HttpSession session) throws Exception {
		
		model.addAttribute("studentId", session.getAttribute("loginId"));		
		model.addAttribute("name", session.getAttribute("userNm"));
		  
		return "/manageC/surveyC";
	}
	
	@RequestMapping("listLectureLJKGrp.do")
	public String listComnGrpCod(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		paramMap.put("loginID", session.getAttribute("loginId"));
		
		
		
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;									// 페이지 시작 row 번호
				
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 수강목록/진도 목록 조회
		List<Map<String, Object>> lectureGrpModel = service.listLectureGrp(paramMap);
		model.addAttribute("listLectureGrpModel", lectureGrpModel);
		
		// 수강목록/진도 목록 카운트 조회
		int totalCount = service.countListLectureGrp(paramMap);
		
		model.addAttribute("totalCntLectureGrp", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageLectureGrp",currentPage);
		
		
		
		return "/manageC/surveyCList";
	}
	
	/**
	 * 설문조사 단건 조회
	 */
	@RequestMapping("selectSurveyReg.do")
	@ResponseBody
	public Map<String, Object> selectSurveyReg (Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".selectSurveyReg");
		logger.info("   - paramMap : " + paramMap);
		
		
		paramMap.put("loginID", session.getAttribute("loginId").toString());
		
		// 설문조사 단건 조회
		Map<String, Object> selectSurveyRegModel = service.selectSurveyReg(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("selectSurveyRegModel", selectSurveyRegModel);
		
		logger.info("+ End " + className + ".selectSurveyReg");
		
		return resultMap;
	}
	
	
	/**
	 *  설문조사 저장
	 */
	@RequestMapping("saveSurveyReg.do")
	@ResponseBody
	public Map<String, Object> saveComnGrpCod(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".saveSurveyReg");
		logger.info("   - paramMap : " + paramMap);
		
		String action = (String)paramMap.get("action");
		String result = "SUCCESS";
		String resultMsg = "저장 되었습니다.";
		
		paramMap.put("loginID", session.getAttribute("loginId").toString());
		
		service.insertSurveyReg(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".saveSurveyReg");
		
		return resultMap;
	}
	
}



