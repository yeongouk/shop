package kr.kosmo.jobkorea.system.controller;

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

import kr.kosmo.jobkorea.common.comnUtils.ComnCodUtil;
import kr.kosmo.jobkorea.system.model.ComnCodUtilModel;
import kr.kosmo.jobkorea.system.model.CmntMgrModel;
import kr.kosmo.jobkorea.system.service.CmntMgrService;

@Controller
@RequestMapping("/system/")
public class CmntMgrController {
	
	@Autowired
	CmntMgrService CmntMgrService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	/**
	 * 커뮤니티 관리 초기화면
	 */
	@RequestMapping("cmntMgr.do")
	public String initCmnt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".initCmnt");
		logger.info("   - paramMap : " + paramMap);

		List<ComnCodUtilModel> ofcDvsCod = ComnCodUtil.getComnCod("OFC_DVS_COD");	// 커뮤니티 구분 코드
		List<ComnCodUtilModel> atrtDvsCod = ComnCodUtil.getComnCod("ATRT_DVS_COD");	// 권한 구분 코드
		List<ComnCodUtilModel> cmntDvsCod = ComnCodUtil.getComnCod("CMNT_DVS_COD");	// 게시판 구분 코드
		model.addAttribute("ofcDvsCod", ofcDvsCod);
		model.addAttribute("atrtDvsCod", atrtDvsCod);
		model.addAttribute("cmntDvsCod", cmntDvsCod);
		
		logger.info("+ End " + className + ".initCmnt");

		return "system/cmntMgr";
	}
	
	
	/**
	 * 커뮤니티 목록 조회
	 */
	@RequestMapping("cmntMgrList.do")
	public String listCmnt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listCmnt");
		logger.info("   - paramMap : " + paramMap);
		
		// 커뮤니티 목록 조회 0depth
		List<CmntMgrModel> listCmntModel = CmntMgrService.listCmnt(paramMap);
		
		model.addAttribute("listModel", listCmntModel);
		System.out.println("이거 되나?"+listCmntModel);
		System.out.println("이거 되나?"+listCmntModel);
		System.out.println("이거 되나?"+listCmntModel);
		System.out.println("이거 되나?"+listCmntModel);
		System.out.println("이거 되나?"+listCmntModel);
		System.out.println("이거 되나?"+listCmntModel);
		System.out.println("이거 되나?"+listCmntModel);
		
		logger.info("+ End " + className + ".listCmnt");

		return "/system/cmntMgrList";
	}
	
	/**
	 *  커뮤니티 단건 조회
	 */
	@RequestMapping("selectCmntMgr.do")
	@ResponseBody
	public Map<String, Object> selectCmnt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".selectCmnt");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "사용 가능 합니다.";
		// 커뮤니티 단건 조회
		CmntMgrModel cmntModel = CmntMgrService.selectCmnt(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("cmntMgrModel", cmntModel);
		
		logger.info("+ End " + className + ".selectCmnt");
		
		return resultMap;
	}
	
	
	/**
	 *  커뮤니티 저장 : 신규/업데이트
	 */
	@RequestMapping("saveCmntMgr.do")
	@ResponseBody
	public Map<String, Object> saveCmnt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".saveCmnt");

		String action = (String)paramMap.get("action");
		String result = "SUCCESS";
		String resultMsg = "저장 되었습니다.";
		
		// 사용자 정보 설정
		paramMap.put("fst_rgst_sst_id", session.getAttribute("usrSstId"));
		paramMap.put("fnl_mdfr_sst_id", session.getAttribute("usrSstId"));

		logger.info("   - paramMap : " + paramMap);
		
		if ("I".equals(action)) {
			CmntMgrService.insertCmnt(paramMap); // 커뮤니티 신규 저장 
			
		} else if("U".equals(action)) {
			CmntMgrService.updateCmnt(paramMap); // 커뮤니티 수정 저장
			
		} else {
			result = "FALSE";
			resultMsg = "알수 없는 요청 입니다.";
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".saveCmnt");
		
		return resultMap;
	}
	
	/**
	 *  커뮤니티 삭제
	 */
	@RequestMapping("deleteCmntMgr.do")
	@ResponseBody
	public Map<String, Object> deleteCmnt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".deleteCmnt");

		String result = "SUCCESS";
		String resultMsg = "삭제 되었습니다.";

		paramMap.put("fnl_mdfr_sst_id", session.getAttribute("usrSstId"));
		logger.info("   - paramMap : " + paramMap);
		// 커뮤니티 삭제
		CmntMgrService.deleteCmnt(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".deleteCmnt");
		
		return resultMap;
	}

}
