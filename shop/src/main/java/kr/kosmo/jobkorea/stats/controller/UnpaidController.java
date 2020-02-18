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

import kr.kosmo.jobkorea.stats.service.UnpaidService;


@Controller
@RequestMapping("/stats/")
public class UnpaidController {

		
		@Autowired
		UnpaidService unpaidService;
		
		// Set logger
		private final Logger logger = LogManager.getLogger(this.getClass());

		// Get class name for logger
		private final String className = this.getClass().toString();
		
		
		
		/**
		 * 미납요금 조회 초기화면
		 */
		@RequestMapping("unpaidCost.do")
		public String initUnpaid(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			
			logger.info("+ Start " + className + ".initUnpaid");
			logger.info("   - paramMap : " + paramMap);
			
			logger.info("+ End " + className + ".initUnpaid");

			return "stats/unpaid";
		}
		
		
		/**
		 * 미납요금 목록 조회
		 */
		@RequestMapping("unpaidList.do")
		public String unpaidList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			
			logger.info("+ Start " + className + ".unpaidList");
			logger.info("   - paramMap : " + paramMap);
			
			
			//paramMap.put("loginId", session.getAttribute("loginId"));
			//paramMap.put("userType", session.getAttribute("userType")); 
			paramMap.put("reg_date", session.getAttribute("reg_date"));
			
			int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
			int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
			int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
					
			paramMap.put("pageIndex", pageIndex);
			paramMap.put("pageSize", pageSize);
			
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("currentPage",currentPage);
			
			// 미납요금 목록 조회
			List<Map<String, Object>> unpaidList = unpaidService.unpaidList(paramMap);
			model.addAttribute("unpaidList", unpaidList);
			
			//미납요금 목록  카운트 조회
			int totalCount = unpaidService.countUnpaidList(paramMap);
			model.addAttribute("totalCntUnpaid", totalCount);
			
			
			
			logger.info("+ End " + className + ".unpaidList");

			return "stats/unpaidList";
		}	


}
