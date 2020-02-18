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

import kr.kosmo.jobkorea.manageA.model.LectureMgtCodModel;
import kr.kosmo.jobkorea.manageA.model.LectureMgtDtlCodModel;
import kr.kosmo.jobkorea.manageA.service.LectureMgtService;

@Controller
@RequestMapping("/manageA/")
public class LectureMgtController {
	
	@Autowired
	LectureMgtService lectureMgtService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	
	
	/**
	 * 수강목록 관리 초기화면
	 */
	@RequestMapping("lectureMgt.do")
	public String initComnCod(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".initComnCod");
		logger.info("   - paramMap : " + paramMap);
		
		logger.info("+ End " + className + ".initComnCod");

		return "manageA/LectureMgt";
	}
	
	
	/**
	 * 수강목록 조회
	 */
	@RequestMapping("listLectureMgt.do")
	public String listLectureMgt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listLectureMgt");
		logger.info("   - paramMap : " + paramMap);
		
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
				
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 공통 그룹코드 목록 조회
		List<LectureMgtCodModel> listLectureMgtModel = lectureMgtService.listLectureMgt(paramMap);
		model.addAttribute("listLectureMgtModel", listLectureMgtModel);
		
		// 공통 그룹코드 목록 카운트 조회
		int totalCount = lectureMgtService.countListLectureMgt(paramMap);
		model.addAttribute("totalCntComnGrpCod", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageComnGrpCod",currentPage);
		
		logger.info("+ End " + className + ".listLectureMgt");
		
		System.out.println("################################"+paramMap);
		return "/manageA/LectureMgtGrpList";
	}	

	/**
	 *  공통 그룹 코드 단건 조회
	 */
	@RequestMapping("selectLectureMgt.do")
	@ResponseBody
	public Map<String, Object> selectLectureMgt (Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".selectLectureMgt");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "조회 되었습니다.";
		
		// 공통 그룹 코드 단건 조회
		LectureMgtCodModel lectureMgtModel = lectureMgtService.selectLectureMgt(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("lectureMgt", lectureMgtModel);
		
		logger.info("+ End " + className + ".selectLectureMgt");
		
		return resultMap;
	}
	
	
	/**
	 *  공통 그룹 코드 저장
	 */
	@RequestMapping("saveLectureMgt.do")
	@ResponseBody
	public Map<String, Object> saveComnGrpCod(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".saveLectureMgt");
		logger.info("   - paramMap : " + paramMap);
		
		String action = (String)paramMap.get("action");
		String result = "SUCCESS";
		String resultMsg = "저장 되었습니다.";
		
		// 사용자 정보 설정
		//paramMap.put("fst_rgst_sst_id", session.getAttribute("usrSstId"));
		//paramMap.put("fnl_mdfr_sst_id", session.getAttribute("usrSstId"));
		
		if ("I".equals(action)) {
			// 그룹코드 신규 저장
			lectureMgtService.insertLectureMgt(paramMap);
		} else if("U".equals(action)) {
			// 그룹코드 수정 저장
			lectureMgtService.updateLectureMgt(paramMap);
		} else {
			result = "FALSE";
			resultMsg = "알수 없는 요청 입니다.";
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".saveComnGrpCod");
		
		return resultMap;
	}
	
		
	/**
	 *  그룹코드 삭제
	 */
	@RequestMapping("deleteLectureMgt.do")
	@ResponseBody
	public Map<String, Object> deleteLectureMgt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".deleteLectureMgt");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "삭제 되었습니다.";
		
		// 그룹코드 삭제
		lectureMgtService.deleteLectureMgt(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".deleteLectureMgt");
		
		return resultMap;
	}
	
	
	/**
	 * 공통 상세 코드 목록 조회
	 */
	@RequestMapping("listLectureMgtDtl.do")
	public String listLectureMgtDtl(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listLectureMgtDtl");
		logger.info("   - paramMap : " + paramMap);
		
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
		

		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 공통 상세코드 목록 조회
		List<LectureMgtDtlCodModel> listLectureMgtDtlModel = lectureMgtService.listLectureMgtDtl(paramMap);
		model.addAttribute("listLectureMgtDtlModel", listLectureMgtDtlModel);
		
		// 공통 상세코드 목록 카운트 조회
		int totalCount = lectureMgtService.countListLectureMgtDtl(paramMap);
		model.addAttribute("totalCntComnDtlCod", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageComnDtlCod",currentPage);
		
		logger.info("+ End " + className + ".listComnDtlCod");

		return "/manageA/LectureMgtDtlList";
	}	

	/**
	 *  수강인원목록 조회
	 */
	@RequestMapping("selectLectureMgtDtl.do")
	@ResponseBody
	public Map<String, Object> selectComnDtlCod (Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".selectLectureMgtDtl");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "조회 되었습니다.";
		
		// 공통 상세 코드 단건 조회
		LectureMgtDtlCodModel lectureMgtDtlCodModel = lectureMgtService.selectLectureMgtDtl(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("comnDtlCodModel", lectureMgtDtlCodModel);
		
		logger.info("+ End " + className + ".selectLectureMgtDtl");
		
		return resultMap;
	}

	
	/* 휴강등록 */
	@RequestMapping("AdviceMgtSave.do")
	@ResponseBody
	public Map<String,Object> savaList1(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
	
		String action = (String)paramMap.get("action"); // 구분하는 키값 
		System.out.println("action 값 찍어보기 : " + action);

		String resultMsg = "";
	
		// insert 인지, update 수정인지 확인하기 
		if("I".equals(action)) {
			lectureMgtService.insertLectureMgt(paramMap); // 저장 service
			resultMsg = "SUCCESS";
			
		}else if("U".equals(action)) {
			lectureMgtService.updateLectureMgt(paramMap); // 수정 service
			resultMsg = "UPDATE";
			
		}else if("D".equals(action)) {
			lectureMgtService.deleteLectureMgt(paramMap); // 수정 service
			resultMsg = "DELETE";
			
		}else {
			resultMsg ="FALSE / 등록에 실패했습니다.";
		}
		
		System.out.println("#####################################"+paramMap);
		// 결과 값 전송
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("resultMsg", resultMsg);
		
		return resultMap;
	}

}
