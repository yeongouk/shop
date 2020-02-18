package kr.kosmo.jobkorea.commu.dao;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.commu.model.FreeBoardModel;


public interface FreeBoardDAO {
	
	// 자유게시판 목록 뿌리기 
	public List<FreeBoardModel> selectFreeBoardList(Map<String, Object> paramMap) throws Exception;

	// 자유게시판 목록 갯수 구하기
	public int selectFreeBoardListCnt(Map<String, Object> paramMap) throws Exception;

	//자유게시판 상세보기
	public FreeBoardModel detailFreeBoard(Map<String, Object> paramMap) throws Exception;

	//자유게시판 조회수 증가
	public void addReadCnt(Map<String, Object> paramMap) throws Exception;
	
	//자유게시판
	public int numPlus() throws Exception;
	
	//자유게시판 등록
	public int insertFreeBoard(Map<String, Object> paramMap) throws Exception;

	//자유게시판 수정
	public int updateFreeBoard(Map<String, Object> paramMap) throws Exception;

	//자유게시판 삭제
	public int deleteFreeBoard(Map<String, Object> paramMap) throws Exception;

	//자유게시판 댓글추가
	public int insertComments(Map<String, Object> paramMap) throws Exception;

	



}
