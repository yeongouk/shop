package kr.kosmo.jobkorea.supportD.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.kosmo.jobkorea.login.service.LoginService;
import kr.kosmo.jobkorea.supportD.model.LecturePlanAtmtFilModel;
import kr.kosmo.jobkorea.supportD.model.LecturePlanModel;
import kr.kosmo.jobkorea.supportD.service.LecturePlanService;

/**
 * @author 이미혜
 * 작성일 2020.01.20
 * 강사리스트
 */


@Controller
@RequestMapping("/supportD/")
public class LecturePlanController {
	
	@Autowired
	LecturePlanService lecturePlanService;
	@Autowired
	LoginService loginService;
	
	// Root path for file upload
	@Value("${fileUpload.rootPath}")
	private String rootPath;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@RequestMapping("lecturePlan.do")
	public String lecturePlan(Model model,@RequestParam Map<String, Object> lectureMap, HttpServletRequest request,
			HttpServletResponse response,HttpSession session)throws Exception{
		
		logger.info("+ Start " + className + ".lecturePlan");
		
		model.addAttribute("loginId", session.getAttribute("loginId"));
		model.addAttribute("writer", session.getAttribute("userNm"));
		
				
		logger.info("+ End " + className + ".lecturePlan");
		return "supportD/LecturePlanList";
	}
	
	
	@RequestMapping("lecturePlanList.do")
	public String LecturePlanList(Model model,@RequestParam Map<String, Object> lectureMap, HttpServletRequest request,
			HttpServletResponse response,HttpSession session)throws Exception{
		
		logger.info("+ Start " + className + ".lecturePlanList");
		logger.info("받아온 값??????????????????"+lectureMap);
		int currentPage = Integer.parseInt((String)lectureMap.get("currentPage")); // 현재페이지 
		int pageSize = Integer.parseInt((String)lectureMap.get("pageSize"));
		int pageIndex = (currentPage -1)*pageSize;
		
		// 사이즈는 int형으로, index는 2개로 만들어서 -> 다시 파람으로 만들어서 보낸다.
		lectureMap.put("pageIndex", pageIndex);
		lectureMap.put("pageSize", pageSize);
		
		logger.info("lectureMap : "+lectureMap);
	
		List<LecturePlanModel> lecturePlanList=lecturePlanService.lectureList(lectureMap);
		int lCnt = lecturePlanService.lcnt(lectureMap);
		
		model.addAttribute("lecturePlanList",lecturePlanList);
		model.addAttribute("totalCnt",lCnt);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("currentPage",currentPage);
		       
			
		logger.info("+ End " + className + ".lecturePlanList");
		
		return "supportD/LecturePlanDetail";
	}
    
	
	@RequestMapping("Insertlecture.do")
	@ResponseBody
	public Map<String, String> lectureInsert(Model model, @RequestParam Map<String, Object> reqParam, RedirectAttributes rttr, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".Insertlecture");
		String resultMsg = "";
		String loginid = (String)session.getAttribute("loginId");
		reqParam.put("loginID", loginid);
		
		logger.info("reqParam : " + reqParam);
		lecturePlanService.insertLecture(reqParam, request);
		resultMsg = "INSERT";

		Map<String, String> resultMap = new HashMap<String, String>();
	    resultMap.put("resultMsg", resultMsg);
	    
		
	    logger.info("+ End " + className + ".Insertlecture");
		return resultMap;

	}
	
	@RequestMapping("selectOnelectureDetail.do")
	@ResponseBody
	public Map<String, Object> lectureInsert(Model model, @RequestParam String no, RedirectAttributes rttr, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		 logger.info("+ Start " + className + ".selectOnelectureDetail");
		String resultMsg = "";
		
		LecturePlanModel resultData = lecturePlanService.selectOneLectureDetail(no);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMsg="READ";
	    resultMap.put("resultData", resultData);
	    resultMap.put("resultMsg", resultMsg);
	    
		logger.info("+ End " + className + ".selectOnelectureDetail");
		return resultMap;

	}
	
	/**
	 * 첨부파일 다운로드
	 */
	
	@RequestMapping("downloadLecturePlanAtmtFil.do")
	public void downloadLecturePlanAtmtFil(Model model, @RequestParam Map<String, Object> reqParam, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".downloadLecturePlanAtmtFil");
		logger.info("   - paramMap : " + reqParam);
		
		// 첨부파일 조회
		LecturePlanAtmtFilModel lecturePlanAtmtFilModel = lecturePlanService.selectLecturePlanAtmtFil(reqParam);
		
		byte fileByte[] = FileUtils.readFileToByteArray(new File(rootPath+File.separator+lecturePlanAtmtFilModel.getAtmt_fil_psc_fil_nm()));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(lecturePlanAtmtFilModel.getAtmt_fil_lgc_fil_nm(),"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding","binary");
		response.getOutputStream().write(fileByte);
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
		logger.info("+ End " + className + ".downloadLecturePlanAtmtFil");
		
	}
	
	@RequestMapping("Updatelecture.do")
	@ResponseBody
	public Map<String, Object> lectureUpdate(Model model, @RequestParam Map<String, Object> reqParam,RedirectAttributes rttr, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".lectureUpdate");
		logger.info("reqParam" + reqParam);
		String resultMsg = "";
		String loginid = (String)session.getAttribute("loginId");
		reqParam.put("loginID", loginid);
		
		lecturePlanService.updateLecture(reqParam);
		resultMsg = "UPDATE";

		Map<String, Object> resultMap = new HashMap<String, Object>();
	    resultMap.put("resultMsg", resultMsg);
		
	    logger.info("+ End " + className + ".lectureUpdate");
		return resultMap;

	}
	
	@RequestMapping("UpdatelectureWithFile.do")
	@ResponseBody
	public Map<String, String> updatelectureWithFile(Model model, @RequestParam Map<String, Object> reqParam, RedirectAttributes rttr, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".updatelectureWithFile");
		String resultMsg = "";
		String loginid = (String)session.getAttribute("loginId");
		reqParam.put("loginID", loginid);
		
		logger.info("reqParam : " + reqParam);
		lecturePlanService.updateLectureWithFile(reqParam, request);
		resultMsg = "UPDATE";

		Map<String, String> resultMap = new HashMap<String, String>();
	    resultMap.put("resultMsg", resultMsg);
	    
		
	    logger.info("+ End " + className + ".updatelectureWithFile");
		return resultMap;

	}
	
}




















