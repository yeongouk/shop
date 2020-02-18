package kr.kosmo.jobkorea.manageF.service;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.manageF.model.ToolinfoModel;

 /**

  * @FileName : ToolinfoService.java
  * @Project : lms
  * @Date : 2020. 2. 4. 
  * @작성자 : virus
  * @변경이력 :
  * @프로그램 설명 :
  */
public interface ToolinfoService {
	
	//해당 room에 장비에 리스트
	List<Map<String, Object>> selectWareList(Map<String, Object> wareMap);
	//해당 room에 장비 갯수
	int cntWareInfoList(Map<String, Object> wareMap);
	void insertWareInfo(Map<String, Object> reqParam);
	ToolinfoModel readOneWare(Map<String, Object> reqParam);
	void updateWareInfo(Map<String, Object> reqParam);
	void deleteWareInfo(Map<String, Object> reqParam);

	


}
