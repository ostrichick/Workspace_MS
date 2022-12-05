create table TBL_JUMIN (
jumin1 char(6) not null,
jumin2 char(7) ,
jimuinname varchar2(20) not null,
tel1 char(3) ,
tel2 char(4) ,
tel3 char(4) ,
address varchar2(40) ,
CONSTRAINT jumin primary key(jumin1, jumin2)
);

insert into tbl_jumin values('980101', '1000001', '김주민', '010', '2222', '2221', '서울시 장미구');
insert into tbl_jumin values('980101', '1000001', '김주민', '010', '2222', '2221', '서울시 장미구');
insert into tbl_jumin values('980101', '1000001', '김주민', '010', '2222', '2221', '서울시 장미구');
insert into tbl_jumin values('880101', '2000002', '이주민', '010', '2222', '2222', '서울시 백합구');
insert into tbl_jumin values('780101', '1000003', '박주민', '010', '2222', '2223', '서울시 백련구');
insert into tbl_jumin values('580101', '2000004', '조주민', '010', '2222', '2224', '서울시 목련구');
insert into tbl_jumin values('480101', '1000005', '황주민', '010', '2222', '2225', '서울시 철죽구');
insert into tbl_jumin values('990101', '1000006', '조주민', '010', '2222', '2226', '서울시 장미구');
insert into tbl_jumin values('890101', '2000007', '구주민', '010', '2222', '2227', '서울시 백합구');
insert into tbl_jumin values('790101', '1000008', '공주민', '010', '2222', '2228', '서울시 백련구');
insert into tbl_jumin values('590101', '3000009', '왕주민', '010', '2222', '2229', '서울시 목련구');
insert into tbl_jumin values('490101', '1000010', '용주민', '010', '2222', '2230', '서울시 철죽구');

select * from tbl_jumin;

alter table tbl_jumin modify rename column jimuinname to juminname;

create table tbl_mask (
serialno number(4) not null primary key,
jumin1 char(6) ,
jumin2 char(7) ,
marketid char(4) ,
buydate char(8) ,
buycnt char(3) , 
CONSTRAINT fk_jumin1 foreign key(jumin1, jumin2) references tbl_jumin(jumin1, jumin2),
CONSTRAINT fk_marketid foreign key(marketid) references tbl_market(marketid)
)

insert into tbl_mask values('1', '980101', '1000001', '10', '20200301', '50');
insert into tbl_mask values('2', '880101', '2000002', '20', '20200401', '60');
insert into tbl_mask values('3', '780101', '1000003', '30', '20200501', '70');
insert into tbl_mask values('4', '580101', '2000004', '40', '20200601', '80');
insert into tbl_mask values('5', '480101', '1000005', '50', '20200701', '90');
insert into tbl_mask values('6', '990101', '1000006', '10', '20200801', '100');

select * from tbl_mask;

create table tbl_market(
marketid char(4) not null primary key,
marketname varchar2(20),
tel char(13),
address varchar2(40)
);

insert into tbl_market values('10', '장미약국', '02-1588-0001', '서울시 장미구');
insert into tbl_market values('20', '백합약국', '02-1588-0002', '서울시 백합구');
insert into tbl_market values('30', '백련약국', '02-1588-0003', '서울시 백련구');
insert into tbl_market values('40', '목련약국', '02-1588-0004', '서울시 목련구');
insert into tbl_market values('50', '철죽약국', '02-1588-0005', '서울시 철죽구');

select * from tbl_market;

select * from tbl_mask m inner join tbl_jumin j on m.jumin1 = j.jumin1 and m.jumin2 = j.jumin2 inner join tbl_market k on m.marketid = k.marketid;

select m.serialno, j.jimuinname, j.jumin1, j.jumin2, k.marketname, k.tel, m.buydate, m.buycnt from tbl_mask m inner join tbl_jumin j on m.jumin1 = j.jumin1 and m.jumin2 = j.jumin2 inner join tbl_market k on m.marketid = k.marketid;


select * from tbl_mask

insert into tbl_mask (serialno, jumin1, jumin2, marketid, buydate, buycnt) values('9', '490101', '1000010', '50', '9', '9');

commit;
