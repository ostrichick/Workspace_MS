CREATE TABLE animal_outs(
	animal_id varchar(10) not null primary key,
	animal_type varchar(20) not null,
	outcome_date datetime not null,
	name varchar(30),
	gender_upon_outcome varchar(30)
);
CREATE TABLE animal_ins(
	animal_id varchar(10) not null primary key,
	animal_type varchar(20) not null,
	intake_date datetime not null,
	intake_condition varchar(10) not null,
	name varchar(30),
	gender_upon_intake varchar(30)
);
/*
<< 엑셀 데이터 파일을 MySQL 데이터베이스로 가져오기 하기 전 주의사항 >>

1. 날짜 데이터를 복사해서 메모장에 임시로 저장해둠
2. 엑셀 시트를 모두 셀서식에서 텍스트로 설정함
3. 메모장에 임시로 옮겨둔 데이터를 다시 엑셀 시트에 붙여넣기 한 후 저장
4. 엑셀 데이터 파일 준비 완료
*/