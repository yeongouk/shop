package kr.kosmo.jobkorea.supportC.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.supportC.dao.NoticeCDAO;
import kr.kosmo.jobkorea.supportC.model.NoticeCModel;
import kr.kosmo.jobkorea.supportD.model.NoticeDModel;

@Service
public class NoticeCServiceImpl implements NoticeCService {
	
	@Autowired
	NoticeCDAO dao;
	
	@Override
	public List<NoticeCModel> noticeList(Map<String, Object> paramMap) {
		List<NoticeCModel> noticeList = dao.noticeList(paramMap);
		return noticeList;
	}

	@Override
	public int noticeTotalCnt(Map<String, Object> paramMap) {
		int noticeTotalCnt = dao.noticeTotalCnt(paramMap);
		return noticeTotalCnt;
	}

	@Override
	public NoticeCModel detailNoticeList(Map<String, Object> paramMap) {
		NoticeCModel detailNoticeList = dao.detailNoticeList(paramMap);
		return detailNoticeList;
	}

}
