DROP TABLE gugutbl;
CREATE TABLE gugutbl (txt VARCHAR(100));


CREATE OR REPLACE PROCEDURE whileProc AS
	v_str VARCHAR(100);
	v_i NUMBER;
	v_k NUMBER;
BEGIN
	v_i := 2;
	WHILE (v_i < 10) LOOP
		v_str := '';
		v_k := 1;
			WHILE (v_k < 10) LOOP
				v_str := v_str || ' ' || v_i || 'x' || v_k || '=' || v_i * v_k;
				v_k := v_k + 1;
			END LOOP;
		v_i := v_i + 1;
		INSERT INTO gugutbl VALUES(v_str);
	END LOOP;
END;

EXECUTE whileProc();
SELECT * FROM gugutbl;