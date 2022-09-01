
/* Drop Triggers */

DROP TRIGGER TRI_announce_idx;
DROP TRIGGER TRI_delivery_info_delivery_idx;
DROP TRIGGER TRI_member_info_member_idx;
DROP TRIGGER TRI_order_log_order_idx;
DROP TRIGGER TRI_product_cart_cart_idx;
DROP TRIGGER TRI_product_photo_idx;
DROP TRIGGER TRI_product_product_idx;
DROP TRIGGER TRI_product_qna_idx;
DROP TRIGGER TRI_qnaservice_idx;
DROP TRIGGER TRI_review_tbl_idx;



/* Drop Tables */

DROP TABLE announce CASCADE CONSTRAINTS;
DROP TABLE delivery_info CASCADE CONSTRAINTS;
DROP TABLE order_change_cancel_refund CASCADE CONSTRAINTS;
DROP TABLE order_product CASCADE CONSTRAINTS;
DROP TABLE order_log CASCADE CONSTRAINTS;
DROP TABLE product_cart CASCADE CONSTRAINTS;
DROP TABLE product_qna CASCADE CONSTRAINTS;
DROP TABLE qnaservice CASCADE CONSTRAINTS;
DROP TABLE review_tbl CASCADE CONSTRAINTS;
DROP TABLE member_info CASCADE CONSTRAINTS;
DROP TABLE product_photo CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_announce_idx;
DROP SEQUENCE SEQ_delivery_info_delivery_idx;
DROP SEQUENCE SEQ_member_info_member_idx;
DROP SEQUENCE SEQ_order_log_order_idx;
DROP SEQUENCE SEQ_product_cart_cart_idx;
DROP SEQUENCE SEQ_product_photo_idx;
DROP SEQUENCE SEQ_product_product_idx;
DROP SEQUENCE SEQ_product_qna_idx;
DROP SEQUENCE SEQ_qnaservice_idx;
DROP SEQUENCE SEQ_review_tbl_idx;




/* Create Sequences */

CREATE SEQUENCE SEQ_announce_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_delivery_info_delivery_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_member_info_member_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_order_log_order_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_product_cart_cart_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_product_photo_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_product_product_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_product_qna_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_qnaservice_idx INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_review_tbl_idx INCREMENT BY 1 START WITH 1;



/* Create Tables */

-- 공지사항 게시판
CREATE TABLE announce
(
	-- 공지사항 번호
	idx number NOT NULL,
	-- 공지사항 제목
	title varchar2(90) NOT NULL,
	-- 공지사항 내용
	content varchar2(1500) NOT NULL,
	-- 공지 게시일
	wdate date DEFAULT sysdate NOT NULL,
	-- 파일 원본 이름
	file_original varchar2(90),
	-- 파일 시스템이름
	file_system varchar2(90),
	-- 파일 확장자
	file_extension varchar2(10),
	-- 조회수
	hit number DEFAULT 0,
	PRIMARY KEY (idx)
);


-- 배송 정보
CREATE TABLE delivery_info
(
	-- 시스템 배송 번호
	delivery_idx number NOT NULL,
	-- 택배사 송장 번호
	delivery_code varchar2(50),
	-- 주문번호
	order_idx number NOT NULL,
	-- 배송 예정일
	delivery_duedate date DEFAULT sysdate,
	-- 배송 상태
	delivery_status number,
	PRIMARY KEY (delivery_idx)
);


-- 회원관리
CREATE TABLE member_info
(
	-- 회원번호
	member_idx number NOT NULL,
	-- 아이디
	member_id varchar2(30) NOT NULL UNIQUE,
	-- 패스워드
	member_pw varchar2(50) NOT NULL,
	-- 이름
	member_name varchar2(30) NOT NULL,
	-- 이메일
	member_email varchar2(100) NOT NULL,
	-- 전화번호
	member_phone number NOT NULL,
	-- 회원주소
	member_addr varchar2(255) NOT NULL,
	-- 상세주소
	member_addr2 varchar2(255) NOT NULL,
	-- 우편번호
	member_postcode number(5,0) NOT NULL,
	-- 가입일
	member_date date DEFAULT sysdate,
	-- 마지막 방문일
	mamber_last_visit date DEFAULT sysdate,
	-- 회원 등급
	member_grade varchar2(3) DEFAULT '0' NOT NULL,
	-- 관리자여부
	member_admin varchar2(3) DEFAULT 'N' NOT NULL,
	-- 탈퇴여부
	deleted_yn varchar2(3) DEFAULT 'N' NOT NULL,
	PRIMARY KEY (member_idx)
);


