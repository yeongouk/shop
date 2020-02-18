package kr.kosmo.jobkorea.supportC.service;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.supportC.model.NoticeCModel;
import kr.kosmo.jobkorea.supportD.model.NoticeDModel;

public interface NoticeCService {
	
	List<NoticeCModel> noticeList(Map<String, Object> paramMap);

	int noticeTotalCnt(Map<String, Object> paramMap);

	NoticeCModel detailNoticeList(Map<String, Object> paramMap);
}
