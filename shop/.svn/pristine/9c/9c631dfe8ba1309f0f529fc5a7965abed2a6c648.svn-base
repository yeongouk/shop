package kr.kosmo.jobkorea.adm.controller;


import java.io.PrintWriter;
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

import kr.kosmo.jobkorea.adm.dto.AdmProjectDTO;
import kr.kosmo.jobkorea.adm.service.AdmProjectService;


@Controller
public class AdmProjectController {

	@Autowired
	AdmProjectService service; 
	
	@RequestMapping(value = "/adm/admProject.do")
	public String admProject(@RequestParam Map<String, Object> map ,Model model ,
			HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		List<AdmProjectDTO> list = service.selectAdmList(map);
		System.out.println(map+"맵값");
		model.addAttribute("test",list);
		return "adm/admProject";
	}
		

	@RequestMapping(value = "/combiz/projectList.do")
	public String projectList(@RequestParam Map<String, Object> map ,Model model,HttpSession session,HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("utf-8");
		//map.put("fst_rgst_sst_id", session.getAttribute("usrSstId"));
		//map.put("fnl_mdfr_sst_id", session.getAttribute("usrSstId"));
		List<AdmProjectDTO> list = service.selectAdmList(map);
		System.out.println(map+"맵값");
		session.getAttribute("regId");
		map.put("regId", "admin");
		model.addAttribute("test",map);
		return "combiz/projectList";
	}
		
	@RequestMapping(value = "/adm/projectSave.do")
	public String projectSave(@RequestParam Map<String, Object> map ,
			HttpSession session,Model model,HttpServletRequest request,HttpServletResponse response)throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		int n = service.projectSave(map);
		model.addAttribute("test","admin");
		System.out.println(map+"저장될값");
		return "redirect:/adm/admProject.do";
	}
}
