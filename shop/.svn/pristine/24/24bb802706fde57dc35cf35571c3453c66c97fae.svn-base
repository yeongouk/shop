package kr.kosmo.jobkorea.system.service;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.system.model.PaymentModel;
import kr.kosmo.jobkorea.system.model.PcCurrentModel;
import kr.kosmo.jobkorea.system.model.UserMgrModel;


public interface PcCurrentService {

	public List<PcCurrentModel> pcCurrentList(Map<String, Object> paramMap) throws Exception;

	public int countListPcCurrent(Map<String, Object> paramMap) throws Exception;

	public List<UserMgrModel> searchUserList(Map<String, Object> paramMap) throws Exception;

	public int countUserList(Map<String, Object> paramMap) throws Exception;

	//결제 정보 가져오기
	public List<PaymentModel> userAmt(Map<String, Object> paramMap) throws Exception;
    
	//결제 저장
	public void userPayment(Map<String, Object> paramMap) throws Exception;

	//자리배정-> 로그인 기록
	public void InsertSeat(Map<String, Object> paramMap) throws Exception;

	//자리배정 -> 주문 내용
	public void InsertOrder(Map<String, Object> paramMap) throws Exception;

	

}
