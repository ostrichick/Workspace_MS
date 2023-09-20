drop table bbsinfo;
-- 1번
create table bbsinfo(
	itemno int primary key AUTO_INCREMENT,
	category varchar(50),
	userid varchar(20),
	name varchar(50),
	wdate datetime,
	hitcount int,
	contents text,
	ishtml int,
	groupno int,
	levelno int,
	orderno int,
	filecount int
);


drop table bbsattach;
-- 2번
create table bbsattach(
	fileno int primary KEY AUTO_INCREMENT,
	itemno int,
	filename varchar(100),
	phyname varchar(100),
	extension varchar(20),
	downcount int,
	foreign key (itemno) REFERENCES bbsinfo(itemno)
);

-- 3번
insert into bbsinfo(category, userid, name, wdate, contents, ishtml, groupno, levelno, orderno, filecount)
VALUES('공지사항', 'hong', '홍길동', '2020.11.02', '이것은 게시물 등록내용입니다.', 1, 1, 1, 1, 1);

-- 4번
insert into bbsattach(itemno, filename, phyname, extension, downcount)
VALUES(1, '자바수업.hwp', 'javastudy.hwp', 'hwp', 0);

-- 5번
select x.userid, y.filename
from bbsinfo x
join
bbsattach y on x.itemno = y.itemno;

-- 6번
create index userid_idx on bbsinfo (userid);

-- 7번
update bbsattach set downcount = downcount+1 where itemno=1;