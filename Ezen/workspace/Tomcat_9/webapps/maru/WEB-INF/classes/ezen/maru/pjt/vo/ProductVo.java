package ezen.maru.pjt.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductVo extends FileVo {
  private String product_name;
  private int product_idx;
  private int product_price;
  private String product_sale; // 할인여부 Y N
  private int product_sale_percent;
  private int product_sale_price; // 할인 적용된 가격
  private String product_size; // 사이즈 500x1000
  private int product_inventory;
  private String product_major_category;
  private String product_isnew;
  private String product_detail;
  private double product_avgstar;
  private int product_hit;
  private String orderBy;

}
