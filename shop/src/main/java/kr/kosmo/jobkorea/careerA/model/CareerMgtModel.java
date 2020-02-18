package kr.kosmo.jobkorea.careerA.model;

import java.sql.Date;

public class CareerMgtModel {
		
	private int nt_no2;
	private int seq;
	private String loginID;
	private String name;
	private String hire_date;
	private String resign_date;
	private String cop_name;
	private String work_yn;

	
	public int getNt_no2() {
		return nt_no2;
	}
	public void setNt_no2(int nt_no2) {
		this.nt_no2 = nt_no2;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHire_date() {
		return hire_date;
	}
	public void setHire_date(String hire_date) {
		this.hire_date = hire_date;
	}
	public String getResign_date() {
		return resign_date;
	}
	public void setResign_date(String resign_date) {
		this.resign_date = resign_date;
	}
	public String getCop_name() {
		return cop_name;
	}
	public void setCop_name(String cop_name) {
		this.cop_name = cop_name;
	}
	public String getWork_yn() {
		return work_yn;
	}
	public void setWork_yn(String work_yn) {
		this.work_yn = work_yn;
	}
	
}
