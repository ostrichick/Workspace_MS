package ezen.maru.pjt.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderVo extends CartVo {
	private int order_idx;
	private int member_idx;
	private int cart_idx;
	private Date order_date;
	private int order_total_price;
	private String order_name;
	private String order_address;
	private String order_address2;
	private int order_postcode;
	private String order_phone;
	private String order_status;
	private String order_cancel_yn;
	private String order_refund_yn;
}
