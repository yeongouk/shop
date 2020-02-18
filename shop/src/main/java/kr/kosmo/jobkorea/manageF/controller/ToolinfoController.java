package kr.kosmo.jobkorea.manageF.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.kosmo.jobkorea.manageF.model.ToolinfoModel;
import kr.kosmo.jobkorea.manageF.service.ToolinfoService;
 

/**

  * @FileName : ToolinfoController.java
  * @Project : lms
  * @Date : 2020. 2. 4. 
  * @작성자 : 이미혜
  * @변경이력 :
  * @프로그램 설명 :장비 컨트롤
  */
@Controller
@RequestMapping("/manageF/")
public class ToolinfoController {
	
	@Autowired
	ToolinfoService toolinfoService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	
	//강의실 장비 신규 등록
	@RequestMapping("InsertWareInfo.do")
	@ResponseBody
	public Map<String, Object> lectureInsert(Model model, @RequestParam Map<String, Object> reqParam,RedirectAttributes rttr, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".강의실 장비 신규 등록");
		logger.info("INSERT-----reqParam" + reqParam);

		toolinfoService.insertWareInfo(reqParam);
		Map<String, Object> resultMap = new HashMap<String, Object>();
	    resultMap.put("resultMsg", "INSERT");
	    resultMap.put("room", reqParam.get("wdRoom"));
	    
	    logger.info("+ End " + className + ".강의실 장비 신규 등록");
		return resultMap;

	}
	
	
	//해당 강의실 장비 정보 조회
	@RequestMapping("selectWareList.do")
	public String roomInfo(Model model ,@RequestParam Map<String, Object> wareMap, HttpServletRequest request,
			HttpServletResponse response,HttpSession session) {
		
		logger.info("+ Start " + className + ".해당강의실 리스트조회");
		
		int currentPage = Integer.parseInt((String)wareMap.get("currentPage")); // 현재페이지 
		int pageSize = Integer.parseInt((String)wareMap.get("pageSize"));
		int pageIndex = (currentPage -1)*pageSize;
			
		// 사이즈는 int형으로, index는 2개로 만들어서 -> 다시 파람으로 만들어서 보낸다.
		wareMap.put("pageIndex", pageIndex);
		wareMap.put("pageSize", pageSize);
		
		List<Map<String, Object>> wareList = toolinfoService.selectWareList(wareMap);
		int rCnt=toolinfoService.cntWareInfoList(wareMap);
		

		model.addAttribute("roomWareList",wareList); 
		model.addAttribute("wareCnt",rCnt); 
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("currentPage",currentPage);
		
		logger.info("+ End " + className + ".해당강의실 리스트조회");
		
		return "/manageF/roomToolInfoDetail";
		
	}
	
	
	//장비 상세 조회
	@RequestMapping("readWareDetail.do")
	@ResponseBody
	public Map<String, Object> readWareDetail(Model model, @RequestParam Map<String, Object> wareMap,RedirectAttributes rttr, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".장비 상세조회"+wareMap);
		ToolinfoModel toolinfoModel=toolinfoService.readOneWare(wareMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
	    resultMap.put("resultMsg", "READ");
	    resultMap.put("resultOneWare", toolinfoModel);
	    
	    logger.info("+ End " + className + ".장비 상세조회");
		return resultMap;

	}
	
	//장비 상세 수정
	@RequestMapping("updateWareInfo.do")
	@ResponseBody
	public Map<String, Object> updateWareInfo(Model model, @RequestParam Map<String, Object> wareMap,RedirectAttributes rttr, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".장비 상세 수정"+wareMap);
		int Iseq=Integer.parseInt((String) wareMap.get("Wseq"));
		wareMap.put("Wseq", Iseq);
		Map<String, Object> resultData = new HashMap<String, Object>();
		
		resultData.put("room", wareMap.get("wdRoom"));
		toolinfoService.updateWareInfo(wareMap);
		resultData.put("resultMsg", "UPDATE");
		
	    logger.info("+ End " + className + ".장비 상세 수정");
	    
		return resultData;

	}
	
	//장비 삭제
	@RequestMapping("deleteWareInfo.do")
	@ResponseBody
	public Map<String, Object> deleteWareInfo(Model model, @RequestParam Map<String, Object> wareMap,RedirectAttributes rttr, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".장비 삭제"+wareMap);
		int Iseq=Integer.parseInt((String) wareMap.get("Wseq"));
		wareMap.put("Wseq", Iseq);
		Map<String, Object> resultData = new HashMap<String, Object>();
		
		resultData.put("room", wareMap.get("wdRoom"));
		
		toolinfoService.deleteWareInfo(wareMap);
		resultData.put("resultMsg", "DELETE");
		
		logger.info("+ End " + className + ".장비 삭제");
		
		return resultData;
		
	}
	
	


}
