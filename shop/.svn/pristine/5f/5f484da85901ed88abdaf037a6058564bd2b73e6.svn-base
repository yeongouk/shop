package kr.kosmo.jobkorea.supportD.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.kosmo.jobkorea.cmnt.dao.CmntBbsDao;
import kr.kosmo.jobkorea.cmnt.model.CmntBbsAtmtFilModel;
import kr.kosmo.jobkorea.common.comnUtils.FileUtil;
import kr.kosmo.jobkorea.common.comnUtils.FileUtilModel;
import kr.kosmo.jobkorea.supportD.dao.DocumentMgtDao;
import kr.kosmo.jobkorea.supportD.model.DocumentAtmtFilModel;
import kr.kosmo.jobkorea.supportD.model.DocumentMgtModel;
import kr.kosmo.jobkorea.supportD.model.LecturePlanAtmtFilModel;


@Service
public class DocumentMgtServiceImpl implements DocumentMgtService {
	
	@Autowired
	DocumentMgtDao documentMgtDao;
	
	
	// comment path for file upload
		@Value("${fileUpload.documentpath}")
		private String filePath;
		
		// Root path for file upload 
		@Value("${fileUpload.rootPath}")
		private String rootPath;
		
		
		// Set final Logger
		private final Logger logger = LogManager.getLogger(this.getClass());
		
		// Get class name for logger
		private final String className = this.getClass().toString();

	//목록
	@Override
	public List<Map<String, Object>> documentMgtList(Map<String, Object> paramMap) {
		List<Map<String, Object>> documentMgtList = documentMgtDao.documentMgtList(paramMap);
		return documentMgtList;
	}

	//목록 갯수 구하기
	@Override
	public int documentTotalCnt(Map<String, Object> paramMap) {
		int documentTotalCnt=documentMgtDao.documentTotalCnt(paramMap);
		return documentTotalCnt;
	}

	//상세보기
	@Override
	public Map<String, Object> detailDocumentMgtList(Map<String, Object> paramMap) {
		Map<String, Object> detailDocumentMgtList = documentMgtDao.detailDocumentMgtList(paramMap);
		return detailDocumentMgtList;
	}

	//게시글 저장, 파일 업로드
	@Override
	public int insertDocument(Map<String, Object> paramMap) throws Exception{
		
		
		//int numResult = documentMgtDao.numPlus();
		//paramMap.put("nt_no", numResult); // 번호 여기에 추가 
		
	    int insertDocument=documentMgtDao.insertDocument(paramMap);
	    
		return insertDocument;
	}

	@Override
	public int updateDocument(Map<String, Object> paramMap) {
		int updateDocument=documentMgtDao.updateDocument(paramMap);
		return updateDocument;
	}

	@Override
	public int deleteDocument(Map<String, Object> paramMap) {
		int deleteDocument=documentMgtDao.deleteDocument(paramMap);
		return deleteDocument;
	}

	@Override
	public void fileUplode(Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		 
		//int numResult = documentMgtDao.numPlus();
		//map.put("nt_no", numResult); // 번호 여기에 추가 
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		
		//로그인 아이디 가져오기
		String login_id = (String)paramMap.get("login_id");
		
		 // 파일 저장
		 String itemFilePath = filePath + File.separator + login_id + File.separator ; 
		 FileUtil fileUtil = new FileUtil(multipartHttpServletRequest, rootPath, itemFilePath);
		 List<FileUtilModel> listFileUtilModel = fileUtil.uploadFiles();
				  
				  // 데이터 저장
				  try {
				  
				  // 제작 코멘트 첨부파일 등록 
				  for (FileUtilModel fileUtilModel : listFileUtilModel) {
					  paramMap.put("filename", fileUtilModel.getLgc_fil_nm()); 
					  paramMap.put("filepath",fileUtilModel.getPsc_fil_nm()); 
					  paramMap.put("filesize", fileUtilModel.getFil_siz()); 
				
				  
				  // DB 저장
				  documentMgtDao.fileUplode(paramMap);    
				  }
				  
				  } catch(Exception e) { // 파일 삭제
					  fileUtil.deleteFiles(listFileUtilModel);
				  throw e; 
				  }
	}
	
