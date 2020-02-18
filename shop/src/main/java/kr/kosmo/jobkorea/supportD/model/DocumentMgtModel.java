package kr.kosmo.jobkorea.supportD.model;

public class DocumentMgtModel {
	
	private String filename;
	private String filepath;
	private int filesize;
	private int nt_no;
	private String nt_title;
	private String nt_note;
	
	public int getNt_no() {
		return nt_no;
	}
	public void setNt_no(int nt_no) {
		this.nt_no = nt_no;
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
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}

}
