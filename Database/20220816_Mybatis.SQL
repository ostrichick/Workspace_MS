create table member_test(
	member_idx int unsigned not null primary key AUTO_INCREMENT,
	member_id varchar(50) not null unique,
 	member_pw varchar(20) not null,
 	member_name varchar(30) not null
);