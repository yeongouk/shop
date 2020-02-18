package kr.kosmo.jobkorea.manageC.model;

import java.util.Date;

public class QnACommentLJKKModel {
	
	private int c_no;
	private int wno;
	private String c_title;
	private String c_note;
	private String c_regId;
	private String c_reg_date;
	private Date c_update_date;
	
	
	
	public String getC_regId() {
		return c_regId;
	}
	public void setC_regId(String c_regId) {
		this.c_regId = c_regId;
	}
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public int getWno() {
		return wno;
	}
	public void setWno(int wno) {
		this.wno = wno;
	}
	public String getC_title() {
		return c_title;
	}
	public void setC_title(String c_title) {
		this.c_title = c_title;
	}
	public String getC_note() {
		return c_note;
	}
	public void setC_note(String c_note) {
		this.c_note = c_note;
	}
	public String getC_reg_date() {
		return c_reg_date;
	}
	public void setC_reg_date(String c_reg_date) {
		this.c_reg_date = c_reg_date;
	}
	public Date getC_update_date() {
		return c_update_date;
	}
	public void setC_update_date(Date c_update_date) {
		this.c_update_date = c_update_date;
	}
	@Override
	public String toString() {
		return "QnACommentLJKKModel [c_no=" + c_no + ", wno=" + wno + ", c_title=" + c_title + ", c_note=" + c_note
				+ ", c_regId=" + c_regId + ", c_reg_date=" + c_reg_date + ", c_update_date=" + c_update_date
				+ ", getC_regId()=" + getC_regId() + ", getC_no()=" + getC_no() + ", getWno()=" + getWno()
				+ ", getC_title()=" + getC_title() + ", getC_note()=" + getC_note() + ", getC_reg_date()="
				+ getC_reg_date() + ", getC_update_date()=" + getC_update_date() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	

}
