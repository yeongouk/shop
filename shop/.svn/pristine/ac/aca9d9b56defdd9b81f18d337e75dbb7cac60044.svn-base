package kr.kosmo.jobkorea.careerA.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kosmo.jobkorea.careerA.model.ResumeModel;
import kr.kosmo.jobkorea.careerA.service.ResumeService;
import kr.kosmo.jobkorea.supportD.model.NoticeDModel;

@Controller
@RequestMapping("/careerA/")
public class ResumeController {

	@Autowired
	ResumeService resumeService; 
	
	@RequestMapping("resumeMgt.do")
	public String resumeMgt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		return "/careerA/resumeMgt";
	}
	
	//목록 조회
	@RequestMapping("resumeMgtList.do")
	public String lectureClassList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage")); // 현재페이지 
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));
		int pageIndex = (currentPage -1)*pageSize;
		
		// 사이즈는 int형으로, index는 2개로 만들어서 -> 다시 파람으로 만들어서 보낸다.
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 목록 조회 서비스 호출
		List<ResumeModel> lectureClassList = resumeService.lectureClassList(paramMap);
		model.addAttribute("lectureClassList", lectureClassList);
		
		// 목록 조회시 카운트 서비스 호출
		int totalCount = resumeService.lectureClassListCnt(paramMap);
		model.addAttribute("totalCnt", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPage", currentPage);
		
		return "careerA/resumeMgtList";
	}
	
	//상세 조회
	@RequestMapping("resumeMgtDtl.do")
	public String lectureClassListDtl(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception{
		
		int currentPage = Integer.parseInt((String)paramMap.get("currentPage")); // 현재페이지 
		int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));
		int pageIndex = (currentPage -1)*pageSize;
		
		// 사이즈는 int형으로, index는 2개로 만들어서 -> 다시 파람으로 만들어서 보낸다.
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);
		
		// 목록 조회 서비스 호출
		List<ResumeModel> lectureClassListDtl = resumeService.lectureClassListDtl(paramMap);
		model.addAttribute("lectureClassListDtl", lectureClassListDtl);
		
		// 목록 조회시 카운트 서비스 호출
		int totalCount = resumeService.lectureClassListDtlCnt(paramMap);
		model.addAttribute("totalCnt", totalCount);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPage", currentPage);
		
		return "careerA/resumeMgtDtl";
	}
	
	/* 모달 팝업 이력서 정보 뿌리기 */
	@RequestMapping("detailResumeList.do")
	@ResponseBody
	public Map<String,Object> detailList(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		String result="";
		
		// 선택된 게시판 1건 조회 
		ResumeModel detailResume = resumeService.detailResume(paramMap);
		
		if(detailResume != null) {
			
			result = "SUCCESS";  // 성공시 찍습니다. 
			
		}else {
			result = "FAIL / 불러오기에 실패했습니다.";  // null이면 실패입니다.
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", detailResume); // 리턴 값 해쉬에 담기 
		resultMap.put("resultMsg", result); // success 용어 담기 
		// 목록 조회 서비스 호출
		List<ResumeModel> ResumeList = resumeService.ResumeList(paramMap);
		model.addAttribute("ResumeList", ResumeList);
		
		System.out.println("결과 글 찍어봅세 " + result);
		System.out.println("결과 글 찍어봅세 " + detailResume);
		
		return resultMap;
	}
}
