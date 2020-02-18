package kr.kosmo.jobkorea.adm.dto;

import org.apache.ibatis.type.Alias;

@Alias("AdmProjectDTO")
public class AdmProjectDTO {

	private String area;
	private String work_type;
	private String industry_type;
	private String project_name;
	private String reg_date;
	private String receive_to_date;
	private String regId;
	private String LanguageCD;
	private String WebCd;
	private String receive_fr_date;
	private String work_loc;
	private String OSCD;
	private String DBCD;
	private String NTCD;
	private String FWCD;
	private String WSCD;
	private String low;
	private String middle;
	private String high;
	private String special;
	private String work_fr_date;
	private String work_to_date;
	private String note;
	private String option_order;
	private String notice;
	private String rdo1;
	private String rdo2;
	private String rdo3;
	private String tel;
	private String loc;
	
	
	public AdmProjectDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdmProjectDTO(String area, String work_type, String industry_type, String project_name, String reg_date,
			String receive_to_date, String regId, String languageCD, String webCd, String receive_fr_date,
			String work_loc, String oSCD, String dBCD, String nTCD, String fWCD, String wSCD, String low, String middle,
			String high, String special, String work_fr_date, String work_to_date, String note, String option_order,
			String notice, String rdo1, String rdo2, String rdo3, String tel, String loc) {
		super();
		this.area = area;
		this.work_type = work_type;
		this.industry_type = industry_type;
		this.project_name = project_name;
		this.reg_date = reg_date;
		this.receive_to_date = receive_to_date;
		this.regId = regId;
		LanguageCD = languageCD;
		WebCd = webCd;
		this.receive_fr_date = receive_fr_date;
		this.work_loc = work_loc;
		OSCD = oSCD;
		DBCD = dBCD;
		NTCD = nTCD;
		FWCD = fWCD;
		WSCD = wSCD;
		this.low = low;
		this.middle = middle;
		this.high = high;
		this.special = special;
		this.work_fr_date = work_fr_date;
		this.work_to_date = work_to_date;
		this.note = note;
		this.option_order = option_order;
		this.notice = notice;
		this.rdo1 = rdo1;
		this.rdo2 = rdo2;
		this.rdo3 = rdo3;
		this.tel = tel;
		this.loc = loc;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getWork_type() {
		return work_type;
	}
	public void setWork_type(String work_type) {
		this.work_type = work_type;
	}
	public String getIndustry_type() {
		return industry_type;
	}
	public void setIndustry_type(String industry_type) {
		this.industry_type = industry_type;
	}
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getReceive_to_date() {
		return receive_to_date;
	}
	public void setReceive_to_date(String receive_to_date) {
		this.receive_to_date = receive_to_date;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getLanguageCD() {
		return LanguageCD;
	}
	public void setLanguageCD(String languageCD) {
		LanguageCD = languageCD;
	}
	public String getWebCd() {
		return WebCd;
	}
	public void setWebCd(String webCd) {
		WebCd = webCd;
	}
	public String getReceive_fr_date() {
		return receive_fr_date;
	}
	public void setReceive_fr_date(String receive_fr_date) {
		this.receive_fr_date = receive_fr_date;
	}
	public String getWork_loc() {
		return work_loc;
	}
	public void setWork_loc(String work_loc) {
		this.work_loc = work_loc;
	}
	public String getOSCD() {
		return OSCD;
	}
	public void setOSCD(String oSCD) {
		OSCD = oSCD;
	}
	public String getDBCD() {
		return DBCD;
	}
	public void setDBCD(String dBCD) {
		DBCD = dBCD;
	}
	public String getNTCD() {
		return NTCD;
	}
	public void setNTCD(String nTCD) {
		NTCD = nTCD;
	}
	public String getFWCD() {
		return FWCD;
	}
	public void setFWCD(String fWCD) {
		FWCD = fWCD;
	}
	public String getWSCD() {
		return WSCD;
	}
	public void setWSCD(String wSCD) {
		WSCD = wSCD;
	}
	public String getLow() {
		return low;
	}
	public void setLow(String low) {
		this.low = low;
	}
	public String getMiddle() {
		return middle;
	}
	public void setMiddle(String middle) {
		this.middle = middle;
	}
	public String getHigh() {
		return high;
	}
	public void setHigh(String high) {
		this.high = high;
	}
	public String getSpecial() {
		return special;
	}
	public void setSpecial(String special) {
		this.special = special;
	}
	public String getWork_fr_date() {
		return work_fr_date;
	}
	public void setWork_fr_date(String work_fr_date) {
		this.work_fr_date = work_fr_date;
	}
	public String getWork_to_date() {
		return work_to_date;
	}
	public void setWork_to_date(String work_to_date) {
		this.work_to_date = work_to_date;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getOption_order() {
		return option_order;
	}
	public void setOption_order(String option_order) {
		this.option_order = option_order;
	}
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public String getRdo1() {
		return rdo1;
	}
	public void setRdo1(String rdo1) {
		this.rdo1 = rdo1;
	}
	public String getRdo2() {
		return rdo2;
	}
	public void setRdo2(String rdo2) {
		this.rdo2 = rdo2;
	}
	public String getRdo3() {
		return rdo3;
	}
	public void setRdo3(String rdo3) {
		this.rdo3 = rdo3;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	@Override
	public String toString() {
		return "AdmProjectDTO [area=" + area + ", work_type=" + work_type + ", industry_type=" + industry_type
				+ ", project_name=" + project_name + ", reg_date=" + reg_date + ", receive_to_date=" + receive_to_date
				+ ", regId=" + regId + ", LanguageCD=" + LanguageCD + ", WebCd=" + WebCd + ", receive_fr_date="
				+ receive_fr_date + ", work_loc=" + work_loc + ", OSCD=" + OSCD + ", DBCD=" + DBCD + ", NTCD=" + NTCD
				+ ", FWCD=" + FWCD + ", WSCD=" + WSCD + ", low=" + low + ", middle=" + middle + ", high=" + high
				+ ", special=" + special + ", work_fr_date=" + work_fr_date + ", work_to_date=" + work_to_date
				+ ", note=" + note + ", option_order=" + option_order + ", notice=" + notice + ", rdo1=" + rdo1
				+ ", rdo2=" + rdo2 + ", rdo3=" + rdo3 + ", tel=" + tel + ", loc=" + loc + "]";
	}
	
	
	
	
}