	@Override
	public void updateFile(Map<String, Object> paramMap, HttpServletRequest request) throws Exception{
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		
		//로그인 아이디 가져오기
		String login_id = (String)paramMap.get("login_id");
		  
		// 파일 저장
				 String itemFilePath = filePath + File.separator + login_id + File.separator ; 
		 FileUtil fileUtil1 = new FileUtil(multipartHttpServletRequest, rootPath, itemFilePath);
		 List<FileUtilModel> listFileUtilModel = fileUtil1.uploadFiles();
				  
				  // 데이터 저장
				  try {
				  
				  // 제작 코멘트 첨부파일 등록 
				  for (FileUtilModel fileUtilModel : listFileUtilModel) {
					  paramMap.put("filename", fileUtilModel.getLgc_fil_nm()); 
					  paramMap.put("filepath",fileUtilModel.getPsc_fil_nm()); 
					  paramMap.put("filesize", fileUtilModel.getFil_siz()); 
				
				  
				  // DB 저장
				  documentMgtDao.updateFile(paramMap); 
				  
				  System.out.println("수정!!!!!!!!!!!!!!!!!!");

				  }
				  
				  } catch(Exception e) { // 파일 삭제
					  fileUtil1.deleteFiles(listFileUtilModel);
				  throw e; 
				  }
	}

	@Override
	public void deleteFile(Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
	
	 MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
	
	 //로그인 아이디 가져오기
	 String login_id = (String)paramMap.get("login_id");
	  
	 // 파일 저장
	 String itemFilePath =rootPath+ File.separator + filePath + File.separator + login_id + File.separator ;
	 
	 //FileUtil fileUtil3 = new FileUtil(multipartHttpServletRequest, rootPath, itemFilePath);
	 //List<FileUtilModel> listFileUtilModel = fileUtil3.uploadFiles();
	 //fileUtil3.deleteFiles(listFileUtilModel, rootPath);
	 
	 //List<FileUtilModel> listDeleteFile = new ArrayList<FileUtilModel>();
	 FileUtil fileUtil = new FileUtil(multipartHttpServletRequest, rootPath, itemFilePath);
	 List<FileUtilModel> listFileUtilModel = fileUtil.uploadFiles();
	 
	 
	 //////////////////////////////////////
	 String filename = (String)paramMap.get("filename");
		logger.info("filename : "+ filename);
		
		if (filename != null && !"".equals(filename)) {
			
			logger.info("삭제시작");
			
			// 삭제대상 정보 조회
			//LecturePlanAtmtFilModel listLecturePlanAtmtFilModel = lectureDao.selectLecturePlanAtmtFil(reqParam);
			DocumentAtmtFilModel listDocumentAtmtFilModel = documentMgtDao.selectDocumentAtmtFil(paramMap);
			
			// 파일 삭제 대상 설정
			List<FileUtilModel> listDeleteFile1 = new ArrayList<FileUtilModel>();
			
			
			FileUtilModel fileUtilModel = new FileUtilModel();
			fileUtilModel.setPsc_fil_nm(listDocumentAtmtFilModel.getAtmt_fil_psc_fil_nm());
			listDeleteFile1.add(fileUtilModel);
			
			// 파일 삭제
			fileUtil.deleteFiles(listDeleteFile1, rootPath);
			
			logger.info("삭제끝");
			}
				
				
	//////////////////////////////////////
	documentMgtDao.deleteFile(paramMap);
			
	}

	@Override
	public DocumentMgtModel documentDown(Map<String, Object> paramMap) throws Exception {
		
		DocumentMgtModel documentDown= documentMgtDao.documentDown(paramMap); 
		return documentDown;
	}


				  
}
