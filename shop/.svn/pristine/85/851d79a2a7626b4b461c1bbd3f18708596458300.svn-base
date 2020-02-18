package kr.kosmo.jobkorea.manageC.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.manageC.dao.QnALJKDao;
import kr.kosmo.jobkorea.manageC.model.QnACommentLJKKModel;
import kr.kosmo.jobkorea.manageC.model.QnALJKModel;







@Service("/QnALJKDao")
public class QnALJKServiceImpl implements QnALJKService {
	
	@Autowired
	QnALJKDao qnADao;

	@Override
	public List<QnALJKModel> qnaList(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		
		List<QnALJKModel> list = qnADao.selectQnaLjkList(paramMap);
		
		return list;
	}

	@Override
	public int qnaTotalCnt(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		int totalCnt = qnADao.selectqnaListLJKCnt(paramMap);
		
		return totalCnt;
	}

	@Override
	public QnALJKModel detailQnAlist(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		QnALJKModel detailQnAlist = qnADao.detailQnALJKlist(paramMap);
		return detailQnAlist;
	}

	@Override
	public void insertQnA(Map<String, Object> paramMap) {


		qnADao.insertQna(paramMap);
		
	}

	@Override
	public void updateQnA(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		qnADao.updateQna(paramMap);
	}

	@Override
	public void deleteQnA(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		qnADao.deleteQna(paramMap);
		
	}

	@Override
	public void replyIncrement(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		qnADao.replyIncrement(paramMap);
	}

	@Override
	public void replyInsertQna(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		qnADao.replyInsertQna(paramMap);
	}

	@Override
	public void commentInsert(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		qnADao.commentInsert(paramMap);
	}

	@Override
	public List<QnACommentLJKKModel> commentList(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return qnADao.commentList(paramMap);
	}



}
