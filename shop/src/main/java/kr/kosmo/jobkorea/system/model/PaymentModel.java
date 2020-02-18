package kr.kosmo.jobkorea.system.model;

public class PaymentModel {

    private String pc_no;
	private String loginID;
	private int seq;
	private int pcuseamt;
	private int foodamt;
	private int totalamt;
	private String cpl_yn;
	
	public String getPc_no() {
		return pc_no;
	}

	public void setPc_no(String pc_no) {
		this.pc_no = pc_no;
	}

	public String getLoginID() {
		return loginID;
	}

	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getPcuseamt() {
		return pcuseamt;
	}

	public void setPcuseamt(int pcuseamt) {
		this.pcuseamt = pcuseamt;
	}

	public int getFoodamt() {
		return foodamt;
	}

	public void setFoodamt(int foodamt) {
		this.foodamt = foodamt;
	}

	public int getTotalamt() {
		return totalamt;
	}

	public void setTotalamt(int totalamt) {
		this.totalamt = totalamt;
	}

	public String getCpl_yn() {
		return cpl_yn;
	}

	public void setCpl_yn(String cpl_yn) {
		this.cpl_yn = cpl_yn;
	}

	@Override
	public String toString() {
		return "PaymentOrderModel [pc_no=" + pc_no + ", loginID=" + loginID + ", seq=" + seq + ", pcuseamt=" + pcuseamt
				+ ", foodamt=" + foodamt + ", totalamt=" + totalamt + ", cpl_yn=" + cpl_yn + "]";
	}
	
	
}
