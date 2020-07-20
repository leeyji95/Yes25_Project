DROP TABLE tb_emp CASCADE CONSTRAINT purge;
DROP SEQUENCE emp_seq;

CREATE SEQUENCE emp_seq
START WITH 1
INCREMENT BY 1
MAXVALUE 9999;

--테이블 생성
CREATE TABLE tb_emp
(
    emp_uid              NUMBER           NOT NULL PRIMARY KEY, 
    emp_number           NUMBER           NOT NULL UNIQUE, 
    emp_name             VARCHAR2(20)     NOT NULL, 
    emp_email            VARCHAR2(30)     NOT NULL UNIQUE, 
    dept_uid             NUMBER           NOT NULL, 
    position_uid         NUMBER           NOT NULL, 
    emp_pw               VARCHAR2(200)    NOT NULL, 
    emp_phone            VARCHAR2(15)     NOT NULL, 
    emp_hiredate         DATE             DEFAULT SYSDATE NOT NULL,
    emp_admin            NUMBER           NOT NULL   
);


INSERT INTO TB_EMP VALUES (
emp_seq.nextval, 
CONCAT(TO_CHAR(sysdate, 'YYMM'), LPAD(emp_seq.nextval, 4, 0)) , 
'이예지', 'rlaaudwk@daum.com', 5, 5, 'EMP_NUMBER','01089785645', SYSDATE, 0 );

INSERT INTO TB_EMP VALUES (emp_seq.nextval, CONCAT(TO_CHAR(sysdate, 'YYMM'), LPAD(emp_seq.nextval, 4, 0)) , '김예진', 'RLAAUDWLS@daum.com', 6, 7, 'eDFjke', '01089743645', TO_CHAR(SYSDATE, 'YYYY-MM-DD'), 0 );

DELETE FROM TB_EMP ;
SELECT * FROM tb_emp ;

SELECT LPAD(emp_seq.nextval, 8, TO_CHAR(sysdate, 'YYMM')) -- 20072021
FROM DUAL;

SELECT SUBSTR(LPAD(22, 8, TO_CHAR(sysdate, 'YYMM')), 5, 4) FROM DUAL;  -- 2022 20072022 에서 2022 만 잘라냄(5번째 글자부터 4자리 자르기)

-- 사원번호 완성
SELECT CONCAT(TO_CHAR(sysdate, 'YYMM'), LPAD(emp_seq.nextval, 4, 0)) FROM DUAL; 

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM dual;


INSERT INTO TB_EMP (emp_pw) VALUES ();



--  ------------------------------------------------------------------------------------

CREATE TABLE tb_emp
(
    emp_uid         NUMBER          NOT NULL PRIMARY KEY, 
    emp_number      NUMBER          NOT NULL UNIQUE , 
    emp_name        VARCHAR2(20)    NOT NULL, 
    emp_email       VARCHAR2(30)    NOT NULL UNIQUE, 
    dept_uid        NUMBER          NOT NULL REFERENCES tb_dept (dept_uid), 
    position_uid    NUMBER          NOT NULL REFERENCES tb_position (position_uid), 
    emp_phone       VARCHAR2(15)    NOT NULL, 
    emp_hiredate    DATE            DEFAULT SYSDATE NOT NULL, 
    emp_admin       CHAR(1)         DEFAULT 'N' NOT NULL
);
DELETE FROM TB_EMP ;
SELECT * FROM tb_emp ;




CREATE TABLE tb_commute
(
    commute_uid         NUMBER          NOT NULL PRIMARY KEY, 
    emp_uid             NUMBER          NOT NULL REFERENCES tb_emp (emp_uid), 
    commute_date        DATE            DEFAULT SYSDATE NULL, 
    commute_start       TIMESTAMP       NULL, 
    commute_end         TIMESTAMP       NULL, 
    commute_overtime    NUMBER          NULL, 
    commute_total       NUMBER          NULL, 
    commute_state       VARCHAR2(10)    NOT NULL, 
    commute_is_apply    NUMBER          DEFAULT 0 NULL
);
DELETE FROM tb_commute ;
SELECT * FROM tb_commute ;



CREATE TABLE tb_apply
(
    apply_uid            NUMBER           NOT NULL PRIMARY KEY, 
    emp_uid              NUMBER           NOT NULL REFERENCES tb_emp (emp_uid), 
    apply_date           DATE             DEFAULT SYSDATE NOT NULL, 
    apply_holiyperiod    DATE             NULL, 
    apply_extra          NUMBER           NULL, 
    apply_outplace       VARCHAR2(200)    NULL, 
    commute_uid          NUMBER           NOT NULL REFERENCES tb_commute (commute_uid)
);
DELETE FROM tb_apply ;
SELECT * FROM tb_apply ;




CREATE TABLE tb_password
(
    pw_uid       NUMBER           NOT NULL PRIMARY KEY, 
    pw_origin    VARCHAR2(200)    NOT NULL, 
    pw_change    VARCHAR2(200)    NOT NULL, 
    emp_uid      NUMBER           NOT NULL REFERENCES tb_emp (emp_uid), 
);
DELETE FROM tb_password ;
SELECT * FROM tb_password ;
 














