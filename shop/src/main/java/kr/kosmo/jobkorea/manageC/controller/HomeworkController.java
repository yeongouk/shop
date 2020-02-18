package kr.kosmo.jobkorea.manageC.controller;

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

import kr.kosmo.jobkorea.manageC.model.HomeworkModel;
import kr.kosmo.jobkorea.manageC.service.HomeworkService;

@Controller
@RequestMapping("/manageC")

public class HomeworkController {

	@Autowired
	HomeworkService service;
	
	@Value("${fileUpload.rootPath}")
	private String rootPath;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	
	@RequestMapping("/homework.do")
	public String homework(Model model, @RequestParam Map<String, Object> map, HttpServletRequest request,
		HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".homework");
		logger.info("   - map : " + map);
		
		model.addAttribute("loginId", session.getAttribute("loginId"));		
		model.addAttribute("name1", session.getAttribute("userNm"));
		
		map.put("loginId1", session.getAttribute("loginId").toString());
		
		logger.info("   - model : " + model);
		
		logger.info("+ End " + className + ".homework");
		  
		return "/manageC/homework";
	}
	
	@RequestMapping("/selectHomeworkList.do")
	public String selectHomeworkList(Model model, @RequestParam Map<String, Object> map, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".selectHomeworkList");
		logger.info("   - map : " + map);
		
		map.put("loginId1", session.getAttribute("loginId").toString());
		
		int currentPage = Integer.parseInt((String)map.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)map.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;
		
		map.put("pageIndex", pageIndex);
		map.put("pageSize", pageSize);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPage", currentPage);
		
		List<HomeworkModel> list = service.SelectHomeworkList(map);
		model.addAttribute("SelectHomeworkList", list);
		
		int totalCount = service.countHomeworklist(map);
		model.addAttribute("totalCnt", totalCount);
		
		logger.info("+ End " + className + ".selectHomeworkList");
		
		return "/manageC/homeworkList";
	}
	
	
	@RequestMapping("/selectHomework.do")
	@ResponseBody
	public Map<String, Object> selectHomework(Model model, @RequestParam Map<String, Object> map, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".selectHomework");
		logger.info("   - map : " + map);
		
		String result="";
		
		HomeworkModel selectHomeworkDtl = service.selectHomeworkDtl(map);
		
        if(selectHomeworkDtl != null) {
			
			result = "SUCCESS";  // 성공시 찍습니다. 
			
		}else {
			result = "FAIL / 불러오기에 실패했습니다.";  // null이면 실패입니다.
		}
		
				
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", selectHomeworkDtl);
		resultMap.put("resultMsg", result);
		
		System.out.println("결과 글 찍어봅세 " + result);
		System.out.println("결과 글 찍어봅세 " + selectHomeworkDtl);  //dto
		
		
		logger.info("+ End " + className + ".selectHomework");

		return resultMap;
	}
	
	
	
	
	
	/* 자료제출 등록하기 */
	@RequestMapping("homeworkSave.do")
	@ResponseBody
	public  Map<String,Object> savaList(Model model, @RequestParam Map<String,Object> map, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".savaList");
		logger.info("   - map : " + map);
		
		String action = (String)map.get("action"); // 구분하는 키값 
		System.out.println("action 값 찍어보기 : " + action);
		
		//map.put("loginId", session.getAttribute("loginId").toString());
		//map.put("name", session.getAttribute("loginId").toString());
		
		//String id = (String) session.getAttribute("loginID"); // 아이디 
		//paramMap.put("writer", id); // session을 통해 아이디 가져옴 

		
		String resultMsg = "";
		
		// insert 인지, update 수정인지 확인하기 
		if("I".equals(action)) {
			service.inserHomework(map); // 저장 service
			
			resultMsg = "SUCCESS";
			
		}else if("U".equals(action)) {
			service.updateHomework(map); // 수정 service
			resultMsg = "UPDATE";
			
		}else if("D".equals(action)) {
			service.deleteHomework(map); // 수정 service
			resultMsg = "DELETE";
			
		}else {
			resultMsg ="FALSE / 등록에 실패했습니다.";
		}
		
		logger.info("+ End " + className + ".savaList");
		
		// 결과 값 전송
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("resultMsg", resultMsg);
		
		return resultMap;
		
		
	}
	
	

	
	//파일 업로드
	@RequestMapping("/HomeworkReg.do")
	public void HomeworkReg(Model model, @RequestParam Map<String, String> map, HttpSession session, HttpServletRequest request) throws Exception {
		
		System.out.println("RoomReg !!!!!!!!!!!!!!!!!!!!!!!!!!");
		
		map.put("loginId", session.getAttribute("loginId").toString());
		map.put("name", session.getAttribute("loginId").toString());
		
		service.HomeworkReg(map,request);
	}
	
	@RequestMapping("/downloadHomeAtmtFil.do")
	public void downloadHomeAtmtFil(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
		HttpServletResponse response, HttpSession session) throws Exception {
	
		HomeworkModel dto = service.selectHomeworkDtl(paramMap);
		
		byte fileByte[] = FileUtils.readFileToByteArray(new File(rootPath+File.separator+dto.getFilepath()));
		
		response.setContentType("application/octet-stream");
	    response.setContentLength(fileByte.length);
	    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(dto.getFilename(),"UTF-8")+"\";");
	    response.setHeader("Content-Transfer-Encoding", "binary");
	    response.getOutputStream().write(fileByte);
	     
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
	}
	
	@RequestMapping("/HomeworkUpdate.do")
	public void HomeworkUpdate(Model model, @RequestParam Map<String, String> map, HttpSession session, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		map.put("loginId", session.getAttribute("loginId").toString());
		
		service.HomeworkUpdate(map, request);
		
	}
}
