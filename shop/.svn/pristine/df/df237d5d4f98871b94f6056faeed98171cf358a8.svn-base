package kr.kosmo.jobkorea.commu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.commu.dao.FreeBoardDAO;
import kr.kosmo.jobkorea.commu.model.FreeBoardModel;




@Service("/FreeBoardService")
public class FreeBoardServiceImpl implements FreeBoardService {
	
	@Autowired
	FreeBoardDAO freeBoardDAO;

	//자유게시판 목록 뿌리기 
	@Override
	public List<FreeBoardModel> freeBoardList(Map<String, Object> paramMap) throws Exception{

		List<FreeBoardModel> freeboardlist =  freeBoardDAO.selectFreeBoardList(paramMap);
		
		return freeboardlist;
	}

	//자유게시판 목록 갯수 확인 
	@Override
	public int freeBoardTotalCnt(Map<String, Object> paramMap)throws Exception {
		
		int totalCnt = freeBoardDAO.selectFreeBoardListCnt(paramMap);
		
		return totalCnt;
	}
	
	// 자유게시판 상세정보
	@Override
	public FreeBoardModel detailFreeBoard(Map<String, Object> paramMap) throws Exception {
		// 게시판 조회 수 증가시키기
		freeBoardDAO.addReadCnt(paramMap);
				
		// 상세정보 가져오기 
		FreeBoardModel detailFreeBoard = freeBoardDAO.detailFreeBoard(paramMap);
		
		return detailFreeBoard;
	}
	
	// 자유게시판 등록
	@Override
	public int insertFreeBoard(Map<String, Object> paramMap) throws Exception{
		int numResult = freeBoardDAO.numPlus();
		paramMap.put("wno", numResult); // 번호 여기에 추가 
		int resultCnt = freeBoardDAO.insertFreeBoard(paramMap);
		
		return resultCnt;
		
	}

	// 자유게시판 수정
	@Override
	public int updateFreeBoard(Map<String, Object> paramMap) throws Exception{
	int resultCnt = freeBoardDAO.updateFreeBoard(paramMap);
		
		return resultCnt;
		
	}

	// 자유게시판 삭제
	@Override
	public int deleteFreeBoard(Map<String, Object> paramMap) throws Exception{
	    int resultCnt = freeBoardDAO.deleteFreeBoard(paramMap);
		
		return resultCnt;
		
	}

	//자유게시판 댓글 추가
	@Override
	public int insertFreeBoard2(Map<String, Object> paramMap) throws Exception{
		
        int numResult = freeBoardDAO.numPlus();
		paramMap.put("wno", numResult); // 번호 여기에 추가 
		int resultCnt = freeBoardDAO.insertComments(paramMap);
		
		return resultCnt;
		
	}



}
