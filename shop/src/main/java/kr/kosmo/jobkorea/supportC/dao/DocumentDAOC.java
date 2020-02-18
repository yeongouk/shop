package kr.kosmo.jobkorea.supportC.dao;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.supportC.model.DocumentCModel;
       
public interface DocumentDAOC {
	
	public List<DocumentCModel> SelectDocumentList(Map<String, Object> map);
	
	public int countDocument(Map<String, Object> map);

	/**
	
	  * @Method Name : readDocumentOne
	  * @작성일 : 2020. 2. 6.
	  * @작성자 : virus
	  * @변경이력 : 
	  * @Method 설명 :
	  * @param nt_no
	  * @return
	  */
	public DocumentCModel readDocumentOne(String nt_no);
}
