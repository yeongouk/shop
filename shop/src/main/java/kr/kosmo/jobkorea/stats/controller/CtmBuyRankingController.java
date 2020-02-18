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

import kr.kosmo.jobkorea.stats.service.CtmBuyRankingService;



@Controller
@RequestMapping("/stats/")
public class CtmBuyRankingController {

	
	@Autowired
	CtmBuyRankingService ctmBuyRankingService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	
	
	/**
	 * 구입별 고객 순위  조회 초기화면
	 */
	@RequestMapping("ctmBuyRanking.do")
	public String initCtmBuyRanking(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".initCtmBuyRanking");
		logger.info("   - paramMap : " + paramMap);
		
		logger.info("+ End " + className + ".initCtmBuyRanking");

		return "stats/ctmBuyRanking";
	}
	
	
	/**
	 * 구입별 고객 순위 목록 조회
	 */
	@RequestMapping("ctmBuyRankingList.do")
	public String ctmBuyRankingList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".ctmBuyRankingList");
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
		
		// 구입별 고객 순위 목록 조회
		List<Map<String, Object>> ctmBuyRankingList = ctmBuyRankingService.ctmBuyRankingList(paramMap);
		model.addAttribute("ctmBuyRankingList", ctmBuyRankingList);
		
		//구입별 고객 순위 목록 카운트 조회
		int totalCount = ctmBuyRankingService.countCtmBuyRankingList(paramMap);
		model.addAttribute("totalCnt", totalCount);
		
		
		logger.info("+ End " + className + ".ctmBuyRankingList");

		
		return "stats/ctmBuyRankingList";
	}	

}
