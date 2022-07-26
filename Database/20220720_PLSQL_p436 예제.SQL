CREATE OR REPLACE PROCEDURE correctionProc AS
	TYPE myVarrayType IS VARRAY(3) OF NUMBER(10);
	TYPE myNestType IS TABLE OF VARCHAR2(20);
	TYPE myAssocType IS TABLE OF NUMBER(5) INDEX BY STRING(10);
	v_varray myVarrayType;
	v_nest myNestType;
	v_assoc myAssocType;
	v_idx VARCHAR2(10);
BEGIN
		v_varray := myVarrayType(10,20,30);
		v_nest := myNestType('이것이', '오라클', '학습중');
		v_assoc('짜장') := 4500;
		v_assoc('피자') := 12000;
		v_assoc('치킨') := 19000;
		v_assoc('치킨') := 19000;
--		/*
		FOR i IN 1 .. 3 LOOP
			DBMS_OUTPUT.PUT_LINE (v_varray(i) || ' ' || v_nest(i));
		END LOOP;
		v_idx := v_assoc.FIRST;
		WHILE v_assoc.NEXT(v_idx) IS NOT NULL LOOP
			DBMS_OUTPUT.PUT_LINE (v_idx || '-->' || v_assoc(v_idx));
			v_idx := v_assoc.NEXT(v_idx);
		END LOOP;
--		*/
END;

EXEC correctionProc;