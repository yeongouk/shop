package kr.kosmo.jobkorea.manageD.controller;

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

import kr.kosmo.jobkorea.manageD.model.SurveyResultDtlModel;
import kr.kosmo.jobkorea.manageD.model.SurveyResultModel;
import kr.kosmo.jobkorea.manageD.service.SurveyResultHDHService;

@Controller
@RequestMapping("/manageD/")
public class SurveyResultHDHController {

	@Autowired
	SurveyResultHDHService surveyResultService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@RequestMapping("surveyResult.do")
	public String initSurveyResult(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".initSurveyResult");
		logger.info("   - paramMap : " + paramMap);
		
		logger.info("+ End " + className + ".initSurveyResult");
		
		return "manageD/surveyResult";
		
	}
	
	/**
	 * 설문결과 목록 조회
	 */
	@RequestMapping("listSurveyResult.do")
	public String listSurveyRequest(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listSurveyResult");
		logger.info("   - paramMap : " + paramMap);
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;									// 페이지 시작 row 번호
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 설문결과 목록 조회
		List<SurveyResultModel> listSurveyResult = surveyResultService.listSurveyResult(paramMap);
		model.addAttribute("listSurveyResult", listSurveyResult);
		
		// 설문 결과 목록 카운트 조회
		int totalCount = surveyResultService.countListSurveyResult(paramMap);
		model.addAttribute("totalCntSurveyResult", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageSurveyResult", currentPage);
		
		logger.info("+ End " + className + ".listSurveyResult");
		
		return "/manageD/surveyResultList";
		
	}
	
	/**
	 * 설문결과 상세 목록 조회
	 */
	@RequestMapping("listSurveyResultDtl.do")
	public String listSurveyResultDtl(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listSurveyResultDtl");
		logger.info("   - paramMap : " + paramMap);
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;		// 페이지 시작 row 번호
		
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 설문결과 상세 목록 조회
		List<SurveyResultDtlModel> listSurveyResultDtlModel = surveyResultService.listSurveyResultDtl(paramMap);
		model.addAttribute("listSurveyResultDtlModel", listSurveyResultDtlModel);
		
		// 설문결과 상세 목록 카운트 조회
		int totalCount = surveyResultService.countListSurveyResultDtl(paramMap);
		model.addAttribute("totalCntSurveyResultDtl", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageSurveyResultDtl", currentPage);
		
		logger.info("+ End " + className + ".listSurveyResultDtl");
		
		return "/manageD/surveyResultDtlList";
		
	}
	
	
}

















