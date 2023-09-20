DROP TABLE multiply;
DROP TABLE gugu_tbl;
CREATE TABLE gugu_tbl (txt VARCHAR(100));

CREATE OR REPLACE PROCEDURE print_gugudan AS
	v_txt gugu_tbl.txt%TYPE;
	v_i NUMBER;
	v_j NUMBER;
BEGIN
	v_i := 2;
	WHILE (v_i < 10) LOOP
		v_txt := '';
		v_j := 1;
			WHILE(v_k < 10) LOOP
				v_txt := v_str || ' ' || v_i || 'x' || v_j || '=' || v_i * v_j;
				v_j := v_j + 1;
			END LOOP;
		v_i := v_i + 1;
		INSERT INTO gugu_tbl VALUEs(v_txt);
	END LOOP;
END;

EXECUTE print_gugudan();
SELECT * FROM gugu_tbl;