
/* Drop Tables */

DROP TABLE ordered_product CASCADE CONSTRAINTS;
DROP TABLE order_info CASCADE CONSTRAINTS;




/* Create Tables */

-- 주문제품
CREATE TABLE ordered_product
(
	-- 제품번호
	product_id number NOT NULL,
	-- 주문번호 : 주문애번오
	order_id number NOT NULL,
	-- 제품명
	product_name varchar2(30) NOT NULL,
	-- 제품단가
	product_price number NOT NULL,
	PRIMARY KEY (product_id, order_id)
);


-- 주문정보
CREATE TABLE order_info
(
	-- 주문번호 : 주문애번오
	order_id number NOT NULL,
	-- 주문날짜 : 주문을한날짜
	order_date date DEFAULT sysdate NOT NULL,
	-- 배송요청날짜 : 배송요청날짜
	delivery_date char(10),
	PRIMARY KEY (order_id)
);



/* Create Foreign Keys */

ALTER TABLE ordered_product
	ADD FOREIGN KEY (order_id)
	REFERENCES order_info (order_id)
;



/* Comments */

COMMENT ON TABLE ordered_product IS '주문제품';
COMMENT ON COLUMN ordered_product.product_id IS '제품번호';
COMMENT ON COLUMN ordered_product.order_id IS '주문번호 : 주문애번오';
COMMENT ON COLUMN ordered_product.product_name IS '제품명';
COMMENT ON COLUMN ordered_product.product_price IS '제품단가';
COMMENT ON TABLE order_info IS '주문정보';
COMMENT ON COLUMN order_info.order_id IS '주문번호 : 주문애번오';
COMMENT ON COLUMN order_info.order_date IS '주문날짜 : 주문을한날짜';
COMMENT ON COLUMN order_info.delivery_date IS '배송요청날짜 : 배송요청날짜';



