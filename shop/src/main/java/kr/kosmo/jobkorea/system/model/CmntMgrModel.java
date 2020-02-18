package kr.kosmo.jobkorea.system.model;

public class CmntMgrModel {
	// 커뮤니티 ID *형식 : [접두어,2][일련번호,4]   예) BM0001
	private String cmnt_id;
	// 커뮤니티 명
	private String cmnt_nm;
	// 커뮤니티 구분 코드
	private String cmnt_dvs_cod;
	// 권한구분코드 R: 읽기전용, W:쓰기가능
	private String atrt_dvs_cod;
	// 답글 가능 유무
	private String rcnt_poa;
	// 덧글 가능 유무
	private String cmt_poa;
	// 사용 유무
	private String use_poa;
	// 삭제 유무
	private String dlt_poa;
	// 최초 등록 일시
	private String fst_enlm_dtt;
	// 최초 등록자 시스템 ID
	private String fst_rgst_sst_id;
	// 최종 수정 일시
	private String fnl_mdfd_dtt;
	// 최종 수정자 시스템 ID
	private String fnl_mdfr_sst_id;
	/**
	 * @return the cmnt_id
	 */
	public String getCmnt_id() {
		return cmnt_id;
	}
	/**
	 * @param cmnt_id the cmnt_id to set
	 */
	public void setCmnt_id(String cmnt_id) {
		this.cmnt_id = cmnt_id;
	}
	/**
	 * @return the cmnt_nm
	 */
	public String getCmnt_nm() {
		return cmnt_nm;
	}
	/**
	 * @param cmnt_nm the cmnt_nm to set
	 */
	public void setCmnt_nm(String cmnt_nm) {
		this.cmnt_nm = cmnt_nm;
	}
	/**
	 * @return the cmnt_dvs_cod
	 */
	public String getCmnt_dvs_cod() {
		return cmnt_dvs_cod;
	}
	/**
	 * @param cmnt_dvs_cod the cmnt_dvs_cod to set
	 */
	public void setCmnt_dvs_cod(String cmnt_dvs_cod) {
		this.cmnt_dvs_cod = cmnt_dvs_cod;
	}
	/**
	 * @return the atrt_dvs_cod
	 */
	public String getAtrt_dvs_cod() {
		return atrt_dvs_cod;
	}
	/**
	 * @param atrt_dvs_cod the atrt_dvs_cod to set
	 */
	public void setAtrt_dvs_cod(String atrt_dvs_cod) {
		this.atrt_dvs_cod = atrt_dvs_cod;
	}
	/**
	 * @return the rcnt_poa
	 */
	public String getRcnt_poa() {
		return rcnt_poa;
	}
	/**
	 * @param rcnt_poa the rcnt_poa to set
	 */
	public void setRcnt_poa(String rcnt_poa) {
		this.rcnt_poa = rcnt_poa;
	}
	/**
	 * @return the cmt_poa
	 */
	public String getCmt_poa() {
		return cmt_poa;
	}
	/**
	 * @param cmt_poa the cmt_poa to set
	 */
	public void setCmt_poa(String cmt_poa) {
		this.cmt_poa = cmt_poa;
	}
	/**
	 * @return the use_poa
	 */
	public String getUse_poa() {
		return use_poa;
	}
	/**
	 * @param use_poa the use_poa to set
	 */
	public void setUse_poa(String use_poa) {
		this.use_poa = use_poa;
	}
	/**
	 * @return the dlt_poa
	 */
	public String getDlt_poa() {
		return dlt_poa;
	}
	/**
	 * @param dlt_poa the dlt_poa to set
	 */
	public void setDlt_poa(String dlt_poa) {
		this.dlt_poa = dlt_poa;
	}
	/**
	 * @return the fst_enlm_dtt
	 */
	public String getFst_enlm_dtt() {
		return fst_enlm_dtt;
	}
	/**
	 * @param fst_enlm_dtt the fst_enlm_dtt to set
	 */
	public void setFst_enlm_dtt(String fst_enlm_dtt) {
		this.fst_enlm_dtt = fst_enlm_dtt;
	}
	/**
	 * @return the fst_rgst_sst_id
	 */
	public String getFst_rgst_sst_id() {
		return fst_rgst_sst_id;
	}
	/**
	 * @param fst_rgst_sst_id the fst_rgst_sst_id to set
	 */
	public void setFst_rgst_sst_id(String fst_rgst_sst_id) {
		this.fst_rgst_sst_id = fst_rgst_sst_id;
	}
	/**
	 * @return the fnl_mdfd_dtt
	 */
	public String getFnl_mdfd_dtt() {
		return fnl_mdfd_dtt;
	}
	/**
	 * @param fnl_mdfd_dtt the fnl_mdfd_dtt to set
	 */
	public void setFnl_mdfd_dtt(String fnl_mdfd_dtt) {
		this.fnl_mdfd_dtt = fnl_mdfd_dtt;
	}
	/**
	 * @return the fnl_mdfr_sst_id
	 */
	public String getFnl_mdfr_sst_id() {
		return fnl_mdfr_sst_id;
	}
	/**
	 * @param fnl_mdfr_sst_id the fnl_mdfr_sst_id to set
	 */
	public void setFnl_mdfr_sst_id(String fnl_mdfr_sst_id) {
		this.fnl_mdfr_sst_id = fnl_mdfr_sst_id;
	}
	
}
