package ezen.maru.pjt.vo;

import java.util.Date;

public class MemberInfoVo {
	private int member_idx;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_email;
	private int member_phone;
	private String member_addr;
	private String member_addr2;
	private int member_postcode;
	private Date member_date;
	private Date mamber_last_visit;
	private int member_grade;
	private String member_admin;
	private String deleted_yn;

	@Override
	public String toString() {
		return "MemberInfoVo [member_idx=" + member_idx + ", member_id=" + member_id + ", member_pw=" + member_pw
				+ ", member_name=" + member_name + ", member_email=" + member_email + ", member_phone=" + member_phone
				+ ", member_addr=" + member_addr + ", member_addr2=" + member_addr2 + ", member_postcode="
				+ member_postcode + ", member_date=" + member_date + ", mamber_last_visit=" + mamber_last_visit
				+ ", member_grade=" + member_grade + ", member_admin=" + member_admin + ", deleted_yn=" + deleted_yn
				+ "]";
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

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public int getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(int member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_addr() {
		return member_addr;
	}

	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}

	public String getMember_addr2() {
		return member_addr2;
	}

	public void setMember_addr2(String member_addr2) {
		this.member_addr2 = member_addr2;
	}

	public int getMember_postcode() {
		return member_postcode;
	}

	public void setMember_postcode(int member_postcode) {
		this.member_postcode = member_postcode;
	}

	public Date getMember_date() {
		return member_date;
	}

	public void setMember_date(Date member_date) {
		this.member_date = member_date;
	}

	public Date getMamber_last_visit() {
		return mamber_last_visit;
	}

	public void setMamber_last_visit(Date mamber_last_visit) {
		this.mamber_last_visit = mamber_last_visit;
	}

	public int getMember_grade() {
		return member_grade;
	}

	public void setMember_grade(int member_grade) {
		this.member_grade = member_grade;
	}

	public String getMember_admin() {
		return member_admin;
	}

	public void setMember_admin(String member_admin) {
		this.member_admin = member_admin;
	}

	public String getDeleted_yn() {
		return deleted_yn;
	}

	public void setDeleted_yn(String deleted_yn) {
		this.deleted_yn = deleted_yn;
	}
}
