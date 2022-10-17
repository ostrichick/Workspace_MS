package ezen.maru.pjt.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberInfoVo {
	private int member_idx;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_email;
	private String member_phone;
	private String member_addr;
	private String member_addr2;
	private int member_postcode;
	private Date member_date;
	private Date mamber_last_visit;
	private int member_grade;
	private String member_admin;
	private String salt;
	private String deleted_yn;
}
