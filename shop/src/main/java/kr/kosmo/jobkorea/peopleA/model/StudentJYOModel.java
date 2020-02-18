package kr.kosmo.jobkorea.peopleA.model;

public class StudentJYOModel {
	
	//게시판 글 번호
	private int row_num;

	//로그인 아이디
	private String loginID;

	//학생명
	private String st_name;
	
	//휴대전화
	private String st_phone_number;
	
	//가입일자
	private String st_reg_date;
	
	//시작일
	private String to_date;
	
	//종료일
	private String from_date;
	
	//생년월일
	private String st_birthday;
	
	//비밀번호
	private String st_password;
	
	

	
	public int getRow_num() {
		return row_num;
	}

	public void setRow_num(int row_num) {
		this.row_num = row_num;
	}

	public String getLoginID() {
		return loginID;
	}

	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}

	public String getSt_name() {
		return st_name;
	}

	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}

	public String getSt_phone_number() {
		return st_phone_number;
	}

	public void setSt_phone_number(String st_phone_number) {
		this.st_phone_number = st_phone_number;
	}

	public String getSt_reg_date() {
		return st_reg_date;
	}

	public void setSt_reg_date(String st_reg_date) {
		this.st_reg_date = st_reg_date;
	}
	
	public String getTo_date() {
		return to_date;
	}

	public void setTo_date(String to_date) {
		this.to_date = to_date;
	}

	public String getFrom_date() {
		return from_date;
	}

	public void setFrom_date(String from_date) {
		this.from_date = from_date;
	}

	public String getSt_birthday() {
		return st_birthday;
	}

	public void setSt_birthday(String st_birthday) {
		this.st_birthday = st_birthday;
	}
	
	public String getSt_password() {
		return st_password;
	}

	public void setSt_password(String st_password) {
		this.st_password = st_password;
	}

	
	
}//StudentJYOModel
