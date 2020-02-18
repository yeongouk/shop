package kr.kosmo.jobkorea.system.controller;

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

import kr.kosmo.jobkorea.system.model.PaymentModel;

import kr.kosmo.jobkorea.system.model.PcCurrentModel;
import kr.kosmo.jobkorea.system.model.UserMgrModel;
import kr.kosmo.jobkorea.system.service.PcCurrentService;

@Controller
@RequestMapping("/system/")
public class PcCurrentController {
	
	@Autowired
	PcCurrentService pcCurrentService;
	
	    // Set logger
		private final Logger logger = LogManager.getLogger(this.getClass());

		// Get class name for logger
		private final String className = this.getClass().toString();
		
		

		/**
		 * pc 현황 초기화면
		 */
		@RequestMapping("pcCurrent.do")
		public String initPcCurrent(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			
			logger.info(" Start " + className + ".initPcCurrent");
			logger.info(" paramMap : " + paramMap);
			logger.info(" End " + className + ".initPcCurrent");

			return "system/pcCurrent";
		}
		
		
		/**
		 * pc 현황 목록 조회
		 */
		@RequestMapping("pcCurrentList.do")
		public String pcCurrentList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
		
			logger.info(" Start " + className + ".pcCurrentList");
			logger.info(" paramMap : " + paramMap);
			
			int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
			int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
			int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
					
			paramMap.put("pageIndex", pageIndex);
			paramMap.put("pageSize", pageSize);
			
			// pc 현황 목록 조회
			List<PcCurrentModel> pcCurrentListModel = pcCurrentService.pcCurrentList(paramMap);
			model.addAttribute("pcCurrentListModel", pcCurrentListModel);
			
			int totalCount = pcCurrentService.countListPcCurrent(paramMap);
			model.addAttribute("totalCnt", totalCount);

			model.addAttribute("pageSize", pageSize);
			model.addAttribute("currentPage",currentPage);
			
			logger.info(" End " + className + ".pcCurrentList");

