package kr.kosmo.jobkorea.supportA.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.supportA.dao.NoticeMgtDao;
import kr.kosmo.jobkorea.supportA.model.NoticeMgtModel;

@Service
public class NoticeMgtServiceImpl implements NoticeMgtService {

	@Autowired
	NoticeMgtDao noticeMgtDao;
	
	@Override
	public List<NoticeMgtModel> noticeList(Map<String, Object> paramMap) throws Exception {
		
      List<NoticeMgtModel> noticeList = noticeMgtDao.selectNoticeListMgt(paramMap);
		
		
		return noticeList;
	}

	@Override
	public int noticeTotalCnt(Map<String, Object> paramMap) throws Exception {
		
         int totalCnt = noticeMgtDao.noticeTotalCntMgt(paramMap);
		
		return totalCnt;
	}

	@Override
	public NoticeMgtModel detailNotice(Map<String, Object> paramMap) throws Exception {
	
		// 상세정보 가져오기 
		NoticeMgtModel detailNotice = noticeMgtDao.detailNoticeMgt(paramMap);
	
		/* int viewcount = noticeMgtDao.viewcount(paramMap); */
			
		return detailNotice;
	}

	@Override
	public int insertNoticeMgt(Map<String, Object> paramMap) throws Exception{
       
		int numResult = noticeMgtDao.numPlusMgt();
		paramMap.put("nt_no", numResult); // 번호 여기에 추가 
		int resultCnt = noticeMgtDao.insertNoticeMgt(paramMap);
		
		return resultCnt;
	}

	@Override
	public int updateNoticeMgt(Map<String, Object> paramMap) throws Exception{
		
		int resultCnt = noticeMgtDao.updateNoticeMgt(paramMap);
		
		return resultCnt;
	}

	@Override
	public int deleteNoticeMgt(Map<String, Object> paramMap) throws Exception{
		
		int resultCnt = noticeMgtDao.deleteNoticeMgt(paramMap);
		
		return resultCnt;
	}



}
