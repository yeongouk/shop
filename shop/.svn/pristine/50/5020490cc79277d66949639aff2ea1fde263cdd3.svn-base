package kr.kosmo.jobkorea.commuD.controller;

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

import kr.kosmo.jobkorea.commuD.model.QnaDModel;
import kr.kosmo.jobkorea.commuD.service.QnaDService;




@Controller
@RequestMapping("/commuD/")
public class QnaDController {

	@Autowired
	QnaDService qnaService;

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();

	/* QnA -초기화면 */
	@RequestMapping("qna.do")
	public String initQnA(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".initQnA");
		logger.info("   - paramMap : " + paramMap);

		// 로그인해서 리스트를 먼저 뿌린다.
		model.addAttribute("writer", session.getAttribute("loginId"));

		// 작성 초기 단계에서 쓰려고 미리 뿌린다.
		// System.out.println("writer : " + session.getAttribute("loginId"));

		logger.info("+ End " + className + ".initQnA");

		return "commuD/qna";
	}

	/* QnA 리스트 뿌리기 */
	@RequestMapping("qnaList.do")
	public String qnaList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		// System.out.println("param에서 넘어온 값을 찍어봅시다.: " + paramMap);
		logger.info("+ Start " + className + ".qnaList");
		logger.info("   - paramMap : " + paramMap);

		// jsp페이지에서 넘어온 파람 값 정리 (페이징 처리를 위해 필요)
		int currentPage = Integer.parseInt((String) paramMap.get("currentPage")); // 현재페이지
		int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
		int pageIndex = (currentPage - 1) * pageSize;

		// 사이즈는 int형으로, index는 2개로 만들어서 -> 다시 파람으로 만들어서 보낸다.
		paramMap.put("pageIndex", pageIndex);
		paramMap.put("pageSize", pageSize);

		// 서비스 호출
		List<QnaDModel> qnaList = qnaService.qnaList(paramMap);
		model.addAttribute("qnaList", qnaList);
		//System.out.println("11111111111111111111111111111111111111111" + qnaList.toString());
		// 목록 숫자 추출하여 보내기
		
		int totalCnt = qnaService.qnaTotalCnt(paramMap);
		model.addAttribute("totalCnt", totalCnt);

		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPage", currentPage);

		// System.out.println("자 컨트롤러에서 값을 가지고 jsp로 갑니다~ : " + freeboardlist.size());
		logger.info("+ End " + className + ".qnaList");

		return "commuD/qnaList";
	}

	/* 상세 정보 뿌리기 */
	@RequestMapping("detailQnAlist.do")
	@ResponseBody
	public Map<String, Object> detailList(Model model, @RequestParam Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		// System.out.println("상세정보 보기를 위한 param에서 넘어온 값을 찍어봅시다.: " + paramMap);
		logger.info("+ Start " + className + ".detailList");
		logger.info("   - paramMap : " + paramMap);
		String result = "";

		// 선택된 게시판 1건 조회
		QnaDModel detailQnA = qnaService.detailQnAlist(paramMap);
		// List<CommentsVO> comments = null;

		if (detailQnA != null) {

			/*
			 * comments = qnaService.selectComments(paramMap); // 댓글 가지고오기 if(comments !=
			 * null) { System.out.println("댓글도 소환완료!"); }
			 */
			result = "SUCCESS"; // 성공시 찍습니다.

		} else {
			result = "FAIL / 불러오기에 실패했습니다."; // null이면 실패입니다.
		}

		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", detailQnA); // 리턴 값 해쉬에 담기
		// resultMap.put("resultComments", comments);
		resultMap.put("resultMsg", result); // success 용어 담기

		System.out.println("결과 글 !!!! " + result);
		System.out.println("결과 글 !!!! " + detailQnA);

		logger.info("+ End " + className + ".detailList");

		return resultMap;
	}
	
	

	/* qna 저장하기 */
	@RequestMapping("qnaSave.do")
	@ResponseBody
	public  Map<String,Object> savaList(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".savaList");
		logger.info("   - paramMap : " + paramMap);
		
		String action = (String)paramMap.get("action"); // 구분하는 키값 
		System.out.println("action 값 찍어보기 : " + action);
		
		String resultMsg = "";
		//String id = (String) session.getAttribute("loginID"); // 아이디 
		//paramMap.put("writer", id); // session을 통해 아이디 가져옴 
		

		if("I".equals(action)) {
			qnaService.insertQnA(paramMap); // 저장 service
			
			resultMsg = "SUCCESS";
			
		}else if("U".equals(action)) {
			qnaService.updateQnA(paramMap); // 수정 service
			resultMsg = "UPDATE";
			
		}else if("D".equals(action)) {
			qnaService.deleteQnA(paramMap); // 삭제 service
			resultMsg = "DELETE";
			
		}else if("R".equals(action)) {
			qnaService.replyQnA(paramMap); // 답글 service
			qnaService.replyIncrement(paramMap);
			resultMsg = "REPLY";
			
		}else {
			resultMsg ="FALSE / 등록에 실패했습니다.";
		}
		
		logger.info("+ End " + className + ".savaList");
		
		// 결과 값 전송
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("resultMsg", resultMsg);
		
		return resultMap;
		
	}
	
	

	      
}
