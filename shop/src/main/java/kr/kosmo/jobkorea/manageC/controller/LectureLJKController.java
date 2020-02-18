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

import kr.kosmo.jobkorea.manageC.model.LectureLJKGrpModel;
import kr.kosmo.jobkorea.manageC.service.LectureLJKService;

@Controller
@RequestMapping("/manageC/")
public class LectureLJKController {
	
	@Autowired
	LectureLJKService lectureService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	/**
	 * 수강목록/진도 초기화면
	 */
	@RequestMapping("lecture.do")
	public String initLecture(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".initLecture");
		logger.info("   - paramMap : " + paramMap);
		
		logger.info("+ End " + className + ".initLecture");
		
		return "manageC/lectureLJK";
	}
	
	/**
	 * 수강목록/진도 목록 조회
	 */
	@RequestMapping("listLectureLJKGrp.do")
	public String listComnGrpCod(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		paramMap.put("loginID", session.getAttribute("loginId"));
		
		logger.info("+ Start " + className + ".listComnGrpCod");
		logger.info("   - paramMap : " + paramMap);
		
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;									// 페이지 시작 row 번호
				
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		
		System.out.println("파파파파파파라라라라라라" + paramMap);
		// 수강목록/진도 목록 조회
		
		List<Map<String, Object>> lectureGrpModel = lectureService.listLecttureGrp(paramMap);
		model.addAttribute("listLectureGrpModel", lectureGrpModel);
		
		// 수강목록/진도 목록 카운트 조회
		int totalCount = lectureService.countListLectureGrp(paramMap);
		
		model.addAttribute("totalCntLectureGrp", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageLectureGrp",currentPage);
		
		logger.info("+ End " + className + ".listLectureGrp");
		
		return "/manageC/lectureGrpListLJK";
	}	
	
	/**
	 * 수강목록/진도 단건 조회
	 */
	@RequestMapping("selectLectureLJKGrp.do")
	@ResponseBody
	public Map<String,Object> detailList(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		
		paramMap.put("loginID", session.getAttribute("loginId"));
		logger.info("+ Start " + className + ".listLectureDtl");
		logger.info("   - paramMap : " + paramMap);
		
		String result = "SUCCESS";
		String resultMsg = "조회 되었습니다.";
		
		// 수강목록/진도 단건 조회
		//LectureLJKGrpModel lectureGrpModel = lectureService.selectLectureGrp(paramMap);
		Map<String, Object> lectureGrpModel = lectureService.selectLectureDtl(paramMap);
		
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("lectureGrpModel", lectureGrpModel);
		
		logger.info("+ End " + className + ".selectLectureGrp");
		
		return resultMap;
		
	}
	
	@RequestMapping("saveLectureLJKGrp.do")
	@ResponseBody
	public Map<String, Object> saveLectureGrp(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".saveLectureGrp");
		logger.info("   - paramMap : " + paramMap);
		
		String action = (String)paramMap.get("action");
		String result = "SUCCESS";
		String resultMsg = "저장 되었습니다.";
		
		// 사용자 정보 설정
		paramMap.put("fst_rgst_sst_id", session.getAttribute("usrSsId"));
		paramMap.put("fnl_mdfr_sst_id", session.getAttribute("usrSstId"));
		
		if("I".contentEquals(action)) {
			// 수강목록/진도 신규 저장
			// lectureService.insertLectureGrp(paramMap);
		} else if("U".contentEquals(action)) {
			// 수강목록/진도 수정 저장
			lectureService.updateLectureGrp(paramMap);
		} else {
			result = "FALSE";
			resultMsg = "알수 없는 요청 입니다.";
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".saveLectureGrp");
		
		return resultMap;
		
	}
	
}





















