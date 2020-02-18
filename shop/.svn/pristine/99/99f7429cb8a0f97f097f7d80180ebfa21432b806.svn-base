package kr.kosmo.jobkorea.commuD.service;

import java.util.List;
import java.util.Map;


import kr.kosmo.jobkorea.commuD.model.QnaDModel;


public interface QnaDService {

	// 게시판 목록보기 
	public List<QnaDModel> qnaList(Map<String, Object> paramMap)throws Exception;

	// QnA 목록 수 확인 
	public int qnaTotalCnt(Map<String, Object> paramMap)throws Exception;

	// QnA 상세보기
	public QnaDModel detailQnAlist(Map<String, Object> paramMap)throws Exception;
	
	// QnA 등록
	public int insertQnA(Map<String, Object> paramMap) throws Exception;

	// QnA 수정
	public int updateQnA(Map<String, Object> paramMap) throws Exception;

	// QnA 삭제
	public int deleteQnA(Map<String, Object> paramMap) throws Exception;

	// QnA 답글
	public int replyQnA(Map<String, Object> paramMap)throws Exception;

	public int replyIncrement(Map<String, Object> paramMap)throws Exception;


	
	


}
