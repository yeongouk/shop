package kr.kosmo.jobkorea.statistics.controller;

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

import kr.kosmo.jobkorea.manageD.model.SurveyResultModel;
import kr.kosmo.jobkorea.statistics.model.FailedNumModel;
import kr.kosmo.jobkorea.statistics.service.SatisfactionService;

@Controller
@RequestMapping("/statistics/")
public class StatisticsController {
	
	@Autowired
	SatisfactionService service;
	
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	

	@RequestMapping("satisfaction.do")
	public String examination(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {		
		
		model.addAttribute("loginID", session.getAttribute("loginId"));
		
		return "/statistics/satisfaction";
	}	
	
	@RequestMapping("listSatisfactionForGraph.do")
	@ResponseBody
	public Map<String, Object> selectSatisfaction (Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listSatisfactionForGraph");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "조회 되었습니다.";
		
		// 과락인원 단건 조회
		List<SurveyResultModel> satisfactionModelForGraph = service.listSatisfactionForGraph(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("satisfactionModelForGraph", satisfactionModelForGraph);
		
		logger.info("+ End " + className + ".listSatisfactionForGraph");
		
		return resultMap;
	}
}
