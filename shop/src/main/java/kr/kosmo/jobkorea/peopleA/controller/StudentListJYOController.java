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

import kr.kosmo.jobkorea.peopleA.model.StudentJYOModel;
import kr.kosmo.jobkorea.peopleA.service.StudentJYOService;

@Controller
@RequestMapping("/peopleA/")
public class StudentListJYOController {
	
	@Autowired
	StudentJYOService studentService;

	//로그찍는용
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	//로그분별용
    private final String className = this.getClass().toString();
    
    
	
	/** 학생관리 초기화면  */
	@RequestMapping("studentMgt.do")
	public String initStudent(Model model, @RequestParam Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception{
		
		//로그인해서 리스트를 뿌린다.
		model.addAttribute("writer", session.getAttribute("loginID"));
		
		logger.info("+ Start" + className +".initStudent");
		logger.info("  - paramMap : " + paramMap);
        logger.info("+ End " + className +".initStudent");		
		
		return "peopleA/studentJYO";	
	}//initStudent
	
	
	/** 학생관리 목록 조회  */
	@RequestMapping("studentList.do")
	public String studentList(Model model, @RequestParam Map<String,Object> paramMap,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception{
		
       logger.info("+ Start +" + className + ".studentList");
	   logger.info(" - paramMap : " + paramMap);
	   
	   int currentPage = Integer.parseInt((String)paramMap.get("currentPage"));//현재 페이지 번호
	   int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));//페이지 사이즈
	   int pageIndex = (currentPage-1)*pageSize;//페이지 시작 row 번호
	   
	   // 사이즈는 int형으로, index는 2개로 만들어서 -> 다시 파람으로 만들어서 보낸다.
	   paramMap.put("pageIndex", pageIndex);
	   paramMap.put("pageSize", pageSize);
	   
	   //학생관리 목록 조회
	   List<StudentJYOModel> studentListModel = studentService.studentList(paramMap);
	   model.addAttribute("studentListModel", studentListModel);
	   System.out.println("시스템 호출:"+paramMap+model);
	   
	   //목록숫자 추출하여 보내기
	   int totalCnt = studentService.studentTotalCnt(paramMap);
	   model.addAttribute("totalCnt",totalCnt);
	   model.addAttribute("pageSize", pageSize);
	   model.addAttribute("currentPageStudent",currentPage);
	   
	   logger.info("+ End +" + className + ".studentList");
	   
		
	   return "/peopleA/studentJYOList";
	}//studentList
	
	/** 학생관리 단건 조회  */
	@RequestMapping("selectStudent.do")
	@ResponseBody
	public Map<String, Object> selectStudent (Model model, @RequestParam Map<String,Object> paramMap,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception{
		
		logger.info("+ Start" +className+ ".selectStudent");
		logger.info(" - paramMap : " + paramMap);
		
		String result = "SUCCESS";
		String resultMsg = "조회 되었습니다";
		
		//학생관리 단건 조회-studentJYO와 연결
		StudentJYOModel studentJYOModel = studentService.selectStudent(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("studentJYOModel", studentJYOModel);
		
		logger.info("+ End " + className + ".selectStudent");
		
		return resultMap;
		
	}//selectStudent
	
	/** 학생관리 저장  */
	@RequestMapping("saveStudent.do")
	@ResponseBody
	public Map<String, Object> saveStudent(Model model, @RequestParam Map<String, Object> paramMap, 
			HttpServletRequest request,HttpServletResponse response, 
			HttpSession session) throws Exception{
		
		logger.info("+ Start " + className + ".saveStudent");
		logger.info("   - paramMap : " + paramMap);
		
		String action = (String)paramMap.get("action");
		String result = "SUCCESS";
		String resultMsg = "저장 되었습니다.";
		
		//사용자 정보 설정
		//paramMap.put("loginID", session.getAttribute("loginID"));
		//paramMap.put("loginID", session.getAttribute("loginID"));
		
		paramMap.put("usertype", "C");
		
		if ("I".equals(action)) {
			// 그룹코드 신규 저장
			studentService.insertStudent(paramMap);
		} else if("U".equals(action)) {
			// 그룹코드 수정 저장
			studentService.updateStudent(paramMap);
		} else {
			result = "FALSE";
			resultMsg = "알수 없는 요청 입니다.";
		}
		
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".saveStudent");
		
		return resultMap;
	}
	
	/** 학생관리 삭제  */
	@RequestMapping("deleteStudent.do")
	@ResponseBody
	public Map<String, Object> deleteStudent(Model model, @RequestParam Map<String, Object> paramMap, 
			HttpServletRequest request,HttpServletResponse response, 
			HttpSession session) throws Exception{
		
		logger.info("+ Start " + className + ".deleteStudent");
		logger.info("   - paramMap : " + paramMap);
		
		String result = "SUCCESS";
		String resultMsg = "삭제 되었습니다.";
		
		//학생관리 삭제
		studentService.deleteStudent(paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		
		logger.info("+ End " + className + ".deleteStudent");
		
		return resultMap;
	}
	
		
	
}//StudentListJYOController
