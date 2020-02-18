package kr.kosmo.jobkorea.manageA.controller;

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

import kr.kosmo.jobkorea.manageA.model.SurveyModel;
import kr.kosmo.jobkorea.manageA.service.SurveyService;
import kr.kosmo.jobkorea.supportA.model.NoticeMgtModel;
import kr.kosmo.jobkorea.system.model.ComnDtlCodModel;
import kr.kosmo.jobkorea.system.service.ComnCodService;

@Controller
@RequestMapping("/manageA/")
public class SurveyController {

	@Autowired
	SurveyService surveyService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	/**
	 * 관리자_설문조사 초기화면 
	 */
	@RequestMapping("surveyMgt.do")
	public String surveyMgt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		return "/manageA/surveyMgt";
	}
	
	/**
	 * 관리자_설문조사 목록조회
	 * @throws Exception 
	 */
	@RequestMapping("surveyMgtList.do")
	public String surveyMgtList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));
		int pageIndex = (currentPage - 1) * pageSize;

		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 공통 그룹코드 목록 조회
		List<SurveyModel> listSurveyModel = surveyService.listSurvey(paramMap); 
		model.addAttribute("listSurveyModel", listSurveyModel);
		
		// 공통 그룹코드 목록 카운트 조회
		int totalCount = surveyService.countListSurvey(paramMap); 
		model.addAttribute("totalCnt", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPage", currentPage);
		
		return "/manageA/surveyMgtList";
	}
	
	/* 관리자_설문조사 상세 정보 팝업 */
	@RequestMapping("detailSurveyList.do")
	@ResponseBody
	public Map<String, Object> detailList(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		  logger.info("+ Start " + className + ".detailList");
		  logger.info("   - paramMap : " + paramMap);
		  
		String result="";
		
		// 선택된 게시판 1건 조회 
//		NoticeMgtModel detailSurvey = noticeMgtService.detailSurvey(paramMap);
		List<SurveyModel> detailSurvey = surveyService.detailSurvey(paramMap); 
		
		if(detailSurvey != null) {
			
			result = "SUCCESS";  // 성공시 찍습니다. 
			
		}else {
			result = "FAIL / 불러오기에 실패했습니다.";  // null이면 실패입니다.
		}
		  
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("detailSurvey", detailSurvey); // 리턴 값 해쉬에 담기 
		resultMap.put("resultMsg", result); // success 용어 담기 
		
		logger.info("+ End " + className + ".detailList");
		
		return resultMap;
	}
	
	
	/**
	 * 공통 상세 코드 목록 조회
	 */
	@RequestMapping("surveyMgtDtl.do")
	public String surveyMgtDtl(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;									// 페이지 시작 row 번호
				
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		     
		//설문조사 상세 조회
		List<SurveyModel> surveyMgtDtlModel = surveyService.surveyMgtDtl(paramMap);  
		model.addAttribute("surveyMgtDtlModel", surveyMgtDtlModel);
		
		//설문조사 상세 카운트 조회
		int totalCount = surveyService.surveyMgtDtlCnt(paramMap);
		model.addAttribute("totalCntDtl", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageDtl",currentPage);
		
		return "/manageA/surveyMgtDtl";
	}	
}
