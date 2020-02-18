package kr.kosmo.jobkorea.supportD.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileUpload;
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

import kr.kosmo.jobkorea.common.comnUtils.FileUtil;
import kr.kosmo.jobkorea.supportD.model.DocumentMgtModel;
import kr.kosmo.jobkorea.supportD.service.DocumentMgtService;


@Controller
@RequestMapping("/supportD/")
public class DocumentMgtController {
	
	@Autowired
	DocumentMgtService  documentMgtService;
	
	// Root path for file upload 
	@Value("${fileUpload.rootPath}") 
	private String rootPath;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	


	/* 학습자료관리 -초기화면 */
	@RequestMapping("documentMgt.do")
	public String initDocumentMgt(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".initDocumentMgt");
		logger.info("   - paramMap : " + paramMap);

		
		// 로그인해서 리스트를 먼저 뿌린다.
		model.addAttribute("writer", session.getAttribute("loginId"));
		// 작성 초기 단계에서 쓰려고 미리 뿌린다.
		// System.out.println("writer : " + session.getAttribute("loginId"));
		
		logger.info("+ End " + className + ".initDocumentMgt");
		
		return "supportD/documentMgt";
	}
	
	
	/* 학습자료관리 리스트 뿌리기 */
	@RequestMapping("documentMgtList.do")
	public String documentMgtList(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		    logger.info("+ Start " + className + ".documentMgtList");
		    logger.info("   - paramMap : " + paramMap);
			//System.out.println("param에서 넘어온 값을 찍어봅시다.: " + paramMap);
		    
		    
			
			// jsp페이지에서 넘어온 파람 값 정리 (페이징 처리를 위해 필요)
			int currentPage = Integer.parseInt((String)paramMap.get("currentPage")); // 현재페이지 
			int pageSize = Integer.parseInt((String)paramMap.get("pageSize"));
			int pageIndex = (currentPage -1)*pageSize;
			
			// 사이즈는 int형으로, index는 2개로 만들어서 -> 다시 파람으로 만들어서 보낸다.
			paramMap.put("pageIndex", pageIndex);
			paramMap.put("pageSize", pageSize);
		
			// 서비스 호출
			List<Map<String,Object>> documentMgtList = documentMgtService.documentMgtList(paramMap);
			model.addAttribute("documentList", documentMgtList);
			
			// 목록 숫자 추출하여 보내기 
			int totalCnt = documentMgtService.documentTotalCnt(paramMap);
			model.addAttribute("totalCnt", totalCnt);
			
			model.addAttribute("pageSize", pageSize);
			model.addAttribute("currentPage",currentPage);
			
			//System.out.println("자 컨트롤러에서 값을 가지고 jsp로 갑니다~ : " + freeboardlist.size());
			logger.info("+ End " + className + ".documentMgtList");
			
		return "supportD/documentMgtList";	
	}
	
	/* 학습자료관리 상세 정보 뿌리기 */
	@RequestMapping("detailDocumentMgtList.do")
	@ResponseBody
	public Map<String,Object> detailDocumentMgtList(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		//System.out.println("상세정보 보기를 위한 param에서 넘어온 값을 찍어봅시다.: " + paramMap);
		  logger.info("+ Start " + className + ".detailDocumentMgtList");
		  logger.info("   - paramMap : " + paramMap);
		  
		String result="";

		// 선택된 게시판 1건 조회 
		Map<String,Object> detailDocumentMgtList = documentMgtService.detailDocumentMgtList(paramMap);
		//List<CommentsVO> comments = null;
		
		if(detailDocumentMgtList != null) {
			
			result = "SUCCESS";  // 성공시 찍습니다. 
			
		}else {
			result = "FAIL / 불러오기에 실패했습니다.";  // null이면 실패입니다.
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", detailDocumentMgtList); // 리턴 값 해쉬에 담기 
		//resultMap.put("resultComments", comments);
		resultMap.put("resultMsg", result); // success 용어 담기 
		
		System.out.println("결과 글 찍어봅세 " + result);
		System.out.println("결과 글 찍어봅세 " + detailDocumentMgtList);
		
		logger.info("+ End " + className + ".detailDocumentMgtList");
		
		return resultMap;
	}
	
	
	/* 학습자료관리 게시글 등록하기 */
	@RequestMapping("documentSave.do")
	@ResponseBody
	public  Map<String,Object> savaList(Model model, @RequestParam Map<String,Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		//System.out.println("저장키를 먹나요~~~~?? : " + paramMap.toString());
		
		logger.info("+ Start " + className + ".savaList");
		logger.info("   - paramMap : " + paramMap);
		
		String action = (String)paramMap.get("action"); // 구분하는 키값 
		System.out.println("action 값 찍어보기 : " + action);
		
		//String content = (String)paramMap.get("commentContent");
		//System.out.println("아아앙아아아아아아아악 댃글 컨텐트!! " + content);
		
		// 사용자 정보 설정하기 
		// paramMap.put("fst_rgst_sst_id", session.getAttribute("usrSstId"));
		
		String resultMsg = "";
		//String id = (String) session.getAttribute("loginID"); // 아이디 
		//paramMap.put("writer", id); // session을 통해 아이디 가져옴 
		
		// insert 인지, update 수정인지 확인하기 
		if("I".equals(action)) {
			documentMgtService.insertDocument(paramMap); // 저장 service
			
			resultMsg = "SUCCESS";
			
		}else if("U".equals(action)) {
			documentMgtService.updateDocument(paramMap); // 수정 service
			resultMsg = "UPDATE";
			
		}else if("D".equals(action)) {
			documentMgtService.deleteDocument(paramMap); // 수정 service
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
	 

	  @RequestMapping("/fileUplode.do") 
	  @ResponseBody
	  public Map<String, Object> fileUplode(Model model, @RequestParam Map<String, Object> paramMap, HttpSession session, HttpServletRequest request) throws Exception {
	 
		  //map.put("loginId", session.getAttribute("loginId").toString());
		   //map.put("name", session.getAttribute("userNm").toString());
		  
		logger.info("+ Start " + className + ".fileUplode");
		logger.info("   - paramMap : " + paramMap);
		
		paramMap.put("login_id", session.getAttribute("loginId"));
		  
		 String action = (String)paramMap.get("action"); // 구분하는 키값 
		 System.out.println("action 값 찍어보기 : " + action);
	     System.out.println("fileUplode !!!!!!!!!!!!!!!!!!!!!!!!!!");
	     
	     String resultMsg = "";
	     
	     if("I".equals(action)) {
				documentMgtService.fileUplode(paramMap,request); // 저장 service
				resultMsg = "SUCCESS";
				
			}else if("U".equals(action)) {
				documentMgtService.updateFile(paramMap,request); // 수정 service
				resultMsg = "UPDATE";
				
			}else if("D".equals(action)) {
				documentMgtService.deleteFile(paramMap,request); // 수정 service
				resultMsg = "DELETE";
				
			}else {
				resultMsg ="FALSE / 등록에 실패했습니다.";
			}
	     
	       logger.info("+ End " + className + ".fileUplode");
	     
	 	   // 결과 값 전송
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("resultMsg", resultMsg);
			
			return resultMap;
		
	  }
	  
	  
		/**
		 * 첨부파일 다운로드
		 */
		@RequestMapping("documentDown.do")
		public void documentDown(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
		
			logger.info("+ Start " + className + ".documentDown");
			logger.info("   - paramMap : " + paramMap);
			
			// 첨부파일 조회
			DocumentMgtModel documentDown = documentMgtService.documentDown(paramMap);
			
			byte fileByte[] = FileUtils.readFileToByteArray(new File(rootPath+File.separator+documentDown.getFilepath()));
			
			
			response.setContentType("application/octet-stream");
		    response.setContentLength(fileByte.length);
		    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(documentDown.getFilename(),"UTF-8")+"\";");
		    response.setHeader("Content-Transfer-Encoding", "binary");
		    response.getOutputStream().write(fileByte);
		     
		    response.getOutputStream().flush();
		    response.getOutputStream().close();
		    
		    
		    logger.info("+ End " + className + ".documentDown");
			
		}
	 


}
