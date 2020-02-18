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

import kr.kosmo.jobkorea.manageA.model.ExquestionExamListModel;
import kr.kosmo.jobkorea.manageA.model.ExquestionLectureBoxModel;
import kr.kosmo.jobkorea.manageA.model.ExquestionMgtModel;
import kr.kosmo.jobkorea.manageA.model.ExquestionTestModel;
import kr.kosmo.jobkorea.manageA.service.ExquestionMgtService;

@Controller
@RequestMapping("/manageA/")
public class ExquestionMgtController {
	
	@Autowired
	ExquestionMgtService exquestionMgtService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	/**
	 * 시험문제 관리 초기화면
	 */
	@RequestMapping("exquestionMgt.do")
	public String exquestionMgt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".exquestionMgt");
		logger.info("   - paramMap : " + paramMap);

//		List<ComnCodUtilModel> ofcDvsCod = ComnCodUtil.getComnCod("OFC_DVS_COD");	// 커뮤니티 구분 코드
//		List<ComnCodUtilModel> atrtDvsCod = ComnCodUtil.getComnCod("ATRT_DVS_COD");	// 권한 구분 코드
//		List<ComnCodUtilModel> cmntDvsCod = ComnCodUtil.getComnCod("CMNT_DVS_COD");	// 게시판 구분 코드
//		model.addAttribute("ofcDvsCod", ofcDvsCod);
//		model.addAttribute("atrtDvsCod", atrtDvsCod);
//		model.addAttribute("cmntDvsCod", cmntDvsCod);
		
		logger.info("+ End " + className + ".exquestionMgt");

		return "manageA/exquestionMgt";
	}
	
	
	/**exquestionMgtList
	 * 과정 목록 조회
	 */
	@RequestMapping("exquestionMgtList.do")
	public String exquestionMgtList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".exquestionMgtList");
		logger.info("   - paramMap : " + paramMap);
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));
		int pageIndex = (currentPage -1)*pageSize;
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		List<ExquestionMgtModel> exquestionListMgtModel = exquestionMgtService.selectExquestionListMgt(paramMap);
		model.addAttribute("ExquestionListMgtModel", exquestionListMgtModel);
		
		int totalCount = exquestionMgtService.exquestionListTotalCnt(paramMap);
		model.addAttribute("ExquestionListTotalCnt", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPage",currentPage);
		
		logger.info("+ End " + className + ".exquestionMgtList");

		return "/manageA/exquestionMgtList";
	}
	
	/**exquestionTestList
	 * 시험 목록 조회
	 */
	@RequestMapping("exquestionTestList.do")
	public String exquestionTestList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".exquestionTestList");
		logger.info("   - paramMap : " + paramMap);
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));
		int pageIndex = (currentPage -1)*pageSize;
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// param으로 넘어온 데이터
		paramMap.put("no", Integer.parseInt((String)paramMap.get("no")));
		
		List<ExquestionTestModel> exquestionTestModel = exquestionMgtService.exquestionTestList(paramMap);
		model.addAttribute("exquestionTestModel", exquestionTestModel);
		
		int totalCount = exquestionMgtService.exquestionTestListCnt(paramMap);
		model.addAttribute("exquestionTestListCnt", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPage",currentPage);
		
		logger.info("+ End " + className + ".exquestionTestList");

		return "/manageA/exquestionTestList";
	}
	
	/**exquestionExamList
	 * 시험문제 목록 조회
	 */
	@RequestMapping("exquestionExamList.do")
	public String exquestionExamList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".exquestionExamList");
		logger.info("   - paramMap : " + paramMap);
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));
		int pageIndex = (currentPage -1)*pageSize;
		
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// param으로 넘어온 데이터
		paramMap.put("no", Integer.parseInt((String)paramMap.get("no")));
		
		List<ExquestionExamListModel> exquestionExamListModel = exquestionMgtService.exquestionExamList(paramMap);
		model.addAttribute("exquestionExamListModel", exquestionExamListModel);
		
		int totalCount = exquestionMgtService.exquestionExamListCnt(paramMap);
		model.addAttribute("exquestionExamListCnt", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPage",currentPage);
		
		logger.info("+ End " + className + ".exquestionExamList");

		return "/manageA/exquestionExamList";
	}
	
	
	/* 시험문제 등록 및 수정 */
	@RequestMapping("saveExamData.do")
	@ResponseBody
	public Map<String,Object> saveExamData(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		String sendState = (String)paramMap.get("sendState"); // 구분하는 키값

		String resultMsg = "";
		
		// param으로 넘어온 데이터
		paramMap.put("seq", Integer.parseInt((String)paramMap.get("seq")));
		
		if( "I".equals(sendState) || "U".equals(sendState) ) {
			paramMap.put("point", Integer.parseInt((String)paramMap.get("point")));
		}
		
		try {
			
			// insert 인지, update 수정인지 확인하기 
			if("I".equals(sendState)) {
				exquestionMgtService.insertExamTestList(paramMap); // 저장 service
				resultMsg = "SUCCESS";
				
			} else if("U".equals(sendState)) {
				exquestionMgtService.updateExamData(paramMap); // 수정 service
				resultMsg = "UPDATE";
				
			} else if("D".equals(sendState)) {
				exquestionMgtService.deleteExamTestList(paramMap); // 삭제 service
				resultMsg = "DELETE";
				
			} 
			
		} catch(Exception e) {
			resultMsg ="FALSE";
			logger.info("error = " + e.getMessage());
		}
		
		// 결과 값 전송
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("resultMsg", resultMsg);
		
		return resultMap;
	}
	
	/* 강의정보 목록 조회 */
	@RequestMapping("selectLectureTitle.do")
	@ResponseBody
	public Map<String,Object> selectLectureTitle(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String resultMsg = "";
		
		try {
			
			List<ExquestionLectureBoxModel> exquestionExamListModel = exquestionMgtService.selectLectureTitle(paramMap);
			resultMap.put("titleNm", exquestionExamListModel);
			resultMsg ="SUCCESS";
			
			logger.info("resultData =   " + resultMap.toString());
			
		} catch(Exception e) {
			resultMsg ="FALSE";
			logger.info("error = " + e.getMessage());
		}
		
		// 결과 값 전송
		resultMap.put("resultMsg", resultMsg);
		
		return resultMap;
	}
	
	/* 강의정보 목록 조회 */
	@RequestMapping("saveTestNm.do")
	@ResponseBody
	public Map<String,Object> saveTestNm(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		String resultMsg = "";
		
		// param으로 넘어온 데이터
//		paramMap.put("seq", Integer.parseInt((String)paramMap.get("seq")));

		try {
			
			exquestionMgtService.insertTestNm(paramMap); // 저장 service
			resultMsg = "SUCCESS";
			
		} catch(Exception e) {
			resultMsg ="FALSE";
			logger.info("error = " + e.getMessage());
		}
		
		// 결과 값 전송
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("resultMsg", resultMsg);
		
		return resultMap;
	}
}
