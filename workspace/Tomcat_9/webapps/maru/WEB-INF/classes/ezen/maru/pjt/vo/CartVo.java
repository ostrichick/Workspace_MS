package ezen.maru.pjt.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CartVo extends ProductVo {
	private int cart_idx;
	private int member_idx;
	private int product_idx;
	private int cart_product_number;
	private String ischecked;
}
