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

import kr.kosmo.jobkorea.statistics.model.FailedNumModel;
import kr.kosmo.jobkorea.statistics.service.FailedService;
import kr.kosmo.jobkorea.system.model.ComnGrpCodModel;

@Controller
@RequestMapping("/statistics/")
public class FailedNumController {
	
	@Autowired
	FailedService failedService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	/**
	 * 과락인원 초기화면
	 */
	@RequestMapping("failedNum.do")
	public String initFailedNum(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".initFailedNum");
		logger.info("   - paramMap : " + paramMap);
		
		logger.info("+ End " + className + ".initFailedNum");

		return "statistics/failedNum";
	}
	
	/**
	 * 과락인원 목록 조회
	 */
	@RequestMapping("listfailedNum.do")
	public String listfailedNum(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listfailedNum");
		logger.info("   - paramMap : " + paramMap);
		
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;									// 페이지 시작 row 번호
				
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 과락인원 목록 조회
		List<FailedNumModel> listFailedNumModel = failedService.listFailedNum(paramMap);
		model.addAttribute("listFailedNumModel", listFailedNumModel);
		
		// 과락인원 목록 카운트 조회
		int totalCount = failedService.countListFailedNum(paramMap);
		model.addAttribute("totalCntFailedNum", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageFailedNum",currentPage);
		
		logger.info("+ End " + className + ".listfailedNum");
		

		return "/statistics/failedNumList";
	}	
	
	/**
	 *  과락인원 목록 전체조회(그래프 출력용)
	 */
	@RequestMapping("listFailedNumForGraph.do")
	@ResponseBody
	public Map<String, Object> listFailedNumForGraph (Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listFailedNumForGraph");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "조회 되었습니다.";
		
		// 과락인원 목록 전체조회(그래프 출력용)
		List<FailedNumModel> failedNumModelForGraph = failedService.listFailedNumForGraph(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("failedNumModelForGraph", failedNumModelForGraph);
		
		logger.info("+ End " + className + ".listFailedNumForGraph");
		
		return resultMap;
	}
	
	
}












