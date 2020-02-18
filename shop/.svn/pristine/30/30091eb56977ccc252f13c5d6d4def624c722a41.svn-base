package kr.kosmo.jobkorea.adm.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.kosmo.jobkorea.adm.dao.AdmProjectDao;
import kr.kosmo.jobkorea.adm.dto.AdmProjectDTO;
import kr.kosmo.jobkorea.cmnt.dao.CmntBbsDao;
import kr.kosmo.jobkorea.cmnt.model.CmntBbsAtmtFilModel;
import kr.kosmo.jobkorea.cmnt.model.CmntBbsCmtModel;
import kr.kosmo.jobkorea.cmnt.model.CmntBbsModel;
import kr.kosmo.jobkorea.common.comnUtils.FileUtil;
import kr.kosmo.jobkorea.common.comnUtils.FileUtilModel;
//import kr.kosmo.jobkorea.makmgr.model.MakCmtAtmtFilModel;
//import kr.kosmo.jobkorea.makmgr.model.MakCmtModel;

@Service
public class AdmProjectServiceImpl implements AdmProjectService {

@Autowired
AdmProjectDao dao;
	
	/** 목록검색 */
	public List<AdmProjectDTO> selectAdmList(Map<String, Object> map) throws Exception{
		List<AdmProjectDTO> list = dao.selectAdmList(map);
		return list;
	}
	/** 프로젝트저장*/
	public int projectSave(Map<String, Object> map) throws Exception{
		int n = dao.projectSave(map);
		return n;
	}
	
}
