package kr.kosmo.jobkorea.manageC.controller;

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

import kr.kosmo.jobkorea.manageC.model.QnACommentLJKKModel;
import kr.kosmo.jobkorea.manageC.model.QnALJKModel;
import kr.kosmo.jobkorea.manageC.service.QnALJKService;


@Controller
@RequestMapping("/manageC/")
public class QnALJKController {

	@Autowired
	QnALJKService qnAService;

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

		return "manageC/qnaLJK";
	}

	/* QnA 리스트 뿌리기 */
	@RequestMapping("qnaLJKList.do")
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
		List<QnALJKModel> qnaList = qnAService.qnaList(paramMap);
		
		int Cnt = qnaList.get(0).getWno();
		
		System.out.println();
		
		model.addAttribute("qnaList", qnaList);
		// 목록 숫자 추출하여 보내기
		int totalCnt = qnAService.qnaTotalCnt(paramMap);
		model.addAttribute("totalCnt", totalCnt);

		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPage", currentPage);

		// System.out.println("자 컨트롤러에서 값을 가지고 jsp로 갑니다~ : " + freeboardlist.size());
		logger.info("+ End " + className + ".qnaList");

		return "manageC/qnaLJKList";
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
		QnALJKModel detailQnA = qnAService.detailQnAlist(paramMap);
		// List<CommentsVO> comments = null;
		
		
		
		List<QnACommentLJKKModel> commentList = qnAService.commentList(paramMap);

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
		
		resultMap.put("commentList", commentList);
		
		//model.addAttribute("commentList1", commentList);

		System.out.println("결과 글 !!!! " + result);
		System.out.println("결과 글 !!!! " + detailQnA);

		logger.info("+ End " + className + ".detailList");

		return resultMap;
	}

	 // QnA 게시글 등록하기
	  
	  @RequestMapping("qnaLJKSave.do")
	  @ResponseBody
	  public Map<String,Object> savaList(Model model, @RequestParam
	  Map<String,Object> paramMap, HttpServletRequest request, HttpServletResponse
	  response, HttpSession session) throws Exception {
	  
	  System.out.println(paramMap+ "파람값ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ");
	  
	  String action = (String)paramMap.get("action"); // 구분하는 키값
	  System.out.println("action 값 찍어보기 : " + action);
	  
	  
	  String resultMsg = "";
	  
	  
		  // insert 인지, update 수정인지 확인하기 
		  if("I".equals(action)) {
			  System.out.println("action 값 찍어보기 : " + action);
			  resultMsg = "INSERT";
			  qnAService.insertQnA(paramMap);
		  
		  }else if("U".equals(action)) {
			  System.out.println("action 값 찍어보기 : " + action);
			  resultMsg = "UPDATE";
			  qnAService.updateQnA(paramMap);
		  
		  }else if("D".equals(action)) { 
			  System.out.println("action 값 찍어보기 : " + action);
			  resultMsg = "DELETE";
			  qnAService.deleteQnA(paramMap);
		  
		  }else if("R".equals(action)) { 
			  System.out.println("action 값 찍어보기 : " + action);
			  resultMsg = "REPLY";
			  
			  System.out.println(paramMap + "==============================================");
			  qnAService.replyIncrement(paramMap);
			  qnAService.replyInsertQna(paramMap);
		  
		  }else if("CI".equals(action)) { 
			  System.out.println("action 값 찍어보기 : " + action);
			  resultMsg = "COMMENT";
			  
			  System.out.println(paramMap + "==============================================");
			  qnAService.commentInsert(paramMap);
			  
		  
		  }else { resultMsg ="FALSE / 등록에 실패했습니다."; }
	  
	  
	  // 결과 값 전송 
	  Map<String, Object> resultMap = new HashMap<String, Object>();
	  resultMap.put("resultMsg", resultMsg);
	  
	  return resultMap; 
	  
}
	  
	  
//		답글을 위치에 맞게 저장하는 메소드
		  @RequestMapping("replyInsert.do")
		  @ResponseBody
		  public Map<String,Object> replyInsert(Model model, @RequestParam
		  Map<String,Object> paramMap, HttpServletRequest request, HttpServletResponse
		  response, HttpSession session) throws Exception {
			System.out.println("컨트롤러의 replyInsert() 메소드 실행");
//			답변할 원본 글의 글 번호, 글 그룹, 글 레벨, 같은 그룹에서 글 출력 순서, 답글 작성자 이름, 답글 제목, 답글 내용과 답글을 저장한 후 돌아갈
//			페이지 번호가 저장된 request 객체를 model 객체에 저장한다.
			
			System.out.println(paramMap + "뭐가 넘어왔나??");
			
			
	//		int idx = Integer.parseInt(request.getParameter("idx"));
	//		int ref = Integer.parseInt(request.getParameter("ref"));
	//		int lev = Integer.parseInt(request.getParameter("lev"));
	//		int seq = Integer.parseInt(request.getParameter("seq"));
	//		String name = request.getParameter("name");
	//		String subject = request.getParameter("subject");
	//		String content = request.getParameter("content");
			
			
	//		mvcboardVO.setIdx(idx);
	//		mvcboardVO.setName(name);
	//		mvcboardVO.setSubject(subject);
	//		mvcboardVO.setContent(content);
	//		mvcboardVO.setRef(ref);
	//		mvcboardVO.setLev(lev);
	//		mvcboardVO.setSeq(seq);
	//		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
	//		hmap.put("ref", mvcboardVO.getRef());
	//		hmap.put("seq", mvcboardVO.getSeq());
	//		mapper.replyIncrement(hmap);
	//		mapper.replyInsert(mvcboardVO);
			
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
	//		resultMap.put("resultMsg", resultMsg);
			return resultMap;
			
		}
	 

}
