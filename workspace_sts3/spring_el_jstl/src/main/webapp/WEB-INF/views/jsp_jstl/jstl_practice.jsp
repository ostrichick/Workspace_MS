<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL&JSTL실습</title>
</head>
<body>

<h2>EL&JSTL실습</h2>

<!-- 
<pre>태그는 입력된 문자형태 그대로 출력하면서 <pre>과 </pre>안의 태그는 실행됩니다.
<xmp>태그는 <xmp>과 </xmp>사이의 문자,숫자와 태그소스를 그대로 출력합니다. 
 -->

<pre>
아래의 조건을 만족하는 회원관리시스템 만들기

1. MemberController를 새롭게 만든다.
2. 오라클 데이터베이스에 member_tbl 테이블을 생성한다.(첨부#1에 따라 테이블 생성)
3. JDBC를 연결한다.(첨부#2에 따라 pom.xml과 root-context.xml에 내용 추가)
4. MemberVo 클래스를 정의한다.(member_tbl의 컬럼명과 동일하게 멤버변수 정의)
5. ezen.spring.dao 패키지를 생성하고 그 안에 MemberDao 클래스를 정의한다. 
6. 회원가입 페이지를 만든다.
7. 로그인 페이지를 만든다.
8. 회원정보 확인 및 수정 페이지를 만든다.
9. 회원 탈퇴 페이지를 만든다.
10. 관리자 페이지를 만든다.
11. 관리자는 회원목록을 조회하고 회원등급을 수정하고
    회원정보를 데이터베이스에서 삭제할 수 있도록 한다.
</pre>
<p>	

<xmp>
첨부#1
create table member_tbl(
member_idx number not null primary key, 
member_id varchar2(50) not null unique,
member_pw varchar2(20) not null,
member_name varchar2(30) not null,
member_handphone char(20),
member_gender char(2),
member_grade number(1) default 0,
reg_date date default sysdate,
del_yn char(2) default 'N'
);

DROP SEQUENCE member_sq;

CREATE SEQUENCE member_sq
START WITH 1
INCREMENT BY 1
MAXVALUE 9999999
NOCYCLE NOCACHE NOORDER;

첨부#2

1. JDBC관련 pom.xml에 추가할 내용

<!--  Spring JDBC  -->
<dependency>
	<groupId>org.springframework</groupId>
	<artifactId>spring-jdbc</artifactId>
	<version>${org.springframework-version}</version>
</dependency>

<!--  DB 컨넥션 풀(DBCP) -->
<dependency>
	<groupId>org.apache.commons</groupId>
	<artifactId>commons-dbcp2</artifactId>
	<version>2.8.0</version>
</dependency>		

<!--  Oracle JDBC 드라이버 -->
	<dependency>
		<groupId>com.oracle</groupId>
		<artifactId>ojdbc7</artifactId>
		<version>12.1.0.2</version>
	</dependency>
   
</dependencies>

<repositories>
	<repository>
		<id>oracle</id>
		<name>ORACLE JDBC Repository</name>
		<url>http://maven.jahia.org/maven2</url>
	</repository>
</repositories>


2. root-context.xml에 추가할 내용

<bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
	<property name="driverClassName" value= "oracle.jdbc.driver.OracleDriver" />
	<property name="url" value="jdbc:oracle:thin:@localhost:1521:XE"/>
	<property name="username" value="system"/>
	<property name="password" value="1234" />	
</bean>
	
</xmp>


</body>
</html>