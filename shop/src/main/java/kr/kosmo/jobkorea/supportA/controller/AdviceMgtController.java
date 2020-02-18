package kr.kosmo.jobkorea.supportA.controller;

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

import kr.kosmo.jobkorea.supportA.model.AdviceMgtDtlModel;
import kr.kosmo.jobkorea.supportA.model.AdviceMgtDtlModel2;
import kr.kosmo.jobkorea.supportA.model.AdviceMgtModel;
import kr.kosmo.jobkorea.supportA.service.AdviceMgtService;

@Controller
@RequestMapping("/supportA/")
public class AdviceMgtController {
	
	@Autowired
	AdviceMgtService adviceMgtService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	
	
	/**
	 * 상당목록 관리 초기화면
	 */
	@RequestMapping("adviceMgt.do")
	public String initAdviceMgt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".initAdviceMgt");
		logger.info("   - paramMap : " + paramMap);
		
		logger.info("+ End " + className + ".initAdviceMgt");

		return "supportA/AdviceMgt";
	}
	
	
	/**
	 * 수강인원 목록 조회
	 */
	@RequestMapping("listAdviceMgt.do")
	public String listLectureMgt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listAdviceMgt");
		logger.info("   - paramMap : " + paramMap);
		
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
				
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 공통 그룹코드 목록 조회
		List<AdviceMgtModel> listAdviceMgtModel = adviceMgtService.listAdviceMgt(paramMap);
		model.addAttribute("listAdviceMgtModel", listAdviceMgtModel);
		
		// 공통 그룹코드 목록 카운트 조회
		int totalCount = adviceMgtService.countListAdviceMgt(paramMap);
		model.addAttribute("totalCntAdviceMgt", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageComnGrpCod",currentPage);
		
		logger.info("+ End " + className + ".listAdviceMgt");
		

		return "/supportA/AdviceMgtGrpList";
	}
	
	

	/**
	 *  상담목록 조회
	 */
	@RequestMapping("selectAdviceMgt.do")
	@ResponseBody
	public Map<String, Object> selectAdviceMgt (Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".selectAdviceMgt");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "조회 되었습니다.";
		
		// 공통 그룹 코드 단건 조회
		AdviceMgtModel adviceMgtModel = adviceMgtService.selectAdviceMgt(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("lectureMgt", adviceMgtModel);
		
		logger.info("+ End " + className + ".selectAdviceMgt");
		
		return resultMap;
	}
	
	
	/**
	 *  상담내용 저장
	 */
	@RequestMapping("saveAdviceMgt.do")
	@ResponseBody
	public Map<String, Object> saveAdviceMgt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".saveAdviceMgt");
		logger.info("   - paramMap : " + paramMap);
		
		String action = (String)paramMap.get("action");
		String result = "SUCCESS";
		String resultMsg = "저장 되었습니다.";
		
		// 사용자 정보 설정
		paramMap.put("fst_rgst_sst_id", session.getAttribute("usrSstId"));
		paramMap.put("fnl_mdfr_sst_id", session.getAttribute("usrSstId"));
		
		if ("I".equals(action)) {
			// 상담내용 신규 저장
			adviceMgtService.insertAdviceMgt(paramMap);
		} else if("U".equals(action)) {
			// 상담내용 수정 저장
			adviceMgtService.updateAdviceMgt(paramMap);
		} else {
			result = "FALSE";
			resultMsg = "알수 없는 요청 입니다.";
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".saveAdviceMgt");
		
		return resultMap;
	}
			
	
	/**
	 * 상담내용 조회
	 */
	@RequestMapping("listAdviceMgtDtl.do")
	public String listAdviceMgtDtl(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listAdviceMgtDtl");
		logger.info("   - paramMap : " + paramMap);
		
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
		

		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		//목록 조회
		List<AdviceMgtDtlModel> listAdviceMgtDtlModel = adviceMgtService.listAdviceMgtDtl(paramMap);
		model.addAttribute("listAdviceMgtDtlModel", listAdviceMgtDtlModel);
		
		//  카운트 조회
		int totalCount = adviceMgtService.countListAdviceMgtDtl(paramMap);
		model.addAttribute("totalCntAdviceMgtDtlCod", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageComnDtlCod",currentPage);
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"+model);
		logger.info("+ End " + className + ".listAdviceMgtDtl");

		return "/supportA/AdviceMgtDtlList";
	}	
	
	/**
	 * 목록 조회2
	 */
	@RequestMapping("listAdviceMgtDtl2.do")
	public String listAdviceMgtDtl2(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listAdviceMgtDtl2");
		logger.info("   - paramMap : " + paramMap);
		
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
		

		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		//  목록 조회
		List<AdviceMgtDtlModel2> listAdviceMgtDtlModel2 = adviceMgtService.listAdviceMgtDtl2(paramMap);
		model.addAttribute("listAdviceMgtDtlModel2", listAdviceMgtDtlModel2);
		
		//  목록 카운트 조회
		int totalCount = adviceMgtService.countListAdviceMgtDtl2(paramMap);
		model.addAttribute("totalCntAdviceMgtDtlCod2", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageComnDtlCod",currentPage);
		System.out.println("22222222222222222222222222222222"+model);
		logger.info("+ End " + className + ".listAdviceMgtDtl2");

		return "/supportA/AdviceMgtDtlList2";
	}

	/**
	 *  상담내용 단건 조회
	 */
	@RequestMapping("selectAdviceMgtDtl.do")
	@ResponseBody
	public Map<String, Object> selectAdviceMgtDtl (Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".selectAdviceMgtDtl");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "조회 되었습니다.";
		
		// 공통 상세 코드 단건 조회
		AdviceMgtDtlModel adviceMgtDtlModel = adviceMgtService.selectAdviceMgtDtl(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("adviceMgtDtlModel", adviceMgtDtlModel);
		System.out.println("**********************************"+paramMap);
		logger.info("+ End " + className + ".selectAdviceMgtDtl");
		System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"+resultMap);
		
		return resultMap;
	}
	
	/* 상담내용  등록 수정하기 */
	@RequestMapping("AdviceMgtSave.do")
	@ResponseBody
	public Map<String,Object> savaList1(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
	
		String action = (String)paramMap.get("action"); // 구분하는 키값 
		System.out.println("action 값 찍어보기 : " + action);

		String resultMsg = "";
	
		// insert 인지, update 수정인지 확인하기 
		if("I".equals(action)) {
			adviceMgtService.insertAdviceMgt(paramMap); // 저장 service
			resultMsg = "SUCCESS";
			
		}else if("U".equals(action)) {
			adviceMgtService.updateAdviceMgt(paramMap); // 수정 service
			resultMsg = "UPDATE";
			
		}else if("D".equals(action)) {
			adviceMgtService.deleteAdviceMgt(paramMap); // 수정 service
			resultMsg = "DELETE";
			
		}else {
			resultMsg ="FALSE / 등록에 실패했습니다.";
		}
		
		
		// 결과 값 전송
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("resultMsg", resultMsg);
		
		return resultMap;
	}

}
