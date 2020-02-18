package kr.kosmo.jobkorea.system.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kr.kosmo.jobkorea.system.dao.PcCurrentDao;
import kr.kosmo.jobkorea.system.model.ComnGrpCodModel;
import kr.kosmo.jobkorea.system.model.PaymentModel;

import kr.kosmo.jobkorea.system.model.PcCurrentModel;
import kr.kosmo.jobkorea.system.model.UserMgrModel;

@Service
public class PcCurrentServiceImpl implements PcCurrentService {

	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	PcCurrentDao pcCurrentDao;

	
	//pc사용 현황 목록 조회
	@Override
	public List<PcCurrentModel> pcCurrentList(Map<String, Object> paramMap) throws Exception {
		List<PcCurrentModel> pcCurrentList = pcCurrentDao.pcCurrentList(paramMap);

		return pcCurrentList;
	}
	
	@Override
	public int countListPcCurrent(Map<String, Object> paramMap) throws Exception {
		int totalCount = pcCurrentDao.countListPcCurrent(paramMap);
		return totalCount;
	}

	

    //자리 배정시 사용자 검색
	@Override
	public List<UserMgrModel> searchUserList(Map<String, Object> paramMap) throws Exception {
        List<UserMgrModel> searchUserList = pcCurrentDao.searchUserList(paramMap);
		
		return searchUserList;
	}

   //
	@Override
	public int countUserList(Map<String, Object> paramMap) throws Exception {
         int totalCount = pcCurrentDao.countUserList(paramMap);
		
		return totalCount;
	}
	
    //자리 배정
	@Override
	public void InsertSeat(Map<String, Object> paramMap) throws Exception {
		pcCurrentDao.InsertSeat(paramMap);
		pcCurrentDao.InsertOrder(paramMap);
	}
	
	@Override
	public void InsertOrder(Map<String, Object> paramMap) throws Exception {
		//pcCurrentDao.InsertOrder(paramMap);
		
	}



   //결제 정보 가져오기
	@Override
	public List<PaymentModel> userAmt(Map<String, Object> paramMap) throws Exception {
		List<PaymentModel> userAmt = pcCurrentDao.userAmt(paramMap);
		return userAmt;
	}


  //결제 저장
	@Override
	public void userPayment(Map<String, Object> paramMap) throws Exception {
        
		Map<String, Object> reparamMap = pcCurrentDao.selectamt(paramMap);
		
		try {
			paramMap.put("amt", Integer.parseInt((String) reparamMap.get("amt")));
			
		} catch (Exception e) {
			System.out.println(reparamMap+"리파람??????????");
			// TODO: handle exception
		}
		
		
		pcCurrentDao.userPaymentPc(paramMap);
		pcCurrentDao.userPaymentOrder(paramMap);
		
	}







}
