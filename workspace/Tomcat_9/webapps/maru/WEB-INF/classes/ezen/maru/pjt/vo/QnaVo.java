package ezen.maru.pjt.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QnaVo {
  private int idx;
  private int product_idx;
  private String product_name;
  private int member_idx;
  private String member_id;
  private String content;
  private int star;
  private String wdate;
  private String isAnswered;
  private int parent_idx;
  private String deleted_yn;
}
