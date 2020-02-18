package kr.kosmo.jobkorea.supportA.dao;

import java.util.List;
import java.util.Map;


import kr.kosmo.jobkorea.supportA.model.NoticeMgtModel;

public interface NoticeMgtDao {
	

	public int noticeTotalCntMgt(Map<String, Object> paramMap) throws Exception;


	public List<NoticeMgtModel> selectNoticeListMgt(Map<String, Object> paramMap) throws Exception;


	public NoticeMgtModel detailNoticeMgt(Map<String, Object> paramMap) throws Exception;


	public int numPlusMgt() throws Exception;

    
	public int insertNoticeMgt(Map<String, Object> paramMap) throws Exception;


	public int updateNoticeMgt(Map<String, Object> paramMap) throws Exception;


	public int deleteNoticeMgt(Map<String, Object> paramMap) throws Exception;


       
       






}