			return "system/pcCurrentList";
		}	
		
		
		//배정 사용자 검색
				@RequestMapping("searchUserList.do")
				@ResponseBody
				public Map<String, Object>  searchUserList(Model model, @RequestParam Map<String, Object> paramMap,
						HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
					
					logger.info("+ Start " + className + ".searchUserList");
					logger.info("   - paramMap : " + paramMap.toString());
					
					
					int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
					int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
					int pageIndex = (currentPage-1)*pageSize;									// 페이지 시작 row 번호
						
					int pc_no = Integer.parseInt((String)paramMap.get("pc_no"));  
					
					paramMap.put("pageIndex", pageIndex);
					paramMap.put("pageSize", pageSize);
					
					// 사용자 목록 조회 수정하기 모델
					List<UserMgrModel> searchUserList = pcCurrentService.searchUserList(paramMap);
					
					logger.info(searchUserList);
					//model.addAttribute("searchUserList", searchUserList);
				
					System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+model);
					logger.info( searchUserList.size());
					logger.info("   - paramMap : " + paramMap);
					
					// 사용자 목록 카운트 조회
					int totalCount = pcCurrentService.countUserList(paramMap);
					model.addAttribute("totalCnt", totalCount);
					
					model.addAttribute("pageSize", pageSize);
					model.addAttribute("currentPage",currentPage);
					
					 Map<String, Object> resultMap = new HashMap<String, Object>();
					 resultMap.put("searchUserList", searchUserList);
					 resultMap.put("pc_no", pc_no);
					 resultMap.put("pageSize", pageSize);
					 resultMap.put("currentPage", currentPage);
					 resultMap.put("pageIndex", pageIndex);
					 resultMap.put("totalCnt", totalCount);
					
					logger.info("+ End " + className + ".searchUserList");

					return resultMap;
				}	
				
				
				/**
				 * pc 자리 배정 저장
				 */
				@RequestMapping("savePcCurrent.do")
				@ResponseBody
				public Map<String, Object> savePcCurrent(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
						HttpServletResponse response, HttpSession session) throws Exception {
					
					logger.info("+ Start " + className + ".savePcCurrent");
					logger.info("   - paramMap : " + paramMap);
					
				/*
				 * String action = (String)paramMap.get("action"); String result = "SUCCESS";
				 * String resultMsg = "저장 되었습니다.";
				 * 
				 * // 사용자 정보 설정 paramMap.put("fst_rgst_sst_id",
				 * session.getAttribute("usrSstId")); paramMap.put("fnl_mdfr_sst_id",
				 * session.getAttribute("usrSstId"));
				 * 
				 * if ("I".equals(action)) { // 자리 배정 저장
				 * pcCurrentService.insertPcCurrent(paramMap);
				 * 
				 * } else { result = "FALSE"; resultMsg = "이미 배정 된 자리입니다."; }
				 */
					//paramMap.put("loginId", (String) session.getAttribute("loginID"));
					Integer.parseInt((String)paramMap.get("pc_no"));   
					
					pcCurrentService.InsertSeat(paramMap);
					
					pcCurrentService.InsertOrder(paramMap);
					
					
					Map<String, Object> resultMap = new HashMap<String, Object>();
					resultMap.put("loginID", "loginID");
					//resultMap.put("resultMsg", resultMsg);
					
					logger.info("+ End " + className + ".savePcCurrent");
					
					return resultMap;
				}
				
		
		
		/**
		 * 결제 정보 가져오기
		 */
		@RequestMapping("userAmt.do")
		@ResponseBody
		public Map<String, Object> userAmt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			
			logger.info("+ Start " + className + ".userAmt");
			logger.info("   - paramMap : " + paramMap);
			
			List<PaymentModel> userAmt = pcCurrentService.userAmt(paramMap);

			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			int pc_no = Integer.parseInt((String)paramMap.get("pc_no"));   
			 
			model.addAttribute("paymentresult", userAmt);
			resultMap.put("paymentresult", userAmt);
			resultMap.put("pc_no", pc_no);

			//List<PcSeatInfoModel> listPc = pcseatinfoservice.listpc(paramMap);
			
		//	model.addAttribute("userPayment", listPc);
			model.addAttribute("userPayment", userAmt);
			
			System.out.println(userAmt);

			logger.info("+ End " + className + ".userAmt");
			
			return resultMap;
			
			//return "system/userAmt";
		}
		
		/**
		 *  결제 정보 저장
		 */
		@RequestMapping("userPayment.do")
		@ResponseBody
		public void userPayment(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			
			logger.info("+ Start " + className + ".userPayment");
			logger.info("   - paramMap : " + paramMap);
			
			pcCurrentService.userPayment(paramMap);
			
			//List<PcSeatInfoModel> listPc = pcseatinfoservice.listpc(paramMap);
			
			//	model.addAttribute("userPayment", listPc);

			
		/*
		 * String action = (String)paramMap.get("action"); String result = "SUCCESS";
		 * String resultMsg = "저장 되었습니다.";
		 * 
		 * // 사용자 정보 설정 paramMap.put("fst_rgst_sst_id",
		 * session.getAttribute("usrSstId")); paramMap.put("fnl_mdfr_sst_id",
		 * session.getAttribute("usrSstId"));
		 * 
		 * if (true) { // 그룹코드 신규 저장 pcCurrentService.insertAmt(paramMap); } else {
		 * result = "FALSE"; resultMsg = "알수 없는 요청 입니다."; }
		 * 
		 * Map<String, Object> resultMap = new HashMap<String, Object>();
		 * resultMap.put("result", result); resultMap.put("resultMsg", resultMsg);
		 */
			
			logger.info("+ End " + className + ".userPayment");
			
			
			return;
			//return "system/pcCurrent";
		}
		

		
	
			

		
}
