package kr.kosmo.jobkorea.supportC.model;

public class TcourseModel {
	
	private String no;
	
	private String loginID;
	
	private String restyn; 
	
	private String evaluation;

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getLoginID() {
		return loginID;
	}

	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}

	public String getRestyn() {
		return restyn;
	}

	public void setRestyn(String restyn) {
		this.restyn = restyn;
	}

	public String getEvaluation() {
		return evaluation;
	}

	public void setEvaluation(String evaluation) {
		this.evaluation = evaluation;
	}

	@Override
	public String toString() {
		return "TcourseModel [no=" + no + ", loginID=" + loginID + ", restyn=" + restyn + ", evaluation=" + evaluation
				+ "]";
	}
	
	
	

}
