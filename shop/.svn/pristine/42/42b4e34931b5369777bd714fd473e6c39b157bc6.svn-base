package kr.kosmo.jobkorea.supportD.dao;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.supportD.model.DocumentAtmtFilModel;
import kr.kosmo.jobkorea.supportD.model.DocumentMgtModel;

public interface DocumentMgtDao {

	List<Map<String, Object>> documentMgtList(Map<String, Object> paramMap);

	int documentTotalCnt(Map<String, Object> paramMap);

	Map<String, Object> detailDocumentMgtList(Map<String, Object> paramMap);

	int insertDocument(Map<String, Object> paramMap) throws Exception;

	int updateDocument(Map<String, Object> paramMap);

	int deleteDocument(Map<String, Object> paramMap);

	//int numPlus();

	public void fileUplode(Map<String, Object> paramMap) throws Exception;

	public void updateFile(Map<String, Object> paramMap) throws Exception;

	public void deleteFile(Map<String, Object> paramMap) throws Exception;

	public DocumentMgtModel documentDown(Map<String, Object> paramMap) throws Exception;

	DocumentAtmtFilModel selectDocumentAtmtFil(Map<String, Object> paramMap);

}
