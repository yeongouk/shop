package kr.kosmo.jobkorea.supportC.controller;

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

import kr.kosmo.jobkorea.supportC.model.NoticeCModel;
import kr.kosmo.jobkorea.supportC.service.NoticeCService;
import kr.kosmo.jobkorea.supportD.model.NoticeDModel;



@Controller
@RequestMapping("/supportC")
public class NoticeCController {
	
	@Autowired
	NoticeCService service;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@RequestMapping("/notice.do")
	public String notice(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		model.addAttribute("writer", session.getAttribute("loginId"));
		
		return "/supportC/noticeC";
	}
	
	@RequestMapping("/noticeList.do")
	public String noticeList(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
						
			// jsp페이지에서 넘어온 파람 값 정리 (페이징 처리를 위해 필요)
			int currentPage = Integer.parseInt((String)paramMap.get("currentPage")); // 현재페이지 
			int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));
			int pageIndex = (currentPage -1)*pageSize;
			
			// 사이즈는 int형으로, index는 2개로 만들어서 -> 다시 파람으로 만들어서 보낸다.
			paramMap.put("pageIndex", pageIndex);
			paramMap.put("pageSize", pageSize);
		
			// 서비스 호출
			List<NoticeCModel> noticeList = service.noticeList(paramMap);
			model.addAttribute("noticeList", noticeList);
			
			// 목록 숫자 추출하여 보내기 
			int totalCnt = service.noticeTotalCnt(paramMap);
			model.addAttribute("totalCnt", totalCnt);
			
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("currentPage",currentPage);
			
			//System.out.println("자 컨트롤러에서 값을 가지고 jsp로 갑니다~ : " + freeboardlist.size());			
			
		return "/supportC/noticeListC";	
	}
	
	/* 공지사항 상세 정보 뿌리기 */
	@RequestMapping("/detailNoticeList.do")
	@ResponseBody
	public Map<String,Object> detailNoticeList(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {		
		  
		String result="";
		
		// 선택된 게시판 1건 조회 
		NoticeCModel detailNoticeList = service.detailNoticeList(paramMap);
		//List<CommentsVO> comments = null;
		
		if(detailNoticeList != null) {
			
			result = "SUCCESS";  // 성공시 찍습니다. 
			
		}else {
			result = "FAIL / 불러오기에 실패했습니다.";  // null이면 실패입니다.
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", detailNoticeList); // 리턴 값 해쉬에 담기 
		resultMap.put("resultMsg", result); // success 용어 담기 		
		
		
		return resultMap;
	}
}
