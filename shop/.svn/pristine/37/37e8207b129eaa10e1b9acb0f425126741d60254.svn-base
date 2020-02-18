package kr.kosmo.jobkorea.stats.controller;

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

import kr.kosmo.jobkorea.stats.service.CtmSpecProCostService;


@Controller
@RequestMapping("/stats/")
public class CtmSpecProCostController {

	@Autowired
	CtmSpecProCostService ctmSpecProCostService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	
	
	/**
	 * 특정 상품의 일정 금액 이상 주문한 고객 목록 조회 초기화면
	 */
	@RequestMapping("ctmSpecProCost.do")
	public String initCtmSpecProCost(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".initCtmSpecProCost");
		logger.info("   - paramMap : " + paramMap);
		
		logger.info("+ End " + className + ".initCtmSpecProCost");

		return "stats/ctmSpecProCost";
	}
	
	
	/**
	 * 특정 상품의 일정 금액 이상 주문한 고객 목록 조회
	 */
	@RequestMapping("ctmSpecProCostList.do")
	public String ctmSpecProCostList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".ctmSpecProCostList");
		logger.info("   - paramMap : " + paramMap);
		
		
		//paramMap.put("loginId", session.getAttribute("loginId"));
		//paramMap.put("userType", session.getAttribute("userType")); 
		//paramMap.put("reg_date", session.getAttribute("reg_date"));
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
				
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPage",currentPage);
		
		//System.out.println("currentPage : " + currentPage);
		
		// 음식 판매 순위 목록 조회
		List<Map<String, Object>> ctmSpecProCostList = ctmSpecProCostService.ctmSpecProCostList(paramMap);
		model.addAttribute("ctmSpecProCostList", ctmSpecProCostList);
		
		//음식 판매 순위 목록 카운트 조회
		int totalCount = ctmSpecProCostService.countCtmSpecProCostList(paramMap);
		model.addAttribute("totalCnt", totalCount);
		
		
		logger.info("+ End " + className + ".ctmSpecProCostList");

		
		return "stats/ctmSpecProCostList";
	}	
}
