package kr.kosmo.jobkorea.supportD.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.kosmo.jobkorea.supportD.model.DocumentMgtModel;

public interface DocumentMgtService {

	List<Map<String, Object>> documentMgtList(Map<String, Object> paramMap);

	int documentTotalCnt(Map<String, Object> paramMap);

	Map<String, Object> detailDocumentMgtList(Map<String, Object> paramMap);

	int insertDocument(Map<String, Object> paramMap) throws Exception;

	int updateDocument(Map<String, Object> paramMap);

	int deleteDocument(Map<String, Object> paramMap);

	public void fileUplode(Map<String, Object> paramMap, HttpServletRequest request) throws Exception;

	public void updateFile(Map<String, Object> paramMap, HttpServletRequest request) throws Exception;

	public void deleteFile(Map<String, Object> paramMap, HttpServletRequest request) throws Exception;

	public DocumentMgtModel documentDown(Map<String, Object> paramMap) throws Exception;

}
