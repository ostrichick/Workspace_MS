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
    SET member_name = #{member_name},
    member_pw = #{member_pw},
    member_handphone = #{member_handphone}
        where member_id=#{member_id};