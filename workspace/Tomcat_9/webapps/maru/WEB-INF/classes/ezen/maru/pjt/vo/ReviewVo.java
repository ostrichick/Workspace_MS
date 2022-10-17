package ezen.maru.pjt.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewVo {
  private int idx;
  private int product_idx;
  private String product_name;
  private int member_idx;
  private String member_name;
  private String content;
  private long star;
  private Date wdate;
  private String file_original;
  private String file_system;
  private String file_extension;
  private String deleted_yn;
}
