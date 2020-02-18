package kr.kosmo.jobkorea.supportD.service;

import java.io.File;
import java.util.ArrayList;

/**
 * @author 이미혜
 * 작성일 2020.01.20
 * 강사리스트
 */

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.kosmo.jobkorea.common.comnUtils.FileUtil;
import kr.kosmo.jobkorea.common.comnUtils.FileUtilModel;
import kr.kosmo.jobkorea.supportD.dao.LecturePlanDao;
import kr.kosmo.jobkorea.supportD.model.LecturePlanAtmtFilModel;
import kr.kosmo.jobkorea.supportD.model.LecturePlanModel;

@Service
public class LecturePlanServiceImpl implements LecturePlanService {
	
	@Autowired
	LecturePlanDao lectureDao;
	
	// Set final Logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	// Root path for file upload
	@Value("${fileUpload.rootPath}")
	private String rootPath;
	
	// lecturepath for file upload
	@Value("${fileUpload.lecturepath}")
	private String lecturePlanPath;
	

	@Override
	public List<LecturePlanModel> lectureList(Map<String, Object> lectureMap) {
		List<LecturePlanModel> lectureList=lectureDao.lecturePlanList(lectureMap);
		return lectureList;
	}

	@Override
	public int lcnt(Map<String, Object> lectureMap) {
		
		return lectureDao.lCnt(lectureMap);
	}

	@Override
	public int insertLecture(Map<String, Object> reqParam, HttpServletRequest request) throws Exception {
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		
		int ret=0;
		
		// 해당 경로 정보 추출
		// 강의계획서 ==>  lecturePlan/lectureNm(강좌번호)/loginID(로그인아이디)/fileName(파일명)
		String insertLectureNo = Integer.toString(lectureDao.findNextLectureNo());
		reqParam.put("l_no", insertLectureNo);
		String loginID = (String)reqParam.get("loginID");
		
		// 파일 저장
		String itemFilePath = lecturePlanPath + File.separator + insertLectureNo + File.separator + loginID + File.separator;
		FileUtil fileUtil = new FileUtil(multipartHttpServletRequest, rootPath, itemFilePath);
		List<FileUtilModel> listFileUtilModel = fileUtil.uploadFiles();
		
		// db 저장
		try {
			for(FileUtilModel fileUtilModel : listFileUtilModel) {
				reqParam.put("l_filename", fileUtilModel.getLgc_fil_nm());
				reqParam.put("l_filepath", fileUtilModel.getPsc_fil_nm());
				reqParam.put("l_filesize", fileUtilModel.getFil_siz());
			}
			
			ret = lectureDao.insertLecture(reqParam);
		} catch(Exception e) {
			fileUtil.deleteFiles(listFileUtilModel);
			throw e;
		}
		
		return ret;
		
	}

	@Override
	public LecturePlanModel selectOneLectureDetail(String no) {
		return lectureDao.selectOneLectureDetail(no);
	}

	/* 첨부파일 단건 조회 */
	@Override
	public LecturePlanAtmtFilModel selectLecturePlanAtmtFil(Map<String, Object> reqParam) throws Exception {
		LecturePlanAtmtFilModel lecturePlanAtmtFilModel = lectureDao.selectLecturePlanAtmtFil(reqParam);
		return lecturePlanAtmtFilModel;
	}

	/* 첨부파일 변경 없는 경우 수정 */
	@Override
	public void updateLecture(Map<String, Object> reqParam) {
	  lectureDao.updateLecture(reqParam);
	}

	/* 첨부파일 변경 있는 경우 수정 */
	@Override
	public int updateLectureWithFile(Map<String, Object> reqParam, HttpServletRequest request) throws Exception {
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		
		int ret=0;
		
		// 해당 경로 정보 추출
		// 강의계획서 ==>  lecturePlan/lectureNm(강좌번호)/loginID(로그인아이디)/fileName(파일명)
		String lectureNo = (String)reqParam.get("l_no");
		logger.info("l_no : "+lectureNo);
		
		String loginID = (String)reqParam.get("loginID");
		logger.info("loginID : "+loginID);
		
		logger.info("param : " + reqParam);
		logger.info("request : " + request);
		
		// 파일 저장
		String itemFilePath = lecturePlanPath + File.separator + lectureNo + File.separator + loginID + File.separator;
		FileUtil fileUtil = new FileUtil(multipartHttpServletRequest, rootPath, itemFilePath);
		List<FileUtilModel> listFileUtilModel = fileUtil.uploadFiles();
		
		// db 저장
		try {
			for(FileUtilModel fileUtilModel : listFileUtilModel) {
				reqParam.put("l_filename", fileUtilModel.getLgc_fil_nm());
				reqParam.put("l_filepath", fileUtilModel.getPsc_fil_nm());
				reqParam.put("l_filesize", fileUtilModel.getFil_siz());
			}
			
			// 기존 첨부파일 삭제
			String tmp_filename = (String)reqParam.get("tmp_filename");
			logger.info("tmp_filename : "+ tmp_filename);
			
			if (tmp_filename != null && !"".equals(tmp_filename)) {
				
				logger.info("삭제시작");
				
				// 삭제대상 정보 조회
				LecturePlanAtmtFilModel listLecturePlanAtmtFilModel = lectureDao.selectLecturePlanAtmtFil(reqParam);
				
				// 파일 삭제 대상 설정
				List<FileUtilModel> listDeleteFile = new ArrayList<FileUtilModel>();
				
				FileUtilModel fileUtilModel = new FileUtilModel();
				fileUtilModel.setPsc_fil_nm(listLecturePlanAtmtFilModel.getAtmt_fil_psc_fil_nm());
				listDeleteFile.add(fileUtilModel);
				
				// 파일 삭제
				fileUtil.deleteFiles(listDeleteFile, rootPath);
				
				logger.info("삭제끝");
				
			}
			
			// db 업데이트
			ret = lectureDao.updateLectureWithFile(reqParam);
			
		} catch(Exception e) {
			fileUtil.deleteFiles(listFileUtilModel);
			throw e;
		}
		
		return ret;
		
	}
	
	

}
















