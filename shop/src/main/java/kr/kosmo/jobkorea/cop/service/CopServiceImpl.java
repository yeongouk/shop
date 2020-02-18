package kr.kosmo.jobkorea.cop.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import kr.kosmo.jobkorea.makmgr.model.MakCmtAtmtFilModel;
//import kr.kosmo.jobkorea.makmgr.model.MakCmtModel;
import kr.kosmo.jobkorea.cop.dao.CopDao;
import kr.kosmo.jobkorea.cop.dto.CopDTO;

@Service
public class CopServiceImpl implements CopService {

@Autowired
CopDao dao;
	
	
	/** 프로젝트저장*/
	public int officeSave(Map<String, String> map)  throws Exception{
		int n = dao.officeSave(map);
		return n;
	}


	@Override
	public int countListProject(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int countApplyProject(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int countCopProject(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int deleteProject(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public List<Map<String, Object>> selectUserSkill(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void UserUpdate(Map<String, String> map) throws Exception {
		dao.UserUpdate(map);
		
	}

	@Override
	public void CareerUpdate(Map<String, String> map) throws Exception {
		dao.CareerUpdate(map);
	}
	@Override
	public Map<String, Object> selectInfo(Map<String, Object> map) {
		Map<String, Object> list = dao.selectInfo(map);
		return list;
	}


	@Override
	public int idcheck(String loginId) {
		// TODO Auto-generated method stub
		return dao.idcheck(loginId);
	}
	
	@Override
	public int emailcheck(String email) {
		// TODO Auto-generated method stub
		return dao.idcheck(email);
	}
	
	/*
	 * public int idcheck(Map<Object, Object> map) throws Exception{
	 * 
	 * return dao.idcheck(map); }
	 */
	
	
	/*
	 * @Override public int idcheck(String loginId) throws Exception { // TODO
	 * Auto-generated method stub return 0 ; }
	 * 
	 */




}
