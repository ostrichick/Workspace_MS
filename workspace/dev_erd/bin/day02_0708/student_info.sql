
/* Drop Tables */

DROP TABLE enrolled_class CASCADE CONSTRAINTS;
DROP TABLE student_info CASCADE CONSTRAINTS;




/* Create Tables */

-- 수강과목
CREATE TABLE enrolled_class
(
	-- 과목코드
	class_ID char(6) NOT NULL,
	-- 과목명
	class_name varchar2(30) NOT NULL,
	-- 교수명
	class_professor varchar2(20) NOT NULL,
	-- 강의일시
	class_schedule varchar2(20) NOT NULL,
	-- 강의실
	class_room varchar2(20) NOT NULL,
	-- 학번 : 학ㅂ
	student_ID number NOT NULL,
	PRIMARY KEY (class_ID)
);


-- 학생정보
CREATE TABLE student_info
(
	-- 학번 : 학ㅂ
	student_ID number NOT NULL,
	-- 이름
	student_name varchar2(15) NOT NULL,
	-- 학과
	student_major varchar2(20) NOT NULL,
	-- 생년월일
	student_birth_date date NOT NULL,
	-- 주소
	student_address varchar2(100),
	PRIMARY KEY (student_ID)
);



/* Create Foreign Keys */

ALTER TABLE enrolled_class
	ADD FOREIGN KEY (student_ID)
	REFERENCES student_info (student_ID)
;



/* Comments */

COMMENT ON TABLE enrolled_class IS '수강과목';
COMMENT ON COLUMN enrolled_class.class_ID IS '과목코드';
COMMENT ON COLUMN enrolled_class.class_name IS '과목명';
COMMENT ON COLUMN enrolled_class.class_professor IS '교수명';
COMMENT ON COLUMN enrolled_class.class_schedule IS '강의일시';
COMMENT ON COLUMN enrolled_class.class_room IS '강의실';
COMMENT ON COLUMN enrolled_class.student_ID IS '학번 : 학ㅂ';
COMMENT ON TABLE student_info IS '학생정보';
COMMENT ON COLUMN student_info.student_ID IS '학번 : 학ㅂ';
COMMENT ON COLUMN student_info.student_name IS '이름';
COMMENT ON COLUMN student_info.student_major IS '학과';
COMMENT ON COLUMN student_info.student_birth_date IS '생년월일';
COMMENT ON COLUMN student_info.student_address IS '주소';



