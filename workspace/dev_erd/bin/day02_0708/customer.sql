
/* Drop Tables */

DROP TABLE delivery CASCADE CONSTRAINTS;
DROP TABLE order_list CASCADE CONSTRAINTS;
DROP TABLE place_order CASCADE CONSTRAINTS;
DROP TABLE customer CASCADE CONSTRAINTS;




/* Create Tables */

-- 고객
CREATE TABLE customer
(
	-- 고객번호
	customer_ID char(20) NOT NULL,
	-- 고객명
	name varchar2(20) NOT NULL,
	-- 주소
	addr varchar2(100),
	-- 전화번호
	phone char(20),
	PRIMARY KEY (customer_ID)
);


-- 배송
CREATE TABLE delivery
(
	-- 배송번호
	delivery_ID char(10) NOT NULL,
	-- 주문번호
	order_ID char(10) NOT NULL,
	-- 제품번호
	product_ID char(10) NOT NULL,
	-- 배송방법
	delivery_method varchar2(20) NOT NULL,
	-- 배송일시
	delivery_date date NOT NULL,
	-- 고객번호
	customer_ID char(20) NOT NULL,
	PRIMARY KEY (delivery_ID)
);


-- 주문목록
CREATE TABLE order_list
(
	-- 주문번호
	order_ID char(10) NOT NULL,
	-- 제품번호
	product_ID char(10) NOT NULL,
	-- 주문목록수량 
	orderlist_num char(10) NOT NULL,
	PRIMARY KEY (order_ID, product_ID)
);


-- 주문
CREATE TABLE place_order
(
	-- 주문번호
	order_ID char(10) NOT NULL,
	-- 고객번호
	customer_ID char(20) NOT NULL,
	-- 주문수량
	order_num char(10) NOT NULL,
	PRIMARY KEY (order_ID)
);



/* Create Foreign Keys */

ALTER TABLE delivery
	ADD FOREIGN KEY (customer_ID)
	REFERENCES customer (customer_ID)
;


ALTER TABLE place_order
	ADD FOREIGN KEY (customer_ID)
	REFERENCES customer (customer_ID)
;


ALTER TABLE delivery
	ADD FOREIGN KEY (order_ID, product_ID)
	REFERENCES order_list (order_ID, product_ID)
;


ALTER TABLE order_list
	ADD FOREIGN KEY (order_ID)
	REFERENCES place_order (order_ID)
;



/* Comments */

COMMENT ON TABLE customer IS '고객';
COMMENT ON COLUMN customer.customer_ID IS '고객번호';
COMMENT ON COLUMN customer.name IS '고객명';
COMMENT ON COLUMN customer.addr IS '주소';
COMMENT ON COLUMN customer.phone IS '전화번호';
COMMENT ON TABLE delivery IS '배송';
COMMENT ON COLUMN delivery.delivery_ID IS '배송번호';
COMMENT ON COLUMN delivery.order_ID IS '주문번호';
COMMENT ON COLUMN delivery.product_ID IS '제품번호';
COMMENT ON COLUMN delivery.delivery_method IS '배송방법';
COMMENT ON COLUMN delivery.delivery_date IS '배송일시';
COMMENT ON COLUMN delivery.customer_ID IS '고객번호';
COMMENT ON TABLE order_list IS '주문목록';
COMMENT ON COLUMN order_list.order_ID IS '주문번호';
COMMENT ON COLUMN order_list.product_ID IS '제품번호';
COMMENT ON COLUMN order_list.orderlist_num IS '주문목록수량 ';
COMMENT ON TABLE place_order IS '주문';
COMMENT ON COLUMN place_order.order_ID IS '주문번호';
COMMENT ON COLUMN place_order.customer_ID IS '고객번호';
COMMENT ON COLUMN place_order.order_num IS '주문수량';



