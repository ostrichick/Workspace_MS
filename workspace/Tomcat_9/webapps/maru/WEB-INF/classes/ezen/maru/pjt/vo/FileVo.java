package ezen.maru.pjt.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FileVo {

	private int product_idx;
	private int file_idx;
	private String file_original;
	private String file_system;
	private String file_extension;
}
