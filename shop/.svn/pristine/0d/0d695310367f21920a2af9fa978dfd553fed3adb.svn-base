package kr.kosmo.jobkorea.stats.controller;

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

import kr.kosmo.jobkorea.stats.dto.StatsDTO;
import kr.kosmo.jobkorea.stats.service.StatsService;


@Controller
@RequestMapping("/stats/")
public class StatsController {
	
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	private final String className = this.getClass().toString();
	
	@Autowired
	StatsService service;
	
	@RequestMapping("salesStats.do")
	public String freeboardlist(Model model, @RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		
		return "stats/StatsList";
	}
	
	@RequestMapping("BoardList.do")
	public String boardList(Model model, @RequestParam Map<String, Object> map, HttpServletRequest request,
		HttpServletResponse response, HttpSession session) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		map.put("loginId", session.getAttribute("loginId"));
		map.put("userType", session.getAttribute("userType")); 
		map.put("reg_date", session.getAttribute("reg_date"));
		
		int currentPage = Integer.parseInt((String)map.get("currentPage"));	
		int pageSize = Integer.parseInt((String)map.get("pageSize"));			
		int pageIndex = (currentPage-1)*pageSize;
		
		map.put("pageIndex", pageIndex);
		map.put("pageSize", pageSize);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageBoard", currentPage);
		
		List<StatsDTO> list = service.getBoardList(map);
		model.addAttribute("board", list);
		System.out.printf("************"+map+"##########"+model+"###########","%%%%%%"+list+"%%%%%%%%%%");
		
		  int totalCount = service.countListBoard(map);
		  model.addAttribute("totalCntBoard", totalCount);
		 
		
		return "stats/StatsDtlList";
		
	}
	
	
	
	
	  @RequestMapping("/selectBoard.do")
	  
	  @ResponseBody public Map<String, Object> selectBoard(Model
	  model, @RequestParam Map<String, Object> map, HttpServletRequest request,
	  HttpServletResponse response, HttpSession session) throws Exception {
	  
	  
	  map.put("loginId", session.getAttribute("loginId")); map.put("userType",
	  session.getAttribute("userType")); map.put("reg_date",
	  session.getAttribute("reg_date"));
	  
	  StatsDTO dto = service.selectBoardDtl(map);
	  
	  String result = "SUCCESS"; String resultMsg="조회성공";
	  
	  
	  
	  Map<String, Object> resultMap = new HashMap<String, Object>();
	  resultMap.put("result", result); resultMap.put("resultMsg", resultMsg);
	  resultMap.put("dto", dto);
	  
	  return resultMap; }
	 
	  
	
	
	 
}
