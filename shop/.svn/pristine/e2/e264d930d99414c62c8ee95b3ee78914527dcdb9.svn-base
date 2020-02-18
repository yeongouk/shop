package kr.kosmo.jobkorea.system.controller;

import java.util.ArrayList;
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

import kr.kosmo.jobkorea.system.model.HoliMgrModel;
import kr.kosmo.jobkorea.system.service.HoliMgrService;

@Controller
@RequestMapping("/system/")
public class HoliMgrController {
	
	@Autowired
	HoliMgrService HoliMgrService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	/**
	 * 휴일 관리 초기화면
	 */
	@RequestMapping("holiMgr.do")
	public String initHoli(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".initHoli");
		logger.info("   - paramMap : " + paramMap);

		logger.info("+ End " + className + ".initHoli");

		return "system/holiMgr";
	}
	
	
	/**
	 * 휴일 목록 조회
	 */
	@RequestMapping("holiMgrList.do")
	public String listHoli(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listHoli");
		logger.info("   - paramMap : " + paramMap);
		
		String [] months = paramMap.get("month").toString().split(",");
		ArrayList<Object> listModel = new ArrayList<Object>();
		for(String month : months){
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("satDt", month);
			// 휴일 목록 조회
			List<HoliMgrModel> listHoliModel = HoliMgrService.listHoli(param);	
			listModel.add(listHoliModel);
		}
		model.addAttribute("listModel", listModel);
		
		logger.info("+ End " + className + ".listHoli");

		return "/system/holiMgrList";
	}
	
	/**
	 *  휴일 정보저장
	 */
	@RequestMapping("saveHoliMgr.do")
	@ResponseBody
	public Map<String, Object> saveHoli(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".saveHoli");
		
		if(!paramMap.get("holi_nm").toString().equals("")){
			//holi_poa
			paramMap.put("holi_poa", "Y");
		}else{
			paramMap.put("holi_poa", "N");
		}
		
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "저장 되었습니다.";
		
		// 휴일 정보저장
		HoliMgrService.saveHoli(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".saveHoli");
		
		return resultMap;
	}

}
