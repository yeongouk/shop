package kr.kosmo.jobkorea.system.model;

import java.sql.Date;

public class PcCurrentModel {
	
	private int pc_no;
	private String pc_name;
	private int seq;
	private String loginID;
	private String nocust_yn;
	private String login_time;
	private String logout_time;
	private int use_time;
	private String useYn;
	private String startdt;
	private String enddt;
	private int usehour;
	private int pcamt;
	private int amt;
	
	public int getPc_no() {
		return pc_no;
	}
	public void setPc_no(int pc_no) {
		this.pc_no = pc_no;
	}
	public String getPc_name() {
		return pc_name;
	}
	public void setPc_name(String pc_name) {
		this.pc_name = pc_name;
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
	public String getNocust_yn() {
		return nocust_yn;
	}
	public void setNocust_yn(String nocust_yn) {
		this.nocust_yn = nocust_yn;
	}
	public String getLogin_time() {
		return login_time;
	}
	public void setLogin_time(String login_time) {
		this.login_time = login_time;
	}
	public String getLogout_time() {
		return logout_time;
	}
	public void setLogout_time(String logout_time) {
		this.logout_time = logout_time;
	}
	public int getUse_time() {
		return use_time;
	}
	public void setUse_time(int use_time) {
		this.use_time = use_time;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getStartdt() {
		return startdt;
	}
	public void setStartdt(String startdt) {
		this.startdt = startdt;
	}
	public String getEnddt() {
		return enddt;
	}
	public void setEnddt(String enddt) {
		this.enddt = enddt;
	}
	public int getUsehour() {
		return usehour;
	}
	public void setUsehour(int usehour) {
		this.usehour = usehour;
	}
	public int getPcamt() {
		return pcamt;
	}
	public void setPcamt(int pcamt) {
		this.pcamt = pcamt;
	}
	public int getAmt() {
		return amt;
	}
	public void setAmt(int amt) {
		this.amt = amt;
	}
	
	

}
