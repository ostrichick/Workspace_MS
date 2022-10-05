SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS sample;




/* Create Tables */

CREATE TABLE sample
(
	no int NOT NULL AUTO_INCREMENT,
	title varchar(100) NOT NULL,
	content text NOT NULL,
	wdate datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
	PRIMARY KEY (no)
);