-- 주문 교환 취소 환불
CREATE TABLE order_change_cancel_refund
(
	-- 주문번호
	order_idx number NOT NULL,
	-- 교환 취소 환불 여부
	order_type varchar2(6) NOT NULL,
	-- 환불 금액
	order_refund_money number,
	-- 교환 취소 환불 진행상황
	order_ccr_status varchar2(30),
	PRIMARY KEY (order_idx)
);


-- 주문 내역
CREATE TABLE order_log
(
	-- 주문번호
	order_idx number NOT NULL,
	-- 회원번호
	member_idx number NOT NULL,
	-- 주문날자
	order_date date DEFAULT sysdate NOT NULL,
	-- 주문 총 가격
	order_total_price number NOT NULL,
	-- 수령자 이름
	order_name varchar2(20),
	-- 수령자 주소1
	order_address varchar2(90),
	-- 수령자 주소2
	order_address2 varchar2(90),
	-- 수령자 우편번호
	order_postcode number,
	-- 수령자 전화번호
	order_phone number,
	-- 주문 진행 상태 : 10은 배송전
	-- 20은 배송중
	-- 30는 배송완료
	order_state number NOT NULL,
	-- 주문 취소 여부
	order_cancel varchar2(3) DEFAULT 'N' NOT NULL,
	-- 주문 환불 여부
	order_refund varchar2(3) DEFAULT 'N' NOT NULL,
	PRIMARY KEY (order_idx)
);


-- 주문 상품
CREATE TABLE order_product
(
	-- 주문번호
	order_idx number NOT NULL,
	-- 상품번호
	product_idx number NOT NULL UNIQUE,
	-- 주문 개수
	order_quantity number NOT NULL
);


-- 상품
CREATE TABLE product
(
	-- 상품번호
	product_idx number NOT NULL,
	-- 상품명
	product_name varchar2(90) NOT NULL,
	-- 상품가격
	product_price number NOT NULL,
	-- 할인 여부
	product_sale varchar2(3) DEFAULT 'N' NOT NULL,
	-- 상품 할인율
	product_sale_percent number DEFAULT 0,
	-- 상품 규격 (100x200)
	product_size varchar2(30),
	-- 배송 특이사항
	product_delivery_info varchar2(150),
	-- 상품 재고
	product_inventory number,
	-- 상품 대분류
	product_major_category varchar2(30),
	-- 상품 소분류
	product_minor_category varchar2(30),
	-- 신제품 여부
	product_isnew varchar2(3) DEFAULT 'N' NOT NULL,
	-- 리뷰 평점
	product_avgstar float DEFAULT 0 NOT NULL,
	PRIMARY KEY (product_idx)
);


-- 장바구니
CREATE TABLE product_cart
(
	-- 장바구니 번호
	cart_idx number NOT NULL,
	-- 회원번호
	member_idx number NOT NULL,
	-- 상품번호
	product_idx number NOT NULL UNIQUE,
	-- 상품 수량
	cart_product_number number,
	PRIMARY KEY (cart_idx)
);


-- 제품용 사진
CREATE TABLE product_photo
(
	-- 상품번호
	product_idx number NOT NULL,
	-- 사진 번호
	idx number NOT NULL,
	-- 파일 원본이름
	file_original varchar2(90),
	-- 파일 시스템이름
	file_system varchar2(90),
	-- 파일 확장자
	file_extension varchar2(9),
	PRIMARY KEY (idx)
);


-- 상품문의
CREATE TABLE product_qna
(
	-- 상품문의 번호
	idx number NOT NULL,
	-- 상품번호
	product_idx number NOT NULL,
	-- 회원번호
	member_idx number NOT NULL,
	-- 질문답변 내용
	content varchar2(1500) NOT NULL,
	-- 게시일
	wdate date DEFAULT sysdate NOT NULL,
	-- 답변이 있음
	isanswered varchar2(3) DEFAULT 'N' NOT NULL,
	-- 원본글 번호
	parent_idx number,
	PRIMARY KEY (idx)
);


