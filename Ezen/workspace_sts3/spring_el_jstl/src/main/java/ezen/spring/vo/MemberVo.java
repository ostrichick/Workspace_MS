package ezen.spring.vo;

import java.util.Date;

public class MemberVo {
	// member_idx number not null primary key,
	// member_id varchar2(50) not null unique,
	// member_pw varchar2(20) not null,
	// member_name varchar2(30) not null,
	// member_handphone char(20),
	// member_gender char(2),
	// member_grade number(1) default 0,
	// reg_date date default sysdate,
	// del_yn char(2) default 'N'
	private int member_idx;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_handphone;
	private String member_gender;
	private int member_grade;
	private Date reg_date;
	private String del_yn;

	public MemberVo() {
		super();
	}

	public MemberVo(String member_id, String member_pw, String member_name, String member_handphone,
			String member_gender) {
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_handphone = member_handphone;
		this.member_gender = member_gender;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_handphone() {
		return member_handphone;
	}

	public void setMember_handphone(String member_handphone) {
		this.member_handphone = member_handphone;
	}

	public String getMember_gender() {
		return member_gender;
	}

	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}

	public int getMember_grade() {
		return member_grade;
	}

	public void setMember_grade(int member_grade) {
		this.member_grade = member_grade;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public String getDel_yn() {
		return del_yn;
	}

	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
}
