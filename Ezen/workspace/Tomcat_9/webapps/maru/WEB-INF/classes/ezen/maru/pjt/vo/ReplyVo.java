package ezen.maru.pjt.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReplyVo {
	private int idx;
	private int reply_idx;
	private int member_idx;
	private String member_id;
	private String member_name;
	private String reply_content;
	private String reply_date;
	private String deleted_yn;
}
