package kr.kosmo.jobkorea.pc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
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

import kr.kosmo.jobkorea.common.comnUtils.ComnCodUtil;
import kr.kosmo.jobkorea.pc.model.ProductModel;
import kr.kosmo.jobkorea.pc.service.ProductService;
import kr.kosmo.jobkorea.system.model.ComnCodUtilModel;
import kr.kosmo.jobkorea.system.model.ComnDtlCodModel;
import kr.kosmo.jobkorea.system.model.ComnGrpCodModel;
import kr.kosmo.jobkorea.system.service.ComnCodService;

@Controller
@RequestMapping("/pc/")
public class ProdutController {
	
	@Autowired
	ProductService productService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	
	
	/**
	 * 상품 관리 초기화면
	 */
	@RequestMapping("product.do")
	public String initProduct(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".initProduct");
		logger.info("   - paramMap : " + paramMap);
		
		logger.info("+ End " + className + ".initProduct");

		return "pc/product";
	}
	
	
	/**
	 * 상품 목록 조회
	 */
	@RequestMapping("listProduct.do")
	public String listProduct(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listProduct");
		logger.info("   - paramMap : " + paramMap);
		
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;			// 페이지 시작 row 번호
				
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 상품 목록 조회
		List<ProductModel> listProductModel = productService.listProduct(paramMap);
		model.addAttribute("listProductModel", listProductModel);
		
		
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+listProductModel);
		
		logger.info("   - sdsdsdsdsdsdsdsdsd : " + listProductModel);
		
		
		// 상품 목록 카운트 조회
		int totalCount = productService.countListProductModel(paramMap);
		model.addAttribute("totalCntProduct", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageProduct",currentPage);
		
		logger.info("+ End " + className + ".listProduct");

		return "/pc/productlist";
	}
	
	/**
	 *  상품 단건 조회
	 */
	@RequestMapping("selectProduct.do")
	@ResponseBody
	public Map<String, Object> selectProduct (Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".selectProduct");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "조회 되었습니다.";
		
		// 상품 단건 조회
		ProductModel productModel = productService.selectProduct(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("productModel", productModel);
		
		logger.info("+ End " + className + ".selectProduct");
		
		return resultMap;	
	}

	/**
	 *  공통 그룹 코드 저장
	 */
	@RequestMapping("saveProduct.do")
	@ResponseBody
	public Map<String, Object> saveProduct(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".saveProduct");
		logger.info("   - paramMap : " + paramMap);
		
		String action = (String)paramMap.get("action");
		String result = "SUCCESS";
		String resultMsg = "저장 되었습니다.";
		
		/*
		 * // 사용자 정보 설정 paramMap.put("fst_rgst_sst_id",
		 * session.getAttribute("usrSstId")); paramMap.put("fnl_mdfr_sst_id",
		 * session.getAttribute("usrSstId"));
		 */
		if ("I".equals(action)) {
			// 그룹코드 신규 저장
			productService.insertProduct(paramMap);
		} else if("U".equals(action)) {
			// 그룹코드 수정 저장
			productService.updateProduct(paramMap);
		} else {
			result = "FALSE";
			resultMsg = "알수 없는 요청 입니다.";
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".saveProduct");
		
		return resultMap;
	}
	
		
	/**
	 *  그룹코드 삭제
	 */
	@RequestMapping("deleteProduct.do")
	@ResponseBody
	public Map<String, Object> deleteProduct(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".deleteProduct");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "삭제 되었습니다.";
		
		// 그룹코드 삭제
		productService.deleteProduct(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".deleteProduct");
		
		return resultMap;
	}
	
	


}
