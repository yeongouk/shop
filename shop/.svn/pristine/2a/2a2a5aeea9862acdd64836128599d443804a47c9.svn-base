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
import kr.kosmo.jobkorea.manageF.service.RoomInfoService;
import kr.kosmo.jobkorea.manageF.service.ToolinfoService;

@Controller
@RequestMapping("/manageF/")
public class RoomInfoController {
	
	@Autowired
	RoomInfoService roInfoService;
	@Autowired
	ToolinfoService toolinfoService;
	
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@RequestMapping("lectureroomMgt.do")
	public String roomInfo(Model model , HttpSession session) {
		logger.info("+ Start " + className + ".lectureroomMgt");
		model.addAttribute("loginId", session.getAttribute("loginId"));
		logger.info("+ End " + className + ".lectureroomMgt");
		
		return "/manageF/lectureRoomInfo";
		
	}
	
	//강의실 리스트조회
	@RequestMapping("lectureRoomInfo.do")
	public String roomInfo(Model model ,@RequestParam Map<String, Object> roomMap, HttpServletRequest request,
			HttpServletResponse response,HttpSession session) {
		
		logger.info("+ Start " + className + ".강의실 리스트조회");
		
		int currentPage = Integer.parseInt((String)roomMap.get("currentPage")); // 현재페이지 
		int pageSize = Integer.parseInt((String)roomMap.get("pageSize"));
		int pageIndex = (currentPage -1)*pageSize;
		
		// 사이즈는 int형으로, index는 2개로 만들어서 -> 다시 파람으로 만들어서 보낸다.
		roomMap.put("pageIndex", pageIndex);
		roomMap.put("pageSize", pageSize);
		
		model.addAttribute("loginId", session.getAttribute("loginId"));
		
		List<Map<String, Object>> lectureRoomlist = roInfoService.selectListRoomList(roomMap);
		int rCnt=roInfoService.cntRoomList(roomMap);
		
		model.addAttribute("lectureRoomlist",lectureRoomlist); 
		model.addAttribute("totalCnt",rCnt); 
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("resultMsg","LIST");
		
		logger.info("+ End " + className + ".강의실 리스트조회");
		
		
		return "/manageF/lectureRoomInfoDetail";
		
	}
	
	
	//강의실 신규 등록
	@RequestMapping("InsertRoomInfo.do")
	@ResponseBody
	public Map<String, String> lectureInsert(Model model, @RequestParam Map<String, Object> reqParam,RedirectAttributes rttr, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".강의실 신규 등록");
		
		roInfoService.insertRoomInfo(reqParam);
		Map<String, String> resultMap = new HashMap<String, String>();
	    resultMap.put("resultMsg", "INSERT");
	    
		
	    logger.info("+ End " + className + ".강의실 신규 등록");
		return resultMap;

	}
	



}
