package kr.kosmo.jobkorea.manageC.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.kosmo.jobkorea.common.comnUtils.FileUtil;
import kr.kosmo.jobkorea.common.comnUtils.FileUtilModel;
import kr.kosmo.jobkorea.manageC.dao.HomeworkDAO;
import kr.kosmo.jobkorea.manageC.model.HomeworkModel;

@Service
public class HomeworkServiceImpl implements HomeworkService {

	@Autowired
	HomeworkDAO homeworkDAO;
	
	@Value("${fileUpload.bbsPath}")
	private String filePath;
	
	// Root path for file upload 
	@Value("${fileUpload.rootPath}")
	private String rootPath;
	
	@Override
	public List<HomeworkModel> SelectHomeworkList(Map<String, Object> map) throws Exception {
		List<HomeworkModel> SelectHomeworkList = homeworkDAO.SelectHomeworkList(map);
		return SelectHomeworkList;
	}

	@Override
	public int countHomeworklist(Map<String, Object> map) throws Exception {
		int totalCount = homeworkDAO.countHomeworkList(map);
		
		return totalCount;
	}	
	
	
	@Override
	public HomeworkModel selectHomeworkDtl(Map<String, Object> map) throws Exception {
		HomeworkModel list = homeworkDAO.selectHomeworkDtl(map);
		return list;
	}	
	
	@Override
	public void HomeworkReg(Map<String, String> map, HttpServletRequest request) throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		
		String itemFilePath = filePath + File.separator;
		FileUtil fileUtil = new FileUtil(multipartHttpServletRequest, rootPath, itemFilePath);
		List<FileUtilModel> listFileUtilModel = fileUtil.uploadFiles();
		
		try {
			
			// 제작 코멘트 첨부파일 등록 
			for (FileUtilModel fileUtilModel : listFileUtilModel) {
				map.put("filename", fileUtilModel.getLgc_fil_nm());
				map.put("filepath", fileUtilModel.getPsc_fil_nm());
				map.put("filesize", fileUtilModel.getFil_siz());
				//map.put("fil_ets", fileUtilModel.getFil_ets());

				// DB 저장
				homeworkDAO.HomeworkReg(map);		
			}
			
		} catch(Exception e) {
			// 파일 삭제
			fileUtil.deleteFiles(listFileUtilModel);
			throw e;
		}
	}


	@Override
	   public void HomeworkUpdate(Map<String, String> map, HttpServletRequest request) throws Exception {
	      
	      MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
	      
	      String itemFilePath = filePath + File.separator;
	      FileUtil fileUtil = new FileUtil(multipartHttpServletRequest, rootPath, itemFilePath);
	      List<FileUtilModel> listFileUtilModel = fileUtil.uploadFiles();
	      
	      try {
	         
	         // 제작 코멘트 첨부파일 등록 
	         for (FileUtilModel fileUtilModel : listFileUtilModel) {
	            map.put("filename", fileUtilModel.getLgc_fil_nm());
	            map.put("filepath", fileUtilModel.getPsc_fil_nm());
	            map.put("filesize", fileUtilModel.getFil_siz());
	            //map.put("fil_ets", fileUtilModel.getFil_ets());

	            // DB 저장
	            homeworkDAO.HomeworkUpdate(map);      
	         }
	         
	      } catch(Exception e) {
	         // 파일 삭제
	         fileUtil.deleteFiles(listFileUtilModel);
	         throw e;
	      }
	   
		
	}
	

	@Override
	public void inserHomework(Map<String, Object> map) {
		homeworkDAO.inserHomework(map);
		
	}

	@Override
	public void updateHomework(Map<String, Object> map) {
		homeworkDAO.updateHomework(map);
		
	}

	@Override
	public void deleteHomework(Map<String, Object> map) {
		homeworkDAO.deleteHomework(map);
		
	}
	

}
