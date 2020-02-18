package kr.kosmo.jobkorea.manageD.controller;

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

import kr.kosmo.jobkorea.manageD.model.EvaluationMgtKYLModel;

import kr.kosmo.jobkorea.manageD.service.EvaluationMgtKYLService;



@Controller
@RequestMapping("/manageD/")
public class EvaluationMgtKYLController {

	@Autowired
	EvaluationMgtKYLService evaluationMgtKYLService;
	
	   // Set logger
		private final Logger logger = LogManager.getLogger(this.getClass());

		// Get class name for logger
		private final String className = this.getClass().toString();
		

		/**
		 * 로그인한 강사의 강좌 목록 초기화면
		 */
		@RequestMapping("evaluationMgt.do")
		public String initEvaluationMgt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			
			logger.info("+ Start " + className + ".initEvaluationMgt");
			logger.info("   - paramMap : " + paramMap);
			
			//model.addAttribute("loginId", session.getAttribute("loginId"));
			
			
		
			
			logger.info("+ End " + className + ".initEvaluationMgt");

			return "manageD/evaluationMgtKYL";
		}
		
		
		/**
		 * 로그인한 강사의 강좌 목록 조회
		 */
		@RequestMapping("evaluationMgtList.do")
		public String evaluationMgtList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			
			logger.info("+ Start " + className + ".evaluationMgtList");
			logger.info("   - paramMap : " + paramMap);
			
			paramMap.put("loginID", session.getAttribute("loginId"));
			
			int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
			int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
			int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
					
			paramMap.put("pageIndex", pageIndex);
			paramMap.put("pageSize", pageSize);
			
			// 공통 그룹코드 목록 조회
			List<EvaluationMgtKYLModel> evaluationMgtList = evaluationMgtKYLService.evaluationMgtList(paramMap);
			model.addAttribute("evaluationMgtList", evaluationMgtList);
			
			// 공통 그룹코드 목록 카운트 조회
			int totalCount = evaluationMgtKYLService.evaluationMgtListCnt(paramMap);
			model.addAttribute("totalCnt", totalCount);
			
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("currentPage",currentPage);
			
			logger.info("+ End " + className + ".evaluationMgtList");
			

			return "manageD/evaluationMgtListKYL";
		}	
		
		
		/**
		 *  강좌 목록 단건 조회  : 사용안함
		 */
		@RequestMapping("selectLecture.do")
		@ResponseBody
		public Map<String, Object> selectLecture (Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			
			logger.info("+ Start " + className + ".selectLecture");
			logger.info("   - paramMap : " + paramMap);

			String result = "SUCCESS";
			String resultMsg = "조회 되었습니다.";
			
			//  강좌 목록 단건 조회
			EvaluationMgtKYLModel selectLecture = evaluationMgtKYLService.selectLecture(paramMap);
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("result", result);
			resultMap.put("resultMsg", resultMsg);
			resultMap.put("selectLecture", selectLecture);
			
			logger.info("+ End " + className + ".selectLecture");
			
			return resultMap;
		}
		
		/**
		 * 수강 학생 목록
		 */
		@RequestMapping("studentList.do")
		public String studentList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			
			logger.info("+ Start " + className + ".listStudent");
			logger.info("   - paramMap : " + paramMap);
			
			
			int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
			int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
			int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
			

			paramMap.put("pageIndex", pageIndex);
			paramMap.put("pageSize", pageSize);
			
			// 공통 상세코드 목록 조회
			List<EvaluationMgtKYLModel> studentList = evaluationMgtKYLService.studentList(paramMap);
			model.addAttribute("studentList", studentList);
			
			// 공통 상세코드 목록 카운트 조회
			int totalCount = evaluationMgtKYLService.countStudentList(paramMap);
			model.addAttribute("totalCnt", totalCount);
			
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("currentPage",currentPage);
			
			logger.info("+ End " + className + ".listStudent");

			return "manageD/evaluationMgtListKYL2";
		}	

		/**
		 *  학생평가 단건 조회
		 */
		@RequestMapping("selectStudent.do")
		@ResponseBody
		public Map<String, Object> selectStudent (Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			
			logger.info("+ Start " + className + ".selectStudent");
			logger.info("   - paramMap : " + paramMap);

			//String result = "SUCCESS";
			//String resultMsg = "조회 되었습니다.";
			String result="";
			
			// 학생평가 단건 조회
			EvaluationMgtKYLModel selectStudent = evaluationMgtKYLService.selectStudent(paramMap);
			
            if(selectStudent != null) {
				
				result = "SUCCESS";  // 성공시 찍습니다. 
				
			}else {
				result = "FAIL / 불러오기에 실패했습니다.";  // null이면 실패입니다.
			}
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("result", selectStudent); // 리턴 값 해쉬에 담기 
			resultMap.put("resultMsg", result);// success 용어 담기 
			//resultMap.put("selectStudent", selectStudent);
			
			System.out.println("결과 글 찍어봅세 " + result);
			//System.out.println("결과 글 찍어봅세 " + selectStudent);
			
			logger.info("+ End " + className + ".selectStudent");
			
			
			return resultMap;
		}

		
		/**
		 *  학생 평가 내용 저장
		 */
		@RequestMapping("saveEvaluation.do")
		@ResponseBody
		public Map<String, Object> saveEvaluation(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			
			logger.info("+ Start " + className + ".saveEvaluation");
			logger.info("   - paramMap : " + paramMap);

			String action = (String)paramMap.get("action");
			//String result = "SUCCESS";
			String resultMsg = "";
			
			// 사용자 정보 설정 ??
			//paramMap.put("fst_rgst_sst_id", session.getAttribute("usrSstId"));
			//paramMap.put("fnl_mdfr_sst_id", session.getAttribute("usrSstId"));
			
			if ("I".equals(action)) {
				// 상세코드 신규 저장
				evaluationMgtKYLService.insertEvaluation(paramMap);
				resultMsg = "SUCCESS";
			} else if("U".equals(action)) {
				// 상세코드 수정 저장
				evaluationMgtKYLService.updateEvaluation(paramMap);
				resultMsg = "UPDATE";
			} else if("D".equals(action)) {
				evaluationMgtKYLService.deleteEvaluation(paramMap); // 수정 service
				resultMsg = "DELETE";
				
				
			}else {
				
				resultMsg = "실패 / 알수 없는 요청 입니다.";
			}
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			
			resultMap.put("resultMsg", resultMsg);
			
			logger.info("+ End " + className + ".saveEvaluation");
			
			return resultMap;
		}
		
		
	
	
}
