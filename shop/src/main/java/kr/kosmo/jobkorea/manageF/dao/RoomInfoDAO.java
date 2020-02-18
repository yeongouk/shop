package kr.kosmo.jobkorea.manageF.dao;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.manageF.model.ToolinfoModel;


public interface RoomInfoDAO {
	
	public List<Map<String, Object>> selectListRoomLIST (Map<String, Object> paramMap);

	public int cntRoomList(Map<String, Object> roomMap);
	//강의실 등록
	public void insertRoomInfo(Map<String, Object> reqParam);

	public Map<String, Object> selectRoomDetail(String room);



	
	
	
}
