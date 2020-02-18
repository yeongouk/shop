package kr.kosmo.jobkorea.manageA.controller;

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

import kr.kosmo.jobkorea.manageA.model.ExsubjectMgtDtlModel;
import kr.kosmo.jobkorea.manageA.model.ExsubjectMgtModel;
import kr.kosmo.jobkorea.manageA.service.ExsubjectMgtService;

@Controller
@RequestMapping("/manageA/")
public class ExsubjectMgtController {
	
	@Autowired
	ExsubjectMgtService exsubjectMgtService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	
	
	/**
	 * 시험대상자 목록 초기화면
	 */
	@RequestMapping("exsubjectMgt.do")
	public String initComnCod(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".initComnCod");
		logger.info("   - paramMap : " + paramMap);
		
		logger.info("+ End " + className + ".initComnCod");

		return "manageA/ExsubjectMgt";
	}
	
	
	/**
	 * 시험대상자 목록 조회
	 */
	@RequestMapping("listExsubjectMgt.do")
	public String listExsubjectMgt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listExsubjectMgt");
		logger.info("   - paramMap : " + paramMap);
		
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
				
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 공통 그룹코드 목록 조회
		List<ExsubjectMgtModel> listExsubjectMgtModel = exsubjectMgtService.listExsubjectMgt(paramMap);
		model.addAttribute("listExsubjectMgtModel", listExsubjectMgtModel);
		
		// 공통 그룹코드 목록 카운트 조회
		int totalCount = exsubjectMgtService.countListExsubjectMgt(paramMap);
		model.addAttribute("totalCntExsubject", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageExsubject",currentPage);
		
		logger.info("+ End " + className + ".listExsubjectMgt");
		
		System.out.println("################################"+paramMap);
		return "/manageA/ExsubjectMgtGrpList";
	}	

	
	/**
	 * 시험대상자 상세 조회
	 */
	@RequestMapping("listExsubjectMgtDtl.do")
	public String listExsubjectMgtDtl(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listExsubjectMgtDtl");
		logger.info("   - paramMap : " + paramMap);
		
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
		

		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 공통 상세코드 목록 조회
		List<ExsubjectMgtDtlModel> listExsubjectMgtDtlModel = exsubjectMgtService.listExsubjectMgtDtl(paramMap);
		model.addAttribute("listExsubjectMgtDtlModel", listExsubjectMgtDtlModel);
		
		// 공통 상세코드 목록 카운트 조회
		int totalCount = exsubjectMgtService.countListExsubjectMgtDtl(paramMap);
		model.addAttribute("totalCntExsubjectDtl", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageExsubjectDtl",currentPage);
		
		logger.info("+ End " + className + ".listExsubjectMgtDtl");

		return "/manageA/ExsubjectMgtDtlList";
	}	

	

	
	
}
