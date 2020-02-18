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

import kr.kosmo.jobkorea.stats.service.FoodRankingService;

@Controller
@RequestMapping("/stats/")
public class FoodRankingController {
	

	@Autowired
	FoodRankingService foodRankingService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	
	
	/**
	 * 음식 판매 순위  조회 초기화면
	 */
	@RequestMapping("foodRanking.do")
	public String initFoodRanking(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".initFoodRanking");
		logger.info("   - paramMap : " + paramMap);
		
		logger.info("+ End " + className + ".initFoodRanking");

		return "stats/foodRanking";
	}
	
	
	/**
	 * 음식 판매 순위 목록 조회
	 */
	@RequestMapping("foodRankingList.do")
	public String FoodRankingList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".FoodRankingList");
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
		List<Map<String, Object>> foodRankingList = foodRankingService.foodRankingList(paramMap);
		model.addAttribute("foodRankingList", foodRankingList);
		
		//음식 판매 순위 목록 카운트 조회
		int totalCount = foodRankingService.countFoodRankingList(paramMap);
		model.addAttribute("totalCntFoodRK", totalCount);
		
		
		logger.info("+ End " + className + ".FoodRankingList");

		
		return "stats/foodRankingList";
	}	


}
