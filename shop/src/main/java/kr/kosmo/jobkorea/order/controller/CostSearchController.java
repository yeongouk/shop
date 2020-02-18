package kr.kosmo.jobkorea.order.controller;

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

import kr.kosmo.jobkorea.order.model.CostSearchModel;
import kr.kosmo.jobkorea.order.service.CostSearchService;



@Controller
@RequestMapping("/order/")
public class CostSearchController {
	
	@Autowired
	CostSearchService costSearchService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	
	
	/**
	 * 이용금액 조회  초기화면
	 */
	@RequestMapping("costSearch.do")
	public String initCostSearch(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".initCostSearch");
		logger.info("   - paramMap : " + paramMap);
		
		
		logger.info("+ End " + className + ".initCostSearch");

		return "order/costSearch";
	}
	
	
	/**
	 * 이용금액 목록 조회
	 */
	@RequestMapping("costSearchList.do")
	public String costSearchList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".costSearchList");
		logger.info("   - paramMap : " + paramMap);
		
		
		paramMap.put("loginId", session.getAttribute("loginId"));
		paramMap.put("userType", session.getAttribute("userType")); 
		paramMap.put("reg_date", session.getAttribute("reg_date"));
		
		System.out.println(paramMap);
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
				
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPage",currentPage);
		
		// 이용금액 목록 조회
		List<Map<String, Object>> costSearchList = costSearchService.costSearchList(paramMap);
		model.addAttribute("costSearchList", costSearchList);
		
	
		
		
		int totalCount = costSearchService.countListCostSearch(paramMap);
		model.addAttribute("totalCnt", totalCount);
		
		
		logger.info("+ End " + className + ".costSearchList");

		return "order/costSearchList";
	}	


}
