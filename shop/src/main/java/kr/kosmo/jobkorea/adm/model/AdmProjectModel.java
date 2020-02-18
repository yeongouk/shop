package kr.kosmo.jobkorea.adm.model;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Locale;

import org.apache.tomcat.jni.Local;

public class AdmProjectModel {
		
		private int pro_admidx;	//관리자
		private int nmpidx;		//요청업체
		private int prohit;		//조회수
		private String pronewpart;	//업무구분
		private String proprioritize;	//우선순위 일반(10), 긴급(20)
		private String proworkspace;		//상주구분 상주(00), 재택(10), 협의(30)
		private String prosmsi;			//투입구분 si(10), sm(20), sism(30)
		private String proname;		//프로젝트명
		private String proskill;			//필요기술
		private String proclass;		//기술등급
		private String proinfo;		//상세설명
		private String propay;		//개발금액
		private String propayyn;		//협의가능여부
		private String propaywant;	//가격제안요청
		private String proindate;		//참여기간 시작
		private String prooutdate;	//참여기간 까지
		private String prosttdate;		//접수일
		private String proenddate;		//마감일
		private String prospacial;		//필수사항/우대사항
		private String prowantmem;		//특이사항
		private String proarea;		//근무장소
		private String proareatext;		//근무장소 기타
		private String pronotebook;		//장비지원 여부
		private String prosiksa;		//식사제공 여부
		private String prosookbak;		//숙박제공 여부
		private String projogen;		//근무조건 여부
		private String proonlinemeet;		//온라인 면접
		private String protelmeet;		//전화면접
		private String prodirmeet;		//직접면접
		private String proothermeet;	//추후면접
		private String projobid;		//잡코리아 아이디
		private String promemo;		//기타사항
		private String prowritedate;	//등록일자
		private String modifydate;	//수정일자
		private String deletedate;		//삭제일자
		private String prostatus;		//현재상태
		private String protop;	//상위노출여부
		private String proorder;	//사이트노출 여부
		
