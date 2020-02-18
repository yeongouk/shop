package kr.kosmo.jobkorea.careerA.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.careerA.dao.ResumeDao;
import kr.kosmo.jobkorea.careerA.model.ResumeModel;

@Service
public class ResumeServiceImpl implements ResumeService {

	@Autowired
	ResumeDao resumeDao;
	
	@Override
	public List<ResumeModel> lectureClassList(Map<String, Object> paramMap) throws Exception {
		List<ResumeModel> lectureClassList = resumeDao.lectureClassList(paramMap);
		return lectureClassList;
	}

	@Override
	public int lectureClassListCnt(Map<String, Object> paramMap) throws Exception {
		int totalCount = resumeDao.lectureClassListCnt(paramMap);
		return totalCount;
	}

	@Override
	public List<ResumeModel> lectureClassListDtl(Map<String, Object> paramMap) throws Exception {
		List<ResumeModel> lectureClassListDtl = resumeDao.lectureClassListDtl(paramMap);
		return lectureClassListDtl;
	}
	@Override
	public List<ResumeModel> ResumeList(Map<String, Object> paramMap) throws Exception {
		List<ResumeModel> ResumeList = resumeDao.ResumeList(paramMap);
		return ResumeList;
	}

	@Override
	public int lectureClassListDtlCnt(Map<String, Object> paramMap) throws Exception {
		int totalCount = resumeDao.lectureClassListDtlCnt(paramMap);
		return totalCount;
	}

	@Override
	public ResumeModel detailResume(Map<String, Object> paramMap) {
		ResumeModel detailResume = resumeDao.detailResume(paramMap);
		return detailResume;
	}

	

}
