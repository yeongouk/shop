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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.kosmo.jobkorea.supportC.model.DocumentCModel;
import kr.kosmo.jobkorea.supportC.service.DocumentServiceC;

@Controller
@RequestMapping("/supportC/")
public class DocumentCController {
	
	@Autowired
	DocumentServiceC service;
	
	@Value("${fileUpload.rootPath}")
	private String rootPath;
	
	DocumentCModel documentCModel;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@RequestMapping("document.do")
	public String document(Model model, @RequestParam Map<String, Object> map, HttpServletRequest request,
		HttpServletResponse response, HttpSession session) throws Exception {
		
		model.addAttribute("loginId", session.getAttribute("loginId"));		
		model.addAttribute("name", session.getAttribute("userNm"));
		  
		return "/supportC/documentC";
	}
	
	@RequestMapping("SelectDocumentList.do")
	public String SelectDocumentList(Model model, @RequestParam Map<String, Object> map, HttpServletRequest request,
		HttpServletResponse response, HttpSession session) throws Exception {
		
		model.addAttribute("loginId", session.getAttribute("loginId"));
		
		int currentPage = Integer.parseInt((String)map.get("currentPage"));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)map.get("pageSize"));			// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;
		
		map.put("pageIndex", pageIndex);
		map.put("pageSize", pageSize);
		
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("currentPageDocument", currentPage);
		
		List<DocumentCModel> list = service.SelectDocumentList(map);
		model.addAttribute("Document", list);
		
		int totalCount = service.countDocument(map);
		model.addAttribute("totalCnt", totalCount);
		
		return "supportC/documentListC";
	}
	
	
	@RequestMapping("selectOnedocument.do")
	@ResponseBody
	public Map<String, Object> lectureInsert(Model model, @RequestParam String nt_no, RedirectAttributes rttr, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".selectOnedocument");
		logger.info("nt_no=========="+nt_no);
		DocumentCModel resultData=service.selectOneDocument(nt_no);
	    
		Map<String, Object> resultMap=new HashMap<String, Object>();
	    resultMap.put("resultData", resultData);
	    resultMap.put("resultMsg", "READ");
	    
		logger.info("+ End " + className + ".selectOnedocument");
		return resultMap;

	}
	
	
	@RequestMapping("download_DocumentFile.do")
	public void download_DocumentFile(Model model, @RequestParam String nt_no, RedirectAttributes rttr, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".download_DocumentFile");
		logger.info("nt_no=========="+nt_no);
		
		DocumentCModel vo=service.selectOneDocument(nt_no);
		
		byte fileByte[]=FileUtils.readFileToByteArray(new File(rootPath+File.separator+vo.getFilepath()));
		
		response.setContentType("application/octet-stream");
	    response.setContentLength(fileByte.length);

	    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(vo.getFilename(),"UTF-8")+"\";");
	    response.setHeader("Content-Transfer-Encoding", "binary");
	    
	    response.getOutputStream().write(fileByte);
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
		
		logger.info("+ End " + className + ".download_DocumentFile");
		
	}
	
	
	
	
	
}
