package kr.kosmo.jobkorea.cop.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kosmo.jobkorea.cop.service.CopService;




@Controller
@RequestMapping(value = "/cop/")
public class CopController {
    
	@Autowired
	private CopService copservice;
	
	@RequestMapping(value = "officeReg.do")
	public String admProject() 
	{
		
		
		return "cop/officeReg";
	}
	
	@RequestMapping(value = "officeSave.do")
	public String officeSave(@RequestParam Map<String,String> map)throws Exception {
		
		int n = copservice.officeSave(map);
		System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"+map);
		return "/dashboard.do";		
	}
	
	
	  @RequestMapping("UserUpdate.do")
	  public String BoardView(Model
	  model, @RequestParam Map<String, Object> map, HttpSession session,HttpServletRequest request) throws Exception {
	  request.setCharacterEncoding("utf-8");	
	  
	  model.addAttribute("loginId", session.getAttribute("loginId"));
	  
	  Map<String, Object> list = copservice.selectInfo(map);
	  model.addAttribute("user",list);
	  map.put("loginId", session.getAttribute("loginId"));
	  System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+map); 
	  return "cop/userupdate";
	  }
	 //회원종보수정
	  @RequestMapping("Personinfo.do")
		@ResponseBody
		public Map<String, Object> Personinfo(Model model, @RequestParam Map<String, Object> map, HttpServletRequest request, HttpSession session) throws Exception {
			
			Map<String, Object> returnmap = new HashMap<String, Object>();
			map.put("loginId", session.getAttribute("loginId"));
		
		  model.addAttribute("loginId", session.getAttribute("loginId"));
		 
		
			Map<String, Object> list = copservice.selectInfo(map);

			returnmap.put("user", list);
			System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++"+map);
			return returnmap;
		}
	  
	  
	  
	  //회원정보수정
	  @RequestMapping("UserUpdate2.do")
		public void BoardUpdate(Model model, @RequestParam Map<String, String> map, HttpSession session, HttpServletRequest request) throws Exception {
			request.setCharacterEncoding("utf-8");
			
			map.put("loginId", (String) session.getAttribute("loginId"));
			copservice.UserUpdate(map);
			//copservice.CareerUpdate(map);
		}	

	
	  //아이디 중복체크
	  @RequestMapping("idcheck.do")
	  
	  @ResponseBody public Map<Object, Object> idcheck(@RequestBody String loginId)
	  throws Exception {
	  
	  int count = 0; 
	  Map<Object, Object> map = new HashMap<Object, Object>();
	  
	  
	  count = copservice.idcheck(loginId); 
	  map.put("cnt", count);
	  System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"+count);
	  System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"+map);
	  System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"+loginId);
	  
	  return map;
	  
	  }
	  
@RequestMapping("emailcheck.do")
	  
	  @ResponseBody public Map<Object, Object> emailcheck(@RequestBody String email)
	  throws Exception {
	  
	  int count = 0; 
	  Map<Object, Object> map = new HashMap<Object, Object>();
	  
	  
	  count = copservice.idcheck(email); 
	  map.put("cnt", count);
	  System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&"+count);
	  System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"+map);
	  System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"+email);
	  
	  return map;
	  
	  }
	 
	  

	  


}
