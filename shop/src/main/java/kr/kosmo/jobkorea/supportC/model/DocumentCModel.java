package kr.kosmo.jobkorea.supportC.model;

public class DocumentCModel {

	private int nt_no;
	private String loginID;
	private String nt_title;
	private String nt_note;
	private String write_date;
	private String filename;
	private String filepath;
	private String filesize;
	
	
	public int getNt_no() {
		return nt_no;
	}
	public void setNt_no(int nt_no) {
		this.nt_no = nt_no;
	}
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	public String getNt_title() {
		return nt_title;
	}
	public void setNt_title(String nt_title) {
		this.nt_title = nt_title;
	}
	public String getNt_note() {
		return nt_note;
	}
	public void setNt_note(String nt_note) {
		this.nt_note = nt_note;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getFilesize() {
		return filesize;
	}
	public void setFilesize(String filesize) {
		this.filesize = filesize;
	}
	@Override
	public String toString() {
		return "DocumentCModel [nt_no=" + nt_no + ", loginID=" + loginID + ", nt_title=" + nt_title + ", nt_note="
				+ nt_note + ", write_date=" + write_date + ", filename=" + filename + ", filepath=" + filepath
				+ ", filesize=" + filesize + "]";
	}
	
	
	
	
	
	
}
