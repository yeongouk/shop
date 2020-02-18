package kr.kosmo.jobkorea.supportA.service;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.supportA.model.NoticeMgtModel;

public interface NoticeMgtService {

	public List<NoticeMgtModel> noticeList(Map<String, Object> paramMap)throws Exception;

	public int noticeTotalCnt(Map<String, Object> paramMap) throws Exception;

	public NoticeMgtModel detailNotice(Map<String, Object> paramMap) throws Exception;

	public int insertNoticeMgt(Map<String, Object> paramMap) throws Exception;

	public int updateNoticeMgt(Map<String, Object> paramMap) throws Exception;

	public int deleteNoticeMgt(Map<String, Object> paramMap) throws Exception;

	

}
