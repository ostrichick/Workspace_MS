package ezen.maru.pjt.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVo {
	private int idx;
	private int member_idx;
	private String member_id;
	private String member_name;
	private String title;
	private String content;
	private Date wdate;
	private String category;
	private String isAnswered;
	private int parent_idx;
	private String file_original;
	private String file_system;
	private String file_extension;
	private int hit;
	private int reply_count;
	private String deleted_yn;
}
