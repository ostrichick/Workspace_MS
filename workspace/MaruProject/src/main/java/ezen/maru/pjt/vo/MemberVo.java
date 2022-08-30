package ezen.maru.pjt.vo;

import java.util.Date;

public class MemberVo {

	//////////////
	// MARU end // 주석 아래부분 참고하여 작성 후 아래 부분은 삭제
	//////////////
	private int member_idx;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_handphone;
	private String member_gender;
	private int member_grade;
	private Date reg_date;
	private String del_yn;
	private int member_bak_idx;
	private String modify_type;
	private Date modify_date;
	private String modify_user;

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

	public int getMember_bak_idx() {
		return member_bak_idx;
	}

	public void setMember_bak_idx(int member_bak_idx) {
		this.member_bak_idx = member_bak_idx;
	}

	public String getModify_type() {
		return modify_type;
	}

	public void setModify_type(String modify_type) {
		this.modify_type = modify_type;
	}

	public Date getModify_date() {
		return modify_date;
	}

	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}

	public String getModify_user() {
		return modify_user;
	}

	public void setModify_user(String modify_user) {
		this.modify_user = modify_user;
	}

}
