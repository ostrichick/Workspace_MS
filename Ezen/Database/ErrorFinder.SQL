--
declare
  error_sql varchar(1000); -- SQL 문장 담을 변수
  error_pos number default -1; -- 에러 위치 값을 담을 변수
  vc_cur integer default dbms_sql.open_cursor; -- 커서 열기
begin
/**/
-- 여기에 입력


/**/
    error_sql := 'select * from dual where name = jayden-lee';
    begin
    	dbms_sql.parse( vc_cur, error_sql, dbms_sql.native ); -- 파싱
    	exception
 		   when others then
    		   error_pos := dbms_sql.last_error_position;
    end;
    dbms_sql.close_cursor( vc_cur ); -- 커서닫기
    dbms_output.put_line(error_sql); -- SQL 출력
    if error_pos > -1 then dbms_output.put_line('SQL Error Position : ' ||  error_pos);
    else dbms_output.put_line('SQL No Error');
    end if;
end;
--