-- 일대일문의
CREATE TABLE qnaservice
(
	-- 일대일 문의번호
	idx number NOT NULL,
	-- 회원번호
	member_idx number NOT NULL,
	-- 문의답변 내용
	content varchar2(1500) NOT NULL,
	-- 게시일
	wdate date DEFAULT sysdate NOT NULL,
	-- 답변이 있음
	isanswered varchar2(3) DEFAULT 'N' NOT NULL,
	-- 원본글 번호
	parent_idx number,
	-- 파일 원본이름
	file_original varchar2(90),
	-- 파일 시스템이름
	file_system varchar2(90),
	-- 파일 확장자
	file_extension varchar2(20),
	PRIMARY KEY (idx)
);


-- 리뷰
CREATE TABLE review_tbl
(
	-- 리뷰 번호
	idx number NOT NULL,
	-- 상품번호
	product_idx number NOT NULL UNIQUE,
	-- 회원번호
	member_idx number NOT NULL,
	-- 리뷰 내용
	content varchar2(999) NOT NULL,
	-- 리뷰 별점
	star number NOT NULL,
	-- 리뷰 작성일
	wdate date DEFAULT sysdate,
	-- 리뷰 사진 원본이름
	file_original varchar2(90),
	-- 리뷰 사진 시스템 이름
	file_system varchar2(90),
	-- 리뷰 사진 확장자
	file_extension varchar2(10),
	PRIMARY KEY (idx)
);



/* Create Foreign Keys */

ALTER TABLE order_log
	ADD FOREIGN KEY (member_idx)
	REFERENCES member_info (member_idx)
;


ALTER TABLE product_cart
	ADD FOREIGN KEY (member_idx)
	REFERENCES member_info (member_idx)
;


ALTER TABLE product_qna
	ADD FOREIGN KEY (member_idx)
	REFERENCES member_info (member_idx)
;


ALTER TABLE qnaservice
	ADD FOREIGN KEY (member_idx)
	REFERENCES member_info (member_idx)
;


ALTER TABLE review_tbl
	ADD FOREIGN KEY (member_idx)
	REFERENCES member_info (member_idx)
;


ALTER TABLE delivery_info
	ADD FOREIGN KEY (order_idx)
	REFERENCES order_log (order_idx)
;


ALTER TABLE order_change_cancel_refund
	ADD FOREIGN KEY (order_idx)
	REFERENCES order_log (order_idx)
;


ALTER TABLE order_product
	ADD FOREIGN KEY (order_idx)
	REFERENCES order_log (order_idx)
;


ALTER TABLE order_product
	ADD FOREIGN KEY (product_idx)
	REFERENCES product (product_idx)
;


ALTER TABLE product_cart
	ADD FOREIGN KEY (product_idx)
	REFERENCES product (product_idx)
;


ALTER TABLE product_photo
	ADD FOREIGN KEY (product_idx)
	REFERENCES product (product_idx)
;


ALTER TABLE product_qna
	ADD FOREIGN KEY (product_idx)
	REFERENCES product (product_idx)
;


ALTER TABLE review_tbl
	ADD FOREIGN KEY (product_idx)
	REFERENCES product (product_idx)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_announce_idx BEFORE INSERT ON announce
FOR EACH ROW
BEGIN
	SELECT SEQ_announce_idx.nextval
	INTO :new.idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_delivery_info_delivery_idx BEFORE INSERT ON delivery_info
FOR EACH ROW
BEGIN
	SELECT SEQ_delivery_info_delivery_idx.nextval
	INTO :new.delivery_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_member_info_member_idx BEFORE INSERT ON member_info
FOR EACH ROW
BEGIN
	SELECT SEQ_member_info_member_idx.nextval
	INTO :new.member_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_order_log_order_idx BEFORE INSERT ON order_log
FOR EACH ROW
BEGIN
	SELECT SEQ_order_log_order_idx.nextval
	INTO :new.order_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_product_cart_cart_idx BEFORE INSERT ON product_cart
FOR EACH ROW
BEGIN
	SELECT SEQ_product_cart_cart_idx.nextval
	INTO :new.cart_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_product_photo_idx BEFORE INSERT ON product_photo
FOR EACH ROW
BEGIN
	SELECT SEQ_product_photo_idx.nextval
	INTO :new.idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_product_product_idx BEFORE INSERT ON product
FOR EACH ROW
BEGIN
	SELECT SEQ_product_product_idx.nextval
	INTO :new.product_idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_product_qna_idx BEFORE INSERT ON product_qna
