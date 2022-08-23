drop table member_test;
create table member_test(
	member_idx int unsigned not null primary key AUTO_INCREMENT,
	member_id varchar(50) not null unique,
 	member_pw varchar(20) not null,
 	member_name varchar(30) not null
);

insert into member_test(member_id, member_pw, member_name)
values(2, 2, 3);

create table member_tbl(
	member_idx int unsigned not null primary key AUTO_INCREMENT,
	member_id varchar(50) not null unique,
 	member_pw varchar(20) not null,
 	member_name varchar(30) not null,
 	member_handphone varchar(30),
 	member_gender char(3),
 	member_grade tinyint(1) default 0,
 	reg_date datetime default now(),
 	del_yn char(3) default 'N'
);


select * from member_tbl
    where
    member_id = '1@1.1'
    and member_pw = '2'
    and del_yn ='N';

update member_tbl SET member_grade = 2 where member_idx=1;

update member_tbl
    SET member_name = '김삼식',
    member_pw = '22',
    member_handphone = '123123'
        where member_id = '1@1.1';

            select * from member_tbl


create table member_tbl_bak(
	member_bak_idx int unsigned not null primary key auto_increment,
	member_idx int unsigned not null,
	member_id varchar(50) not null,
	member_pw varchar(20) not null,
	member_name varchar(30) not null,
	member_handphone varchar(20),
	member_gender char(2),
	member_grade tinyint(1) default 0,
	reg_date datetime default now(),
	del_yn char(2) default 'N',
	MODIFY_TYPE CHAR(6),
	MODIFY_DATE datetime,
	MODIFY_USER VARCHAR(20)
);

drop TRIGGER t_backup_memberTBL;
drop TRIGGER t2_backup_memberTBL;

### root계정에서 트리거 생성 전에 실행 ###
set global log_bin_trust_function_creators=on;

### MySQL에서는 수정작업과 삭제작업에 대해 별도의 트리거를 생성해주어야 함 ###
### member_tbl에 수정작업 발생시 작동하는 트리거 생성 ###

delimiter |
CREATE TRIGGER t_backup_memberTBL
	AFTER UPDATE
	ON member_tbl
	FOR EACH ROW

BEGIN
	DECLARE	v_modifyType CHAR(6);
	SET v_modifyType = '수정';

	INSERT INTO member_tbl_bak (
			member_idx,
			member_id,
			member_pw,
			member_name,
			member_handphone,
			member_gender,
			member_grade,
			reg_date,
			del_yn,
			MODIFY_TYPE,
			MODIFY_DATE,
			MODIFY_USER
	) VALUES(
		OLD.member_idx,
		OLD.member_id,
		OLD.member_pw,
		OLD.member_name,
		OLD.member_handphone,
		OLD.member_gender,
		OLD.member_grade,
		OLD.reg_date,
		OLD.del_yn,
		v_modifyType,
		now(),
		USER()
	);

END;
|
delimiter;


### member_tbl에 삭제작업 발생시 작동하는 트리거 생성 ###

delimiter |
CREATE TRIGGER t2_backup_memberTBL
	AFTER DELETE
	ON member_tbl
	FOR EACH ROW

BEGIN
	DECLARE	v_modifyType CHAR(6);
	SET v_modifyType = '삭제';

	INSERT INTO member_tbl_bak (
			member_idx,
			member_id,
			member_pw,
			member_name,
			member_handphone,
			member_gender,
			member_grade,
			reg_date,
			del_yn,
			MODIFY_TYPE,
			MODIFY_DATE,
			MODIFY_USER
	) VALUES(
		OLD.member_idx,
		OLD.member_id,
		OLD.member_pw,
		OLD.member_name,
		OLD.member_handphone,
		OLD.member_gender,
		OLD.member_grade,
		OLD.reg_date,
		OLD.del_yn,
		v_modifyType,
		now(),
		USER()
	);

END;
|
delimiter;


  update member_tbl
  set
  member_grade =3
  where member_idx = 2;

 create table file_tbl(
 file_idx int unsigned not null primary key auto_increment,
 origin_filename1 varchar(100),
 origin_filename2 varchar(100),
 origin_filename3 varchar(100),
 system_filename1 varchar(100),
 system_filename2 varchar(100),
 system_filename3 varchar(100)
 );

insert into file_tbl(
    origin_filename1,origin_filename2,origin_filename3,
    system_filename1,system_filename2,system_filename3)
    values (
    1,2,3,4,5,6
    );