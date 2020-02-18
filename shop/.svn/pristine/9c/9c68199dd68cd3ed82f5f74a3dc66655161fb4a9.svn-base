package kr.kosmo.jobkorea.peopleA.controller;

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

import kr.kosmo.jobkorea.peopleA.model.TeacherJYOModel;
import kr.kosmo.jobkorea.peopleA.service.TeacherJYOService;

@Controller
@RequestMapping("/peopleA/")
public class TeacherListJYOController {
	
	@Autowired
	TeacherJYOService teacherService;

	//로그찍는용
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	//로그분별용
    private final String className = this.getClass().toString();
    
    
	
	/** 강사관리 초기화면  */
	@RequestMapping("professorMgt.do")
	public String initTeacher(Model model, @RequestParam Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception{
		
		//로그인해서 리스트를 뿌린다.
		model.addAttribute("writer", session.getAttribute("loginID"));
		
		logger.info("+ Start" + className +".initTeacher");
		logger.info("  - paramMap : " + paramMap);
        logger.info("+ End " + className +".initTeacher");		
		
		return "peopleA/teacherJYO";	
	}//initTeacher
	
	
	/** 강사관리 목록 조회  */
	@RequestMapping("teacherList.do")
	public String teacherList(Model model, @RequestParam Map<String,Object> paramMap,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception{
		
       logger.info("+ Start +" + className + ".teacherList");
	   logger.info(" - paramMap : " + paramMap);
	   
	   int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));//현재 페이지 번호
	   int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));//페이지 사이즈
	   int pageIndex = (currentPage-1)*pageSize;//페이지 시작 row 번호
	   
	   // 사이즈는 int형으로, index는 2개로 만들어서 -> 다시 파람으로 만들어서 보낸다.
	   paramMap.put("pageIndex", pageIndex);
	   paramMap.put("pageSize", pageSize);
	   
	   //강사관리 목록 조회
	   List<TeacherJYOModel> teacherListModel = teacherService.teacherList(paramMap);
	   model.addAttribute("teacherListModel", teacherListModel);
	   System.out.println("시스템 호출:"+paramMap+model);
	   
	   //목록숫자 추출하여 보내기
	   int totalCnt = teacherService.teacherTotalCnt(paramMap);
	   model.addAttribute("totalCnt",totalCnt);
	   model.addAttribute("pageSize", pageSize);
	   model.addAttribute("currentPageTeacher",currentPage);
	   
	   logger.info("+ End +" + className + ".teacherList");
	   
		
	   return "/peopleA/teacherJYOList";
	}//teacherList
	
	/** 강사관리 단건 조회  */
	@RequestMapping("selectTeacher.do")
	@ResponseBody
	public Map<String, Object> selectTeacher (Model model, @RequestParam Map<String,Object> paramMap,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception{
		
		logger.info("+ Start" +className+ ".selectTeacher");
		logger.info(" - paramMap : " + paramMap);
		
		String result = "SUCCESS";
		String resultMsg = "조회 되었습니다";
		
		//강사관리 단건 조회-teacherJYO와 연결
		TeacherJYOModel teacherJYOModel = teacherService.selectTeacher(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("teacherJYOModel", teacherJYOModel);
		
		logger.info("+ End " + className + ".selectTeacher");
		
		return resultMap;
		
	}//selectTeacher
	
	/** 강사관리 저장  */
	@RequestMapping("saveTeacher.do")
	@ResponseBody
	public Map<String, Object> teacherStudent(Model model, @RequestParam Map<String, Object> paramMap, 
			HttpServletRequest request,HttpServletResponse response, 
			HttpSession session) throws Exception{
		
		logger.info("+ Start " + className + ".teacherStudent");
		logger.info("   - paramMap : " + paramMap);
		
		String action = (String)paramMap.get("action");
		String result = "SUCCESS";
		String resultMsg = "저장 되었습니다.";
		
		//사용자 정보 설정
		//paramMap.put("loginID", session.getAttribute("loginID"));
		//paramMap.put("loginID", session.getAttribute("loginID"));
		
		paramMap.put("usertype", "D");
		
		if ("I".equals(action)) {
			// 그룹코드 신규 저장
			teacherService.insertTeacher(paramMap);
		} else if("U".equals(action)) {
			// 그룹코드 수정 저장
			teacherService.updateTeacher(paramMap);
		} else {
			result = "FALSE";
			resultMsg = "알수 없는 요청 입니다.";
		}
		
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".teacherStudent");
		
		return resultMap;
	}
	
	/** 강사관리 삭제  */
	@RequestMapping("deleteTeacher.do")
	@ResponseBody
	public Map<String, Object> deleteTeacher(Model model, @RequestParam Map<String, Object> paramMap, 
			HttpServletRequest request,HttpServletResponse response, 
			HttpSession session) throws Exception{
		
		logger.info("+ Start " + className + ".deleteTeacher");
		logger.info("   - paramMap : " + paramMap);
		
		String result = "SUCCESS";
		String resultMsg = "삭제 되었습니다.";
		
		//강사관리 삭제
		teacherService.deleteTeacher(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".deleteTeacher");
		
		return resultMap;
	}
	
	
	
	
}//TeacherListJYOController