FOR EACH ROW
BEGIN
	SELECT SEQ_product_qna_idx.nextval
	INTO :new.idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_qnaservice_idx BEFORE INSERT ON qnaservice
FOR EACH ROW
BEGIN
	SELECT SEQ_qnaservice_idx.nextval
	INTO :new.idx
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_review_tbl_idx BEFORE INSERT ON review_tbl
FOR EACH ROW
BEGIN
	SELECT SEQ_review_tbl_idx.nextval
	INTO :new.idx
	FROM dual;
END;

/




/* Comments */

COMMENT ON TABLE announce IS '공지사항 게시판';
COMMENT ON COLUMN announce.idx IS '공지사항 번호';
COMMENT ON COLUMN announce.title IS '공지사항 제목';
COMMENT ON COLUMN announce.content IS '공지사항 내용';
COMMENT ON COLUMN announce.wdate IS '공지 게시일';
COMMENT ON COLUMN announce.file_original IS '파일 원본 이름';
COMMENT ON COLUMN announce.file_system IS '파일 시스템이름';
COMMENT ON COLUMN announce.file_extension IS '파일 확장자';
COMMENT ON COLUMN announce.hit IS '조회수';
COMMENT ON TABLE delivery_info IS '배송 정보';
COMMENT ON COLUMN delivery_info.delivery_idx IS '시스템 배송 번호';
COMMENT ON COLUMN delivery_info.delivery_code IS '택배사 송장 번호';
COMMENT ON COLUMN delivery_info.order_idx IS '주문번호';
COMMENT ON COLUMN delivery_info.delivery_duedate IS '배송 예정일';
COMMENT ON COLUMN delivery_info.delivery_status IS '배송 상태';
COMMENT ON TABLE member_info IS '회원관리';
COMMENT ON COLUMN member_info.member_idx IS '회원번호';
COMMENT ON COLUMN member_info.member_id IS '아이디';
COMMENT ON COLUMN member_info.member_pw IS '패스워드';
COMMENT ON COLUMN member_info.member_name IS '이름';
COMMENT ON COLUMN member_info.member_email IS '이메일';
COMMENT ON COLUMN member_info.member_phone IS '전화번호';
COMMENT ON COLUMN member_info.member_addr IS '회원주소';
COMMENT ON COLUMN member_info.member_addr2 IS '상세주소';
COMMENT ON COLUMN member_info.member_postcode IS '우편번호';
COMMENT ON COLUMN member_info.member_date IS '가입일';
COMMENT ON COLUMN member_info.mamber_last_visit IS '마지막 방문일';
COMMENT ON COLUMN member_info.member_grade IS '회원 등급';
COMMENT ON COLUMN member_info.member_admin IS '관리자여부';
COMMENT ON COLUMN member_info.deleted_yn IS '탈퇴여부';
COMMENT ON TABLE order_change_cancel_refund IS '주문 교환 취소 환불';
COMMENT ON COLUMN order_change_cancel_refund.order_idx IS '주문번호';
COMMENT ON COLUMN order_change_cancel_refund.order_type IS '교환 취소 환불 여부';
COMMENT ON COLUMN order_change_cancel_refund.order_refund_money IS '환불 금액';
COMMENT ON COLUMN order_change_cancel_refund.order_ccr_status IS '교환 취소 환불 진행상황';
COMMENT ON TABLE order_log IS '주문 내역';
COMMENT ON COLUMN order_log.order_idx IS '주문번호';
COMMENT ON COLUMN order_log.member_idx IS '회원번호';
COMMENT ON COLUMN order_log.order_date IS '주문날자';
COMMENT ON COLUMN order_log.order_total_price IS '주문 총 가격';
COMMENT ON COLUMN order_log.order_name IS '수령자 이름';
COMMENT ON COLUMN order_log.order_address IS '수령자 주소1';
COMMENT ON COLUMN order_log.order_address2 IS '수령자 주소2';
COMMENT ON COLUMN order_log.order_postcode IS '수령자 우편번호';
COMMENT ON COLUMN order_log.order_phone IS '수령자 전화번호';
COMMENT ON COLUMN order_log.order_state IS '주문 진행 상태 : 10은 배송전
20은 배송중
30는 배송완료';
COMMENT ON COLUMN order_log.order_cancel IS '주문 취소 여부';
COMMENT ON COLUMN order_log.order_refund IS '주문 환불 여부';
COMMENT ON TABLE order_product IS '주문 상품';
COMMENT ON COLUMN order_product.order_idx IS '주문번호';
COMMENT ON COLUMN order_product.product_idx IS '상품번호';
COMMENT ON COLUMN order_product.order_quantity IS '주문 개수';
COMMENT ON TABLE product IS '상품';
COMMENT ON COLUMN product.product_idx IS '상품번호';
COMMENT ON COLUMN product.product_name IS '상품명';
COMMENT ON COLUMN product.product_price IS '상품가격';
COMMENT ON COLUMN product.product_sale IS '할인 여부';
COMMENT ON COLUMN product.product_sale_percent IS '상품 할인율';
COMMENT ON COLUMN product.product_size IS '상품 규격 (100x200)';
COMMENT ON COLUMN product.product_delivery_info IS '배송 특이사항';
COMMENT ON COLUMN product.product_inventory IS '상품 재고';
COMMENT ON COLUMN product.product_major_category IS '상품 대분류';
COMMENT ON COLUMN product.product_minor_category IS '상품 소분류';
COMMENT ON COLUMN product.product_isnew IS '신제품 여부';
COMMENT ON COLUMN product.product_avgstar IS '리뷰 평점';
COMMENT ON TABLE product_cart IS '장바구니';
COMMENT ON COLUMN product_cart.cart_idx IS '장바구니 번호';
COMMENT ON COLUMN product_cart.member_idx IS '회원번호';
COMMENT ON COLUMN product_cart.product_idx IS '상품번호';
COMMENT ON COLUMN product_cart.cart_product_number IS '상품 수량';
COMMENT ON TABLE product_photo IS '제품용 사진';
COMMENT ON COLUMN product_photo.product_idx IS '상품번호';
COMMENT ON COLUMN product_photo.idx IS '사진 번호';
COMMENT ON COLUMN product_photo.file_original IS '파일 원본이름';
COMMENT ON COLUMN product_photo.file_system IS '파일 시스템이름';
COMMENT ON COLUMN product_photo.file_extension IS '파일 확장자';
COMMENT ON TABLE product_qna IS '상품문의';
COMMENT ON COLUMN product_qna.idx IS '상품문의 번호';
COMMENT ON COLUMN product_qna.product_idx IS '상품번호';
COMMENT ON COLUMN product_qna.member_idx IS '회원번호';
COMMENT ON COLUMN product_qna.content IS '질문답변 내용';
COMMENT ON COLUMN product_qna.wdate IS '게시일';
COMMENT ON COLUMN product_qna.isanswered IS '답변이 있음';
COMMENT ON COLUMN product_qna.parent_idx IS '원본글 번호';
COMMENT ON TABLE qnaservice IS '일대일문의';
COMMENT ON COLUMN qnaservice.idx IS '일대일 문의번호';
COMMENT ON COLUMN qnaservice.member_idx IS '회원번호';
COMMENT ON COLUMN qnaservice.content IS '문의답변 내용';
COMMENT ON COLUMN qnaservice.wdate IS '게시일';
COMMENT ON COLUMN qnaservice.isanswered IS '답변이 있음';
COMMENT ON COLUMN qnaservice.parent_idx IS '원본글 번호';
COMMENT ON COLUMN qnaservice.file_original IS '파일 원본이름';
COMMENT ON COLUMN qnaservice.file_system IS '파일 시스템이름';
COMMENT ON COLUMN qnaservice.file_extension IS '파일 확장자';
COMMENT ON TABLE review_tbl IS '리뷰';
COMMENT ON COLUMN review_tbl.idx IS '리뷰 번호';
COMMENT ON COLUMN review_tbl.product_idx IS '상품번호';
COMMENT ON COLUMN review_tbl.member_idx IS '회원번호';
COMMENT ON COLUMN review_tbl.content IS '리뷰 내용';
COMMENT ON COLUMN review_tbl.star IS '리뷰 별점';
COMMENT ON COLUMN review_tbl.wdate IS '리뷰 작성일';
COMMENT ON COLUMN review_tbl.file_original IS '리뷰 사진 원본이름';
COMMENT ON COLUMN review_tbl.file_system IS '리뷰 사진 시스템 이름';
COMMENT ON COLUMN review_tbl.file_extension IS '리뷰 사진 확장자';



