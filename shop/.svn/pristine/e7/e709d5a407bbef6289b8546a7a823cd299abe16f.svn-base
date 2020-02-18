package kr.kosmo.jobkorea.supportC.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.supportC.dao.DocumentDAOC;
import kr.kosmo.jobkorea.supportC.model.DocumentCModel;
       
@Service
public class DocumentServiceImplC implements DocumentServiceC {
	
	@Autowired
	DocumentDAOC dao;
	
	@Value("${fileUpload.bbsPath}")
	private String filePath;
	
	// Root path for file upload 
	@Value("${fileUpload.rootPath}")
	private String rootPath;
	
	@Override
	public List<DocumentCModel> SelectDocumentList(Map<String, Object> map) throws Exception {
		List<DocumentCModel> SelectDocumentList = dao.SelectDocumentList(map);
		
		return SelectDocumentList;
	}

	@Override
	public int countDocument(Map<String, Object> map) throws Exception {

		int totalCount = dao.countDocument(map);
		return totalCount;
	}

	@Override
	public DocumentCModel selectOneDocument(String nt_no) {
		return dao.readDocumentOne(nt_no);
	}


	

}
