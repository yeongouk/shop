package kr.kosmo.jobkorea.cop.service;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.cop.dto.CopDTO;

public interface CopService {



	   int officeSave(Map<String, String> map) throws Exception;
  
	   public int countListProject(Map<String, Object> map) throws Exception;
	   
	   public int countApplyProject(Map<String, Object> map) throws Exception;
	   
	   public int countCopProject(Map<String, Object> map) throws Exception;
	   
	   public int deleteProject(Map<String, Object> map) throws Exception;
	   
	   Map<String, Object> selectInfo(Map<String, Object> map);	   
	   
	   List<Map<String, Object>> selectUserSkill(Map<String, Object> map);
	   
	   public void UserUpdate(Map<String, String> map) throws Exception;
	   
	   public void CareerUpdate(Map<String, String> map) throws Exception;



     	int idcheck(String loginId);
     	
     	int emailcheck(String email);

	  // int idcheck(String loginId) throws Exception;



	


	
	 


	   
	


	

}
