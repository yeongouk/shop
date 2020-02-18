package kr.kosmo.jobkorea.manageF.service;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.manageF.model.ToolinfoModel;


public interface RoomInfoService {

	List<Map<String, Object>> selectListRoomList(Map<String, Object> roomMap);

	int cntRoomList(Map<String, Object> roomMap);

	void insertRoomInfo(Map<String, Object> reqParam);


	 
	

}
