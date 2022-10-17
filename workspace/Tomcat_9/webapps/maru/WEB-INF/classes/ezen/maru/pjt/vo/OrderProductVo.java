package ezen.maru.pjt.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderProductVo extends CartVo {
	private int order_idx;
	private int product_idx;
	private int order_quantity;
}
