package kr.kosmo.jobkorea.order.controller;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import kr.kosmo.jobkorea.order.model.OrderModel;
import kr.kosmo.jobkorea.order.service.OrderService;
import kr.kosmo.jobkorea.system.model.ComnDtlCodModel;
import kr.kosmo.jobkorea.system.model.ComnGrpCodModel;
import kr.kosmo.jobkorea.system.service.ComnCodService;

@Controller
@RequestMapping("/order/")
public class OrderController {

	@Autowired
	OrderService orderService;

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();

	/**
	 * 주문 관리 초기화면
	 */
	@RequestMapping("menuOrder.do")
	public String initComnCod(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".initComnCod");
		logger.info("   - paramMap : " + paramMap);

		logger.info("+ End " + className + ".initComnCod");

		return "order/comncod";
	}

	/**
	 * 주문(상품) 목록 조회
	 */
	@RequestMapping("listComnGrpCod.do")
	public String OrderList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".OrderList");
		logger.info("   - paramMap : " + paramMap);

		int currentPage = Integer.parseInt((String) paramMap.get("currentPage")); // 현재 페이지 번호
		int pageSize = Integer.parseInt((String) paramMap.get("pageSize")); // 페이지 사이즈
		int pageIndex = (currentPage - 1) * pageSize; // 페이지 시작 row 번호

		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);

		// 공통 그룹코드 목록 조회
		List<OrderModel> listComnGrpCodModel = orderService.listComnGrpCod(paramMap);
		model.addAttribute("listComnGrpCodModel", listComnGrpCodModel);
		System.out.println(">>>>" + model);
		// 공통 그룹코드 목록 카운트 조회
		int totalCount = orderService.countListComnGrpCod(paramMap);
		model.addAttribute("totalCntComnGrpCod", totalCount);

		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageComnGrpCod", currentPage);

		logger.info("+ End " + className + ".OrederService");

		return "/order/comnGrpCodList";
	}

	
	/**
	 * 공통 상세 코드 목록 조회
	 */
	@RequestMapping("listComnDtlCod.do")
	public String listComnDtlCod(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		logger.info("+ Start " + className + ".listComnDtlCod");
		logger.info("   - paramMap : " + paramMap);

		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>111111" + paramMap);
		int currentPage = Integer.parseInt((String) paramMap.get("currentPage")); // 현재 페이지 번호
		int pageSize = Integer.parseInt((String) paramMap.get("pageSize")); // 페이지 사이즈
		int pageIndex = (currentPage - 1) * pageSize; // 페이지 시작 row 번호

		//paramMap.put("pageIndex", pageIndex);
		//paramMap.put("pageSize", pageSize);

		// 공통 상세코드 목록 조회
		List<OrderModel> listComnDtlCodModel = orderService.listComnDtlCod(paramMap);
		model.addAttribute("listComnDtlCodModel", listComnDtlCodModel);
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + model);
		// 공통 상세코드 목록 카운트 조회
		int totalCount = orderService.countListComnDtlCod(paramMap);
		model.addAttribute("totalCntComnDtlCod", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageComnDtlCod", currentPage);

		logger.info("+ End " + className + ".listComnDtlCod");

		return "/order/comnDtlCodList";
	}

	/**
	 *  장바구니 인설트
	 */
	@RequestMapping("saveComnDtlCod.do")
	@ResponseBody
	public Map<String, Object> saveComnDtlCod(Model model,@ModelAttribute OrderModel orderModel, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
	
	    int rowcnt = paramMap.size() / 3;
		
	    System.out.println(">>>>>>>>>>>>>>?????>>>>>>>>>>>>>>>>>>>>>>>>>>>. rowcnt "+rowcnt);
		
		logger.info("+ Start " + className + ".saveComnDtlCod");
		logger.info("   - paramMap : " + paramMap);

		
		String result = "SUCCESS";
		String resultMsg = "저장 되었습니다.";
		
		// 사용자 정보 설정
		//paramMap.put("fst_rgst_sst_id", session.getAttribute("usrSstId"));
		//paramMap.put("fnl_mdfr_sst_id", session.getAttribute("usrSstId"));
		
		//request.getParameter("param");
		
		for(int i = 0;i<rowcnt;i++) {
			String rno = "";
					
			Map parmMap = new HashMap();
			
			parmMap.put("food_id", rno);
			parmMap.put("loginId", session.getAttribute("loginId"));
			
			List<Map<String, Object>> list = orderService.insertComnDtlCod(paramMap);
		}
		
		
		
		//orderService.insertComnDtlOrd(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".saveComnDtlOrd");
		
		return resultMap;
	}

}
