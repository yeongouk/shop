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

import kr.kosmo.jobkorea.manageD.model.ExamResultDtlModel;
import kr.kosmo.jobkorea.manageD.model.ExamResultModel;
import kr.kosmo.jobkorea.manageD.service.ExamResultHDHService;

@Controller
@RequestMapping("/manageD/")
public class ExamResultHDHController {

	@Autowired
	ExamResultHDHService examResultService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	/**
	 * 시험결과 초기화면
	 */
	@RequestMapping("examResult.do")
	public String initExamResult(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".initExamResult");
		logger.info("   - paramMap : " + paramMap);
		
		logger.info("+ End " + className + ".initExamResult");
		
		return "manageD/examResult";
		
	}
	
	/**
	 * 시험결과 목록 조회
	 */
	@RequestMapping("listExamResult.do")
	public String listExamResult(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listExamResult");
		logger.info("   - paramMap : " + paramMap);
		
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));	// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;	// 페이지 시작 row 번호
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 시험결과 목록 조회
		List<ExamResultModel> listExamResultModel = examResultService.listExamResult(paramMap);
		model.addAttribute("listExamResultModel", listExamResultModel);
		
		// 시험결과 목록 카운트 조회
		int totalCount = examResultService.countListExamResult(paramMap);
		model.addAttribute("totalCntExamResult", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageExamResult", currentPage);
		
		logger.info("+ End " + className + ".listExamResult");
		
		return "/manageD/examResultList";
		
	}
	
	/**
	 * 시험결과 상세 목록 조회
	 */
	@RequestMapping("listExamResultDtl.do")
	public String listExamResultDtl(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listExamResultDtl");
		logger.info("   - paramMap : " + paramMap);
		
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));	// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;	// 페이지 시작 row 번호
		
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 시험결과 상세 목록 조회
		List<ExamResultDtlModel> listExamResultDtlModel = examResultService.listExamResultDtl(paramMap);
		model.addAttribute("listExamResultDtlModel", listExamResultDtlModel);
		
		// 시험결과 상세 목록 카운트 조회
		int totalCount = examResultService.countListExamResultDtl(paramMap);
		model.addAttribute("totalCntExamResultDtl", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageExamResultDtl", currentPage);
		
		logger.info("+ End " + className + ".listExamResultDtl");
		
		return "/manageD/examResultDtlList";
		
	}
	
}











