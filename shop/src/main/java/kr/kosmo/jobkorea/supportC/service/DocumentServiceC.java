package kr.kosmo.jobkorea.supportC.service;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.supportC.model.DocumentCModel;

public interface DocumentServiceC {
	
	public List<DocumentCModel> SelectDocumentList(Map<String, Object> map) throws Exception;
	
	public int countDocument(Map<String, Object> map) throws Exception;

	/**
	
	  * @Method Name : selectOneDocument
	  * @작성일 : 2020. 2. 6.
	  * @작성자 : virus
	  * @변경이력 : 
	  * @Method 설명 :
	  * @param nt_no
	  * @return
	  */
	public DocumentCModel selectOneDocument(String nt_no);


	
	
	
	
	
	
	
}
