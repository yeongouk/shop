package kr.kosmo.jobkorea.supportC.controller;

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

import kr.kosmo.jobkorea.supportC.model.LectureModel;
import kr.kosmo.jobkorea.supportC.service.LectureService;

@Controller
@RequestMapping("/supportC/")
public class LectureController {
	
	@Autowired
	LectureService lectureService;
	
	// Root path for file upload 
	@Value("${fileUpload.rootPath}")
	private String rootPath;
	

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	
	
	/**
	 * 공통코드 관리 초기화면
	 */
	@RequestMapping("lecture.do")
	public String initComnCod(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".initComnCod");
		logger.info("   - paramMap : " + paramMap);
		
		logger.info("+ End " + className + ".initComnCod");

		return "supportC/lecture";
	}
	
	
	
	
	/**
	 * 공통 그룹 코드 목록 조회
	 */
	@RequestMapping("listLecture.do")
	public String listLecture(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".listLecture");
		logger.info("   - paramMap : " + paramMap);
		
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;												// 페이지 시작 row 번호
				
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 공통 그룹코드 목록 조회
		List<Map<String, Object>> listLectureModel = lectureService.listLecture(paramMap);
		model.addAttribute("listLectureModel", listLectureModel);
		
		// 공통 그룹코드 목록 카운트 조회
		int totalCount = lectureService.countListLecture(paramMap);
		model.addAttribute("totalCntLecture", totalCount);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageLecture",currentPage);
		
		logger.info("+ End " + className + ".listLecture");

		return "/supportC/lectureList";
	}	
	
	
	@RequestMapping("selectsLecture.do")
	@ResponseBody
	public Map<String, Object> selectsLecture (Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		paramMap.put("loginID", session.getAttribute("loginId"));    
		
		logger.info("+ Start " + className + ".selectsLecture");
		logger.info("   - paramMap : " + paramMap);

		String result = "SUCCESS";
		String resultMsg = "조회 되었습니다.";
		
		// 강의 상세 단건 조회
		LectureModel LectureDtlModel = lectureService.selectsLecture(paramMap);
		
		// 강의 존재 여부 체크
		int checkLecture = lectureService.checkLecture(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("lectureDtlModel", LectureDtlModel);
		//resultMap.put("checkLecture", checkLecture);
		
		
		
		return resultMap;
	}
	
	@RequestMapping("lectureDtlinit.do")
	public String lectureDtlinit(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		paramMap.put("loginID", session.getAttribute("loginId"));   
		logger.info("+ Start " + className + ".lectureDtlinit");
		logger.info("   - paramMap : " + paramMap);
		
		lectureService.lectureDtlinit(paramMap);
		Map<String, Object> resultMap = new HashMap<String, Object>();

		return "/supportC/lectureList";
	}	
	
	@RequestMapping("lectureDtldele.do")
	public String lectureDtldele(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		paramMap.put("loginID", session.getAttribute("loginId"));   
		logger.info("+ Start " + className + ".lectureDtlinit");
		logger.info("   - paramMap : " + paramMap);
		
		lectureService.lectureDtldele(paramMap);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		return "/supportC/lectureList";
	}	
	
	/**
	 * 첨부파일 다운로드
	 */
	@RequestMapping("downloadLecturePlanDoc.do")
	public void downloadRoomAtmtFil(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
	
		// 첨부파일 조회
		LectureModel dto = lectureService.selectLecturePlan(paramMap);
		
		byte fileByte[] = FileUtils.readFileToByteArray(new File(rootPath+File.separator+dto.getFilepath()));
		
		System.out.println(dto.getFilename() + "겟파일네임");
		
		
		if(dto.getFilename() == "null") {
			
			System.out.println("널?");
			
			response.getOutputStream().flush();
			response.getOutputStream().close();
			
		} else {
			
			System.out.println("낫널?");
			response.setContentType("application/octet-stream");
			response.setContentLength(fileByte.length);
			response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(dto.getFilename(),"UTF-8")+"\";");
			response.setHeader("Content-Transfer-Encoding", "binary");
			response.getOutputStream().write(fileByte);
			
		}
		
		
	     
	    response.getOutputStream().flush();
	    response.getOutputStream().close();

		
	}	


}
