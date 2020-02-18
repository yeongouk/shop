package kr.kosmo.jobkorea.cop.dao;

import java.util.Map;

import kr.kosmo.jobkorea.cop.dto.CopDTO;

public interface CopDao {
	

		public int officeSave(Map<String, String> map);
	
		public Map<String, Object> selectInfo(Map<String, Object> map);
		
		//public Map<String, Object> idcheck(Map<String, Object> map);
		
		public void UserUpdate(Map<String, String> map);
		
		public void CareerUpdate(Map<String, String> map);


		public int idcheck(String loginId);

	
		
		
	
}
