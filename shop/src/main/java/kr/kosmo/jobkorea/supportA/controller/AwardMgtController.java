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

import kr.kosmo.jobkorea.supportA.model.AwardMgtDtlModel;
import kr.kosmo.jobkorea.supportA.model.AwardMgtDtlModel2;
import kr.kosmo.jobkorea.supportA.model.AwardMgtModel;
import kr.kosmo.jobkorea.supportA.service.AwardMgtService;

@Controller
@RequestMapping("/supportA/")
public class AwardMgtController {
	
	@Autowired
	AwardMgtService awardMgtService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	
	
	/**
	 * 공통코드 관리 초기화면
	 */
	@RequestMapping("awardMgt.do")
	public String initComnCod(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".initComnCod");
		logger.info("   - paramMap : " + paramMap);
		
		logger.info("+ End " + className + ".initComnCod");

		return "supportA/AwardMgt";
	}
	
	
	/**
	 * 공통 그룹 코드 목록 조회
	 */
	@RequestMapping("listAwardMgt.do")
	public String listLectureMgt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listAwardMgt");
		logger.info("   - paramMap : " + paramMap);
		
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
				
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 공통 그룹코드 목록 조회
		List<AwardMgtModel> listAwardMgtModel = awardMgtService.listAwardMgt(paramMap);
		model.addAttribute("listAwardMgtModel", listAwardMgtModel);
		
		// 공통 그룹코드 목록 카운트 조회
		int totalCount = awardMgtService.countListAwardMgt(paramMap);
		model.addAttribute("totalCntAwardMgt", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageComnGrpCod",currentPage);
		
		logger.info("+ End " + className + ".listAwardMgt");
		

		return "/supportA/AwardMgtGrpList";
	}
	
	

	/**
	 *  공통 그룹 코드 단건 조회
	 */
	@RequestMapping("selectAwardMgt.do")
	@ResponseBody
	public Map<String, Object> selectAwardMgt (Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".selectAwardMgt");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "조회 되었습니다.";
		
		// 공통 그룹 코드 단건 조회
		AwardMgtModel awardMgtModel = awardMgtService.selectAwardMgt(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("lectureMgt", awardMgtModel);
		
		logger.info("+ End " + className + ".selectAwardMgt");
		
		return resultMap;
	}
	
	
	
			
	
	/**
	 * 공통 상세 코드 목록 조회
	 */
	@RequestMapping("listAwardMgtDtl.do")
	public String listAwardMgtDtl(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listAwardMgtDtl");
		logger.info("   - paramMap : " + paramMap);
		
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
		

		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 공통 상세코드 목록 조회
		List<AwardMgtDtlModel> listAwardMgtDtlModel = awardMgtService.listAwardMgtDtl(paramMap);
		model.addAttribute("listAwardMgtDtlModel", listAwardMgtDtlModel);
		
		// 공통 상세코드 목록 카운트 조회
		int totalCount = awardMgtService.countListAwardMgtDtl(paramMap);
		model.addAttribute("totalCntAwardMgtDtlCod", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageComnDtlCod",currentPage);
		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"+model);
		logger.info("+ End " + className + ".listAwardMgtDtl");

		return "/supportA/AwardMgtDtlList";
	}	
	
	/**
	 * 공통 상세 코드 목록 조회2
	 */
	@RequestMapping("listAwardMgtDtl2.do")
	public String listAwardMgtDtl2(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listAwardMgtDtl2");
		logger.info("   - paramMap : " + paramMap);
		
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
		

		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 공통 상세코드 목록 조회
		List<AwardMgtDtlModel2> listAwardMgtDtlModel2 = awardMgtService.listAwardMgtDtl2(paramMap);
		model.addAttribute("listAwardMgtDtlModel2", listAwardMgtDtlModel2);
		
		// 공통 상세코드 목록 카운트 조회
		int totalCount = awardMgtService.countListAwardMgtDtl2(paramMap);
		model.addAttribute("totalCntAwardMgtDtlCod2", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageComnDtlCod",currentPage);
		System.out.println("22222222222222222222222222222222"+model);
		logger.info("+ End " + className + ".listAwardMgtDtl2");

		return "/supportA/AwardMgtDtlList2";
	}

	/**
	 *  수상내역 단건 조회
	 */
	@RequestMapping("selectAwardMgtDtl.do")
	@ResponseBody
	public Map<String, Object> selectAwardMgtDtl (Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".selectAwardMgtDtl");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "조회 되었습니다con.";
		
		// 공통 상세 코드 단건 조회
		AwardMgtDtlModel awardMgtDtlModel = awardMgtService.awardMgtDtlModel(paramMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("awardMgtDtlModel", awardMgtDtlModel);
		System.out.println("결과 글 찍어봅세 " + result);
		System.out.println("결과 글 찍어봅세 " + awardMgtDtlModel);
		logger.info("+ End " + className + ".selectAwardMgtDtl");
	
		return resultMap;
	}
	
	/* 공지사항 등록하기 */
	@RequestMapping("AwardMgtSave.do")
	@ResponseBody
	public Map<String,Object> savaList(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
	
		String action = (String)paramMap.get("action"); // 구분하는 키값 
		System.out.println("action 값 찍어보기 : " + action);

		String resultMsg = "";
	
		// insert 인지, update 수정인지 확인하기 
		if("I".equals(action)) {
			awardMgtService.insertAwardMgt(paramMap); // 저장 service
			resultMsg = "SUCCESS";
			
		}else if("U".equals(action)) {
			awardMgtService.updateAwardMgt(paramMap); // 수정 service
			resultMsg = "UPDATE";
			
		}else if("D".equals(action)) {
			awardMgtService.deleteAwardMgt(paramMap); // 수정 service
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
