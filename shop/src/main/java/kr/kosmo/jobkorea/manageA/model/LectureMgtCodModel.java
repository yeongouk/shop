package kr.kosmo.jobkorea.manageA.model;

public class LectureMgtCodModel {
	
	private int no;
	private String title;
	private String loginID;
	private String pcnt;
	private String note;
	
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLoginID() {
		return loginID;
	}

	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}

	public String getPcnt() {
		return pcnt;
	}

	public void setPcnt(String pcnt) {
		this.pcnt = pcnt;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	
	
	// 게시판 글 번호
	private int row_num;


	public int getRow_num() {
		return row_num;
	}

	public void setRow_num(int row_num) {
		this.row_num = row_num;
	}

	
}
