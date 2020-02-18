package kr.kosmo.jobkorea.manageF.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.kosmo.jobkorea.manageF.dao.RoomInfoDAO;
import kr.kosmo.jobkorea.manageF.model.ToolinfoModel;

@Repository
public class RoomInfoServiceImpl implements RoomInfoService {

	@Autowired
	RoomInfoDAO roomInfoDAO;
	
	@Override
	public List<Map<String, Object>> selectListRoomList(Map<String, Object> roomMap) {
		return roomInfoDAO.selectListRoomLIST(roomMap);
	}

	@Override
	public int cntRoomList(Map<String, Object> roomMap) {
		return roomInfoDAO.cntRoomList(roomMap);
	}

	@Override
	public void insertRoomInfo(Map<String, Object> reqParam) {
		roomInfoDAO.insertRoomInfo(reqParam);
	}


	 

	
	
	
	
}
