
CREATE TABLE member(
       mem_num NUMBER(10) not null,
       email VARCHAR2(100) unique not null,
       auth NUMBER(1) default 2 not null,
      CONSTRAINT mem_pk PRIMARY KEY(mem_num)
);

CREATE TABLE member_detail(
       mem_num NUMBER(10) not null,
       mem_image BLOB,
       mem_imagename varchar2(100),
       nickname VARCHAR2(30) not null,
       password VARCHAR2(60) not null,
       birth DATE not null,
       phone VARCHAR2(500) not null,
       mem_regdate DATE default SYSDATE not null,
       mem_modifydate DATE ,
       purchase_date DATE,
       expire_date Date,
      CONSTRAINT mem_detail_pk PRIMARY KEY(mem_num)
);

CREATE TABLE musical(
    mus_num NUMBER(10) not null,
    mus_name VARCHAR2(100) not null,
    gen_num NUMBER(10) not null,
    mus_age NUMBER(2) not null,
    mus_actor VARCHAR2(100) not null,
    mus_time NUMBER(3) not null,
    mus_video VARCHAR2(1000) not null,
    mus_rate NUMBER(10),
    mus_post BLOB not null,
    mus_postname VARCHAR2(200) not null,
    mus_summary VARCHAR2(1000) not null,
    mus_detail CLOB not null,
    mus_regdate DATE not null,
     CONSTRAINT musical_pk PRIMARY KEY(mus_num)
);

CREATE TABLE actor(
 act_num NUMBER(10) not null,
 act_name VARCHAR2(50) not null,
CONSTRAINT actor_pk  PRIMARY KEY (act_num)
);





CREATE TABLE prefer(
 prefer_num NUMBER(10) not null,
 mem_num NUMBER(10)   not null,
 gen_num NUMBER not null,
 prefer_rate NUMBER(1) not null,
CONSTRAINT prefer_pk  PRIMARY KEY (prefer_num)
);

CREATE TABLE genre(
 gen_num NUMBER(2) not null,
 gen_name VARCHAR2(50)  not null,
CONSTRAINT genre_pk  PRIMARY KEY (gen_num)
);


CREATE TABLE pick(
 pick_num NUMBER(10) not null,
 mem_num NUMBER(10)  not null,	
 mus_num NUMBER(10) not null,
CONSTRAINT pick_pk  PRIMARY KEY (pick_num)
);

CREATE TABLE reviews(
 rev_num NUMBER(10) not null,
 mem_num NUMBER(10)   not null,
 mus_num NUMBER(20) not null,
 rev_rate NUMBER(1) not null,
 review varchar2(300) not null,
 rev_regdate date not null,
CONSTRAINT reviews_pk PRIMARY KEY (rev_num)
);

CREATE TABLE consult(
 con_num NUMBER(10) not null,
 mem_num NUMBER(10)   not null,
 con_title VARCHAR2(300) not null,
 con_content VARCHAR2(1500) not null,
 con_answer VARCHAR2(1500)  not null,
 con_completed  NUMBER(1) not null,
 con_regdate  DATE not null,
CONSTRAINT consult_pk PRIMARY KEY (con_num)
);

CREATE TABLE voucher(
 voucher_num NUMBER(10) not null,
 mem_num NUMBER(10)   not null,
 buy_date date not null,
 expire_date  DATE not null,
CONSTRAINT voucher_pk PRIMARY KEY (voucher_num)
);





--ALTER TABLE member 
--ADD CONSTRAINTS email
--FOREIGN KEY(email)
--REFERENCES member_detail(email);

ALTER TABLE member_detail
ADD CONSTRAINTS mem_num 
FOREIGN KEY(mem_num)
REFERENCES member(mem_num);

ALTER TABLE musical
ADD CONSTRAINTS gen_num
FOREIGN KEY(gen_num)
REFERENCES genre(gen_num);

ALTER TABLE prefer
ADD CONSTRAINTS mem_num2
FOREIGN KEY(mem_num)
REFERENCES  member(mem_num);

ALTER TABLE prefer
ADD CONSTRAINTS gen_num2
FOREIGN KEY(gen_num)
REFERENCES  genre(gen_num);

ALTER TABLE pick
ADD CONSTRAINTS mem_num3
FOREIGN KEY(mem_num)
REFERENCES  member(mem_num);

ALTER TABLE pick
ADD CONSTRAINTS mus_num
FOREIGN KEY(mus_num)
REFERENCES  musical(mus_num);

ALTER TABLE reviews
ADD CONSTRAINTS mem_num4
FOREIGN KEY(mem_num)
REFERENCES  member(mem_num);

ALTER TABLE reviews
ADD CONSTRAINTS mus_num2
FOREIGN KEY(mus_num)
REFERENCES  musical(mus_num);

ALTER TABLE consult
ADD CONSTRAINTS mem_num5
FOREIGN KEY(mem_num)
REFERENCES  member(mem_num);






CREATE SEQUENCE mem_num
INCREMENT BY 1
START WITH  10000;

CREATE SEQUENCE mus_seq
INCREMENT BY 1
START WITH  100;

CREATE SEQUENCE act_num
INCREMENT BY 1
START WITH  1000;

CREATE SEQUENCE prefer_num
INCREMENT BY 1
START WITH  20000;

CREATE SEQUENCE pick_num
INCREMENT BY 1
START WITH 30000;

CREATE SEQUENCE rev_num
INCREMENT BY 1
START WITH  40000;

CREATE SEQUENCE con_num
INCREMENT BY 1
START WITH  50000;

CREATE SEQUENCE voucher_num
INCREMENT BY 1
START WITH  60000;


