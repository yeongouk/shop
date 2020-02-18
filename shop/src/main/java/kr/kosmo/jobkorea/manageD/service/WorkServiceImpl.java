package kr.kosmo.jobkorea.manageD.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.manageD.dao.HomeworkrDao;
import kr.kosmo.jobkorea.manageD.model.HomeworkModel;


@Service
public class WorkServiceImpl implements WorkService {

	@Autowired
	HomeworkrDao homeworkrDao;
	
	/** 과제 목록 조회 */
	public List<HomeworkModel> listHomework(Map<String, Object> paramMap) {
		
		List<HomeworkModel> listHomework = homeworkrDao.listHomework(paramMap);
		
		return listHomework;
	}

	/** 과제 목록 카운트 조회 */
	public int countListHomework(Map<String, Object> paramMap) {
		
		int totalCount = homeworkrDao.countListHomework(paramMap);
				
		return totalCount;
	}

	/** 과제 상세 조회*/
	@Override
	public HomeworkModel selectHomeworkDtl(Map<String, Object> map) throws Exception {
		
		HomeworkModel list = homeworkrDao.selectHomeworkDtl(map);
		
		return list;
	}

	/** 과제 다운로드*/
	@Override
	public HomeworkModel documentDown(Map<String, Object> paramMap) throws Exception {

		HomeworkModel documentDown= homeworkrDao.documentDown(paramMap);
		
		return documentDown;
	}

	
	
}
