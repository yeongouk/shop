package kr.kosmo.jobkorea.manageC.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.manageC.model.QnACommentLJKKModel;
import kr.kosmo.jobkorea.manageC.model.QnALJKModel;

public interface QnALJKDao {

	List<QnALJKModel> selectQnaLjkList(Map<String, Object> paramMap);


	QnALJKModel detailQnALJKlist(Map<String, Object> paramMap);


	int selectqnaListLJKCnt(Map<String, Object> paramMap);


	void insertQna(Map<String, Object> paramMap);


	void updateQna(Map<String, Object> paramMap);


	void deleteQna(Map<String, Object> paramMap);


	void replyIncrement(Map<String, Object> paramMap);


	void replyInsertQna(Map<String, Object> paramMap);


	void commentInsert(Map<String, Object> paramMap);


	List<QnACommentLJKKModel> commentList(Map<String, Object> paramMap);




	
	
	
	
	



}
