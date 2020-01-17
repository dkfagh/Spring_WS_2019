
/* Drop Tables */

DROP TABLE board CASCADE CONSTRAINTS;
DROP TABLE orderDetails CASCADE CONSTRAINTS;
DROP TABLE goods CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE members CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE board
(
	-- 게시글 번호
	bno number NOT NULL,
	-- 회원 아이디
	id varchar2(20) NOT NULL,
	-- 게시글 제목
	title varchar2(200) NOT NULL,
	-- 게시글 내용
	content varchar2(1000) NOT NULL,
	PRIMARY KEY (bno)
);


CREATE TABLE goods
(
	-- 상품 번호 : 연/월/일/일련번호4자리 조합
	code char(12) NOT NULL,
	-- 상품명
	name varchar2(20) NOT NULL,
	-- 상품 가격 : 현재 시점의 상품 가격
	price number NOT NULL,
	PRIMARY KEY (code)
);


CREATE TABLE members
(
	-- 회원 아이디
	id varchar2(20) NOT NULL,
	-- 회원 이름
	name varchar2(50) NOT NULL,
	-- 회원 비밀번호
	pw varchar2(20) NOT NULL,
	PRIMARY KEY (id)
);


CREATE TABLE orderDetails
(
	-- 주문 번호 : 연/월/일/상품번호4자리/일련번호8자리
	oNo char(20) NOT NULL,
	-- 상품 번호 : 연/월/일/일련번호4자리 조합
	code char(12) NOT NULL,
	PRIMARY KEY (oNo, code)
);


CREATE TABLE orders
(
	-- 주문 번호 : 연/월/일/카테고리번호4자리/일련번호8자리
	oNo char(20) NOT NULL,
	-- 회원 아이디
	id varchar2(20) NOT NULL,
	PRIMARY KEY (oNo)
);



/* Create Foreign Keys */

ALTER TABLE orderDetails
	ADD FOREIGN KEY (code)
	REFERENCES goods (code)
;


ALTER TABLE board
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE orders
	ADD FOREIGN KEY (id)
	REFERENCES members (id)
;


ALTER TABLE orderDetails
	ADD FOREIGN KEY (oNo)
	REFERENCES orders (oNo)
;