		private int proidx;	//일련번호
		/**
		 * @return the proidx
		 */
		public int getProidx() {
			return proidx;
		}
		/**
		 * @param proidx the proidx to set
		 */
		public void setProidx(int proidx) {
			this.proidx = proidx;
		}
		/**
		 * @return the pro_admidx
		 */
		public int getPro_admidx() {
			return pro_admidx;
		}
		/**
		 * @param pro_admidx the pro_admidx to set
		 */
		public void setPro_admidx(int pro_admidx) {
			this.pro_admidx = pro_admidx;
		}
		/**
		 * @return the nmpidx
		 */
		public int getNmpidx() {
			return nmpidx;
		}
		/**
		 * @param nmpidx the nmpidx to set
		 */
		public void setNmpidx(int nmpidx) {
			this.nmpidx = nmpidx;
		}
		/**
		 * @return the prohit
		 */
		public int getProhit() {
			return prohit;
		}
		/**
		 * @param prohit the prohit to set
		 */
		public void setProhit(int prohit) {
			this.prohit = prohit;
		}
		/**
		 * @return the pronewpart
		 */
		public String getPronewpart() {
			return pronewpart;
		}
		/**
		 * @param pronewpart the pronewpart to set
		 */
		public void setPronewpart(String pronewpart) {
			this.pronewpart = pronewpart;
		}
		/**
		 * @return the proprioritize
		 */
		public String getProprioritize() {
			return proprioritize;
		}
		/**
		 * @param proprioritize the proprioritize to set
		 */
		public void setProprioritize(String proprioritize) {
			this.proprioritize = proprioritize;
		}
		/**
		 * @return the proworkspace
		 */
		public String getProworkspace() {
			return proworkspace;
		}
		/**
		 * @param proworkspace the proworkspace to set
		 */
		public void setProworkspace(String proworkspace) {
			this.proworkspace = proworkspace;
		}
		/**
		 * @return the prosmsi
		 */
		public String getProsmsi() {
			return prosmsi;
		}
		/**
		 * @param prosmsi the prosmsi to set
		 */
		public void setProsmsi(String prosmsi) {
			this.prosmsi = prosmsi;
		}
		/**
		 * @return the proname
		 */
		public String getProname() {
			return proname;
		}
		/**
		 * @param proname the proname to set
		 */
		public void setProname(String proname) {
			this.proname = proname;
		}
		/**
		 * @return the proskill
		 */
		public String getProskill() {
			return proskill;
		}
		/**
		 * @param proskill the proskill to set
		 */
		public void setProskill(String proskill) {
			this.proskill = proskill;
		}
		/**
		 * @return the proclass
		 */
		public String getProclass() {
			return proclass;
		}
		/**
		 * @param proclass the proclass to set
		 */
		public void setProclass(String proclass) {
			this.proclass = proclass;
		}
		/**
		 * @return the proinfo
		 */
		public String getProinfo() {
			return proinfo;
		}
		/**
		 * @param proinfo the proinfo to set
		 */
		public void setProinfo(String proinfo) {
			this.proinfo = proinfo;
		}
		/**
		 * @return the propay
		 */
		public String getPropay() {
			return propay;
		}
		/**
		 * @param propay the propay to set
		 */
		public void setPropay(String propay) {
			this.propay = propay;
		}
		/**
		 * @return the propayyn
		 */
		public String getPropayyn() {
			return propayyn;
		}
		/**
		 * @param propayyn the propayyn to set
		 */
		public void setPropayyn(String propayyn) {
			this.propayyn = propayyn;
		}
		/**
		 * @return the propaywant
		 */
		public String getPropaywant() {
			return propaywant;
		}
		/**
		 * @param propaywant the propaywant to set
		 */
		public void setPropaywant(String propaywant) {
			this.propaywant = propaywant;
		}
		/**
		 * @return the proindate
		 */
		public String getProindate() {
			return proindate;
		}
		/**
		 * @param proindate the proindate to set
		 */
		public void setProindate(String proindate) {
			this.proindate = proindate;
		}
		/**
		 * @return the prooutdate
		 */
		public String getProoutdate() {
			return prooutdate;
		}
		/**
		 * @param prooutdate the prooutdate to set
		 */
		public void setProoutdate(String prooutdate) {
			this.prooutdate = prooutdate;
		}
		/**
		 * @return the prosttdate
		 */
		public String getProsttdate() {
			return prosttdate;
		}
		/**
		 * @param prosttdate the prosttdate to set
		 */
		public void setProsttdate(String prosttdate) {
			this.prosttdate = prosttdate;
		}
		/**
		 * @return the proenddate
		 */
		public String getProenddate() {
			return proenddate;
		}
		/**
		 * @param proenddate the proenddate to set
		 */
		public void setProenddate(String proenddate) {
			this.proenddate = proenddate;
		}
		/**
		 * @return the prospacial
		 */
		public String getProspacial() {
			return prospacial;
		}
		/**
		 * @param prospacial the prospacial to set
		 */
		public void setProspacial(String prospacial) {
			this.prospacial = prospacial;
		}
		/**
		 * @return the prowantmem
		 */
		public String getProwantmem() {
			return prowantmem;
		}
		/**
		 * @param prowantmen the prowantmen to set
		 */
		public void setProwantmem(String prowantmem) {
			this.prowantmem = prowantmem;
		}
		/**
		 * @return the proarea
		 */
		public String getProarea() {
			return proarea;
		}
		/**
		 * @param proarea the proarea to set
		 */
		public void setProarea(String proarea) {
			this.proarea = proarea;
		}
		/**
		 * @return the proareatext
		 */
		public String getProareatext() {
			return proareatext;
		}
		/**
		 * @param proareatext the proareatext to set
		 */
		public void setProareatext(String proareatext) {
			this.proareatext = proareatext;
		}
		/**
		 * @return the pronotebook
		 */
		public String getPronotebook() {
			return pronotebook;
		}
		/**
		 * @param pronotebook the pronotebook to set
		 */
		public void setPronotebook(String pronotebook) {
			this.pronotebook = pronotebook;
		}
		/**
		 * @return the prosiksa
		 */
		public String getProsiksa() {
			return prosiksa;
		}
		/**
		 * @param prosiksa the prosiksa to set
		 */
		public void setProsiksa(String prosiksa) {
			this.prosiksa = prosiksa;
		}
		/**
		 * @return the prosookbak
		 */
		public String getProsookbak() {
			return prosookbak;
		}
		/**
		 * @param prosookbak the prosookbak to set
		 */
		public void setProsookbak(String prosookbak) {
			this.prosookbak = prosookbak;
		}
		/**
		 * @return the projogen
		 */
		public String getProjogen() {
			return projogen;
		}
		/**
		 * @param projogen the projogen to set
		 */
		public void setProjogen(String projogen) {
			this.projogen = projogen;
		}
		/**
		 * @return the proonlinemeet
		 */
		public String getProonlinemeet() {
			return proonlinemeet;
		}
		/**
		 * @param pronlinemeet the pronlinemeet to set
		 */
		public void setProonlinemeet(String proonlinemeet) {
			this.proonlinemeet = proonlinemeet;
		}
		/**
		 * @return the protelmeet
		 */
		public String getProtelmeet() {
			return protelmeet;
		} 
		/**
		 * @param protelmeet the protelmeet to set
		 */
		public void setProtelmeet(String protelmeet) {
			this.protelmeet = protelmeet;
		}
		/**
		 * @return the prodirmeet
		 */
		public String getProdirmeet() {
			return prodirmeet;
		}
		/**
		 * @param prodirmeet the prodirmeet to set
		 */
		public void setProdirmeet(String prodirmeet) {
			this.prodirmeet = prodirmeet;
		}
		/**
		 * @return the proothermeet
		 */
		public String getProothermeet() {
			return proothermeet;
		}
		/**
		 * @param proothermeet the proothermeet to set
		 */
		public void setProothermeet(String proothermeet) {
			this.proothermeet = proothermeet;
		}
		/**
		 * @return the projobid
		 */
		public String getProjobid() {
			return projobid;
		}
		/**
		 * @param projobid the projobid to set
		 */
		public void setProjobid(String projobid) {
			this.projobid = projobid;
		}
		/**
		 * @return the promemo
		 */
		public String getPromemo() {
			return promemo;
		}
		/**
		 * @param promemo the promemo to set
		 */
		public void setPromemo(String promemo) {
			this.promemo = promemo;
		}
		/**
		 * @return the prowritedate  
		 */
		public String getProwritedate() {
			return prowritedate;
		}
		/**
		 * @param prowritedate the prowritedate to set
		 */
		public void setProwritedate(String prowritedate) {
			this.prowritedate = prowritedate;
		}
		/**
		 * @return the modifydate
		 */
		public String getModifydate() {
			return modifydate;
		}
		/**
		 * @param modifydate the modifydate to set
		 */
		public void setModifydate(String modifydate) {
			this.modifydate = modifydate;
		}
		/**
		 * @return the deletedate
		 */
		public String getDeletedate() {
			return deletedate;
		}
		/**
		 * @param deletedate the deletedate to set
		 */
		public void setDeletedate(String deletedate) {
			this.deletedate = deletedate;
		}
		/**
		 * @return the prostatus
		 */
		public String getProstatus() {
			return prostatus;
		}
		/**
		 * @param prostatus the prostatus to set
		 */
		public void setProstatus(String prostatus) {
			this.prostatus = prostatus;
		}
		/**
		 * @return the protop
		 */
		public String getProtop() {
			return protop;
		}
		/**
		 * @param protop the protop to set
		 */
		public void setProtop(String protop) {
			this.protop = protop;
		}
		/**
		 * @return the proorder
		 */
		public String getProorder() {
			return proorder;
		}
		/**
		 * @param proorder the proorder to set
		 */
		public void setProorder(String proorder) {
			this.proorder = proorder;
		}
}
