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