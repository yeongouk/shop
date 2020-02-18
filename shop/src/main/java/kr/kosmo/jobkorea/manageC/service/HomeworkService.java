package kr.kosmo.jobkorea.manageC.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.kosmo.jobkorea.manageC.model.HomeworkModel;

public interface HomeworkService {
	
	public List<HomeworkModel> SelectHomeworkList(Map<String, Object> map) throws Exception;
	
	public int countHomeworklist(Map<String, Object> map) throws Exception;
	
	HomeworkModel selectHomeworkDtl(Map<String, Object> map) throws Exception;
	
	public void HomeworkReg(Map<String, String> map, HttpServletRequest request) throws Exception;
	
	public void HomeworkUpdate(Map<String, String> map, HttpServletRequest request) throws Exception;

	
	public void inserHomework(Map<String, Object> map);

	public void updateHomework(Map<String, Object> map);

	public void deleteHomework(Map<String, Object> map);
	

	
}
