package ezen.dev.spring;

import java.util.List;

public class MemberVo {
	private String member_id;
	private String member_pw;
	private String member_name;
	private List<String> field_interests;
	
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
	public List<String> getField_interests() {
		return field_interests;
	}
	public void setField_interests(List<String> field_interests) {
		this.field_interests = field_interests;
	}
	
	
}
