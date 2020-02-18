package kr.kosmo.jobkorea.manageC.controller;

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

import kr.kosmo.jobkorea.manageC.model.testLJKModel;
import kr.kosmo.jobkorea.manageC.service.ExaminationLJKService;

@Controller
@RequestMapping("/manageC/")
public class ExaminationLJKController {
	
	@Autowired
	ExaminationLJKService service;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	

	@RequestMapping("examination.do")
	public String examination(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {		
		
		model.addAttribute("loginID", session.getAttribute("loginId"));
		
		return "/manageC/ExaminationLJK";
	}	
	
	
	/**
	 * 
	 */
	
	
	@RequestMapping("listExaminationLJK.do")
	public String listExam(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {		
	
		model.addAttribute("loginID", session.getAttribute("loginId"));
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
				
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 공통 그룹코드 목록 조회
		//List<Map<String, Object>> listLectureModel = lectureService.listLecture(paramMap);
		//model.addAttribute("listLectureModel", listLectureModel);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageLecture",currentPage);
		
		List<testLJKModel> list = service.listExam(paramMap);
		model.addAttribute("Exam", list);
		
		int totalCount = service.countExamlist(paramMap);
		model.addAttribute("totalCntExam", totalCount);
		
		return "/manageC/ExaminationLJKList";
	}	
	
	
	/**
	 * 공통코드 관리 초기화면
	 */
	@RequestMapping("selectproblem.do")
	@ResponseBody
	public Map<String, Object> initExam(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".initComnCod");
		logger.info("   - paramMap : " + paramMap);		
		
		model.addAttribute("loginId", session.getAttribute("loginId"));
		
		List<testLJKModel> list = service.selectProblem(paramMap);
		
		//int totalCount = service.countProblem(paramMap);
		//model.addAttribute("totalCntProblem", totalCount);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("Problem", list);


		logger.info("+ End " + className + ".initComnCod");

		return resultMap;			
	}
	
	@RequestMapping("testReg.do")
	@ResponseBody	
	public Map<String, Object> testReg(Model model, @RequestParam Map<String, Object> map, HttpSession session, HttpServletRequest request) throws Exception {
				
		logger.info("+ Start " + className + ".testReg");
		logger.info("   - paramMap : " + map);	
		
		map.put("loginId", session.getAttribute("loginId").toString());
		map.put("name", session.getAttribute("loginId").toString());
		
		String[] answer = map.get("answer").toString().split(":");
		
		List<testLJKModel> list = service.selectProblem(map);
		
		int i = 0;
		int score = 0;
		
		for(testLJKModel item : list) {
			String panswer = item.getPanswer();
			
	        String uanswer = answer[i];
	        
	        if(panswer.equals(uanswer)) {
	           score = item.getPoint();	        	
	        } else {
	           score = 0;
	        }
			
	        Map<String, Object> insertMap = new HashMap<String, Object>();
	        insertMap.put("no", item.getNo());
	        insertMap.put("re", item.getRe());
	        insertMap.put("seq", item.getSeq());
	        insertMap.put("loginID", map.get("studentId"));
	        insertMap.put("answer", uanswer);
	        insertMap.put("score", score);	        
	        
			service.testReg(insertMap, request);
			
			i++;
		}
		 
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", "SUCCESS");
		
		return resultMap;
		
	}
	
}
