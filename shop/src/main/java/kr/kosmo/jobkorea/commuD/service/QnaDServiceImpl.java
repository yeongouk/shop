package kr.kosmo.jobkorea.commuD.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.commuD.dao.QnaDDao;
import kr.kosmo.jobkorea.commuD.model.QnaDModel;


@Service("/QnADao")
public class QnaDServiceImpl implements QnaDService {
	
	@Autowired
	QnaDDao qnaDao;

	//QnA 목록 뿌리기 
	@Override
	public List<QnaDModel> qnaList(Map<String, Object> paramMap) throws Exception {

		List<QnaDModel> qnaList =  qnaDao.selectqnaList(paramMap);

		return qnaList;
	}

	//QnA 목록 갯수 확인 
	@Override
	public int qnaTotalCnt(Map<String, Object> paramMap) throws Exception {
		
		int totalCnt = qnaDao.selectqnaListCnt(paramMap);
		
		return totalCnt;
	}

	// Q&A 상세정보
	@Override
	public QnaDModel detailQnAlist(Map<String, Object> paramMap) throws Exception {	
		
		
		// 상세정보 가져오기 
		QnaDModel detailQnAlist = qnaDao.detailQnAlist(paramMap);
		
		return detailQnAlist;
	}
	
	// Q&A 등록
	@Override
	public int insertQnA(Map<String, Object> paramMap) throws Exception {
		
		//int numResult = qnaDao.numPlus();
		//paramMap.put("wno", numResult); // 번호 여기에 추가 
		int resultCnt = qnaDao.insertQnA(paramMap);
		
		return resultCnt;
	}
	// Q&A 수정
	@Override
	public int updateQnA(Map<String, Object> paramMap) throws Exception {

		int resultCnt = qnaDao.updateQnA(paramMap);
		
		return resultCnt;
		
	}
	// Q&A 삭제
	@Override
	public int deleteQnA(Map<String, Object> paramMap) throws Exception {

		 int resultCnt = qnaDao.deleteQnA(paramMap);
			
		return resultCnt;
		
	}
	// Q&A 답글
	@Override
	public int replyQnA(Map<String, Object> paramMap) throws Exception {
		int replyQnA = qnaDao.replyQnA(paramMap);
		
		return replyQnA;
	}

	@Override
	public int replyIncrement(Map<String, Object> paramMap) throws Exception {
        int replyIncrement = qnaDao.replyIncrement(paramMap);
		
		return replyIncrement;
	}

	
	

	
	
	

	//Q&A 댓글 추가
	
	



}
