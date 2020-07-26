--테이블 삭제
DROP TABLE tb_statement CASCADE CONSTRAINT purge;
DROP TABLE tb_evidence_file CASCADE CONSTRAINT purge;
DROP TABLE tb_account CASCADE CONSTRAINT purge;

DROP TABLE tb_dept CASCADE CONSTRAINT purge;
DROP TABLE tb_emp CASCADE CONSTRAINT purge;
DROP TABLE tb_position CASCADE CONSTRAINT purge;
DROP TABLE tb_commute CASCADE CONSTRAINT purge;
DROP TABLE tb_apply CASCADE CONSTRAINT purge;
DROP TABLE tb_password CASCADE CONSTRAINT purge;

DROP TABLE tb_publisher CASCADE CONSTRAINT purge;
DROP TABLE tb_book CASCADE CONSTRAINT purge;
DROP TABLE tb_attach CASCADE CONSTRAINT purge;
DROP TABLE tb_category CASCADE CONSTRAINT purge;

DROP TABLE tb_order CASCADE CONSTRAINT purge;

DROP TABLE tb_stock CASCADE CONSTRAINT purge;


-- 시퀀스 삭제
DROP SEQUENCE account_seq;
DROP SEQUENCE evidence_file_seq;
DROP SEQUENCE statement_seq;

DROP SEQUENCE dept_seq;
DROP SEQUENCE position_seq;
DROP SEQUENCE emp_seq;

DROP SEQUENCE publisher_seq;
DROP SEQUENCE book_seq;
DROP SEQUENCE category_seq;

DROP SEQUENCE order_seq;

DROP SEQUENCE bookpin_seq;



--시퀀스 생성
CREATE SEQUENCE account_seq;
CREATE SEQUENCE evidence_file_seq;
CREATE SEQUENCE statement_seq;

CREATE SEQUENCE dept_seq;
CREATE SEQUENCE position_seq;
CREATE SEQUENCE emp_seq;

CREATE SEQUENCE publisher_seq;
CREATE SEQUENCE book_seq;
CREATE SEQUENCE attach_seq;
CREATE SEQUENCE category_seq;

CREATE SEQUENCE order_seq;

CREATE SEQUENCE bookpin_seq;


--테이블 생성
CREATE TABLE tb_dept
(
    dept_uid     NUMBER          NOT NULL, 
    dept_name    VARCHAR2(10)    NOT NULL, 
    CONSTRAINT TB_DEPT_PK PRIMARY KEY (dept_uid)
);
SELECT * FROM TB_DEPT ;

CREATE TABLE tb_position
(
    position_uid     NUMBER          NOT NULL, 
    position_name    VARCHAR2(10)    NOT NULL, 
    CONSTRAINT TB_POSITION_PK PRIMARY KEY (position_uid)
);
SELECT * FROM tb_position ;

CREATE TABLE tb_emp
(
    emp_uid              NUMBER           NOT NULL, 
    emp_number           NUMBER           NOT NULL, 
    emp_name             VARCHAR2(20)     NOT NULL, 
    emp_email            VARCHAR2(30)     NOT NULL, 
    dept_uid             NUMBER           NOT NULL, 
    position_uid         NUMBER           NOT NULL, 
    emp_pw               VARCHAR2(200)    DEFAULT 'emp_uid' NOT NULL, 
    emp_phone            VARCHAR2(15)     NOT NULL, 
    emp_hiredate         DATE             DEFAULT SYSDATE NOT NULL, 
    emp_endday           DATE             NULL, 
    emp_annualholiday    NUMBER           NULL, 
    emp_holidaycount     NUMBER           NULL, 
    emp_admin            NUMBER           NOT NULL, 
    CONSTRAINT TB_EMP_PK PRIMARY KEY (emp_uid)
);
SELECT * FROM tb_emp ;

ALTER TABLE tb_emp
    ADD CONSTRAINT FK_tb_emp_position_uid_tb_posi FOREIGN KEY (position_uid)
        REFERENCES tb_position (position_uid);
       
ALTER TABLE tb_emp
    ADD CONSTRAINT FK_tb_emp_dept_uid_tb_dept_dep FOREIGN KEY (dept_uid)
        REFERENCES tb_dept (dept_uid);

ALTER TABLE tb_emp
    ADD CONSTRAINT UC_emp_number UNIQUE (emp_number);

ALTER TABLE tb_emp
    ADD CONSTRAINT UC_emp_email UNIQUE (emp_email);



CREATE TABLE tb_commute
(
    commute_uid         NUMBER          NOT NULL, 
    commute_state       VARCHAR2(10)    NOT NULL, 
    commute_date        DATE            DEFAULT SYSDATE NOT NULL, 
    emp_uid             NUMBER          NOT NULL, 
    commute_start       TIMESTAMP       NULL, 
    commute_total       NUMBER          NULL, 
    commute_end         TIMESTAMP       NULL, 
    commute_overtime    NUMBER          NULL, 
    CONSTRAINT TB_COMMUTE_PK PRIMARY KEY (commute_uid)
);
SELECT * FROM tb_commute ;

ALTER TABLE tb_commute
    ADD CONSTRAINT FK_tb_commute_emp_uid_tb_emp_e FOREIGN KEY (emp_uid)
        REFERENCES tb_emp (emp_uid);

   
CREATE TABLE tb_apply
(
    apply_uid            NUMBER    NOT NULL, 
    apply_type           NUMBER    NOT NULL, 
    emp_uid              NUMBER    NOT NULL, 
    apply_workdate       DATE      NOT NULL, 
    apply_holidaydate    DATE      NULL, 
    apply_extra          NUMBER    NULL, 
    is_apply             NUMBER    NULL, 
    CONSTRAINT TB_APPLY_PK PRIMARY KEY (apply_uid)
);
SELECT * FROM tb_apply ;

ALTER TABLE tb_apply
    ADD CONSTRAINT FK_tb_apply_emp_uid_tb_emp_emp FOREIGN KEY (emp_uid)
        REFERENCES tb_emp (emp_uid);
       
       
       
-- 계정과목 테이블      
CREATE TABLE tb_account
(
    account_uid     NUMBER           NOT NULL, 
    account_name    VARCHAR2(100)    NOT NULL, 
    CONSTRAINT TB_ACCOUNT_PK PRIMARY KEY (account_uid)
);
   
   
-- 전표테이블 생성   
CREATE TABLE tb_statement
(
    stmt_uid         NUMBER    NOT NULL, 
    stmt_date        DATE      NOT NULL, 
    account_uid      NUMBER    NOT NULL, 
    stmt_summary     CLOB      NOT NULL, 
    stmt_sum         NUMBER    NOT NULL, 
    stmt_manager     NUMBER    NOT NULL, 
    stmt_approver    NUMBER    NOT NULL, 
    stmt_proceed     NUMBER    DEFAULT 1 NOT NULL,
    stmt_writer      NUMBER    NOT NULL,
    CONSTRAINT TB_STATEMENT_PK PRIMARY KEY (stmt_uid)
);

ALTER TABLE tb_statement
    ADD CONSTRAINT FK_tb_statement_account_uid_tb FOREIGN KEY (account_uid)
        REFERENCES tb_account (account_uid);
       
ALTER TABLE tb_statement
    ADD CONSTRAINT FK_tb_statement_stmt_manager_t FOREIGN KEY (stmt_manager)
        REFERENCES tb_emp (emp_uid);

ALTER TABLE tb_statement
    ADD CONSTRAINT FK_tb_statement_stmt_approver_ FOREIGN KEY (stmt_approver)
        REFERENCES tb_emp (emp_uid);



       
CREATE TABLE tb_evidence_file
(
    evi_uid           NUMBER           NOT NULL, 
    stmt_uid          NUMBER           NOT NULL, 
    evi_oriname       VARCHAR2(100)    NOT NULL, 
    evi_servername    VARCHAR2(100)    NOT NULL, 
    evi_uri           VARCHAR2(100)    NOT NULL, 
    CONSTRAINT TB_EVIDENCE_FILE_PK PRIMARY KEY (evi_uid)
);

ALTER TABLE tb_evidence_file
    ADD CONSTRAINT FK_tb_evidence_file_stmt_uid_t FOREIGN KEY (stmt_uid)
        REFERENCES tb_statement (stmt_uid);
 
CREATE TABLE tb_category
(
    category_uid       NUMBER          NOT NULL, 
    category_name      VARCHAR2(30)    NULL, 
    category_parent    NUMBER          NULL, 
    CONSTRAINT TB_CATEGORY_PK PRIMARY KEY (category_uid)
);

ALTER TABLE tb_category
    ADD CONSTRAINT FK_tb_category_category_parent FOREIGN KEY (category_parent)
        REFERENCES tb_category (category_uid);

       
CREATE TABLE tb_publisher
(
    publisher_uid        NUMBER           NOT NULL, 
    publisher_name       VARCHAR2(100)    NOT NULL, 
    publisher_num        VARCHAR2(12)     NOT NULL, 
    publisher_rep        VARCHAR2(30)     NOT NULL, 
    publisher_contact    VARCHAR2(60)     NOT NULL, 
    publisher_address    VARCHAR2(200)    NOT NULL, 
    CONSTRAINT TB_PUBLISHER_PK PRIMARY KEY (publisher_uid)
);

ALTER TABLE tb_publisher
    ADD CONSTRAINT UC_publisher_num UNIQUE (publisher_num);

       
CREATE TABLE tb_book
(
    book_uid         NUMBER           NOT NULL, 
    book_subject     VARCHAR2(200)    NOT NULL, 
    book_author      VARCHAR2(100)    NOT NULL, 
    book_content     CLOB             NULL, 
    book_price       NUMBER           NULL, 
    book_pubdate     DATE             NULL, 
    book_regdate     DATE             DEFAULT SYSDATE NOT NULL, 
    book_isbn        NUMBER           NULL, 
    category_uid     NUMBER           NOT NULL, 
    publisher_uid    NUMBER           NOT NULL, 
    CONSTRAINT TB_BOOK_PK PRIMARY KEY (book_uid)
);

ALTER TABLE tb_book
    ADD CONSTRAINT FK_tb_book_category_uid_tb_cat FOREIGN KEY (category_uid)
        REFERENCES tb_category (category_uid);

ALTER TABLE tb_book
    ADD CONSTRAINT FK_tb_book_publisher_uid_tb_pu FOREIGN KEY (publisher_uid)
        REFERENCES tb_publisher (publisher_uid);
       
CREATE TABLE tb_attach
(
    attach_uid           NUMBER           NOT NULL, 
    attach_oriname       VARCHAR2(200)    NOT NULL, 
    attach_servername    VARCHAR2(200)    NOT NULL, 
    attach_type          VARCHAR2(200)    NOT NULL, 
    attach_uri           VARCHAR2(200)    NULL, 
    attach_regdate       DATE             DEFAULT SYSDATE NOT NULL, 
    attach_size          NUMBER           NOT NULL, 
    book_uid             NUMBER           NULL, 
    CONSTRAINT TB_ATTACH_PK PRIMARY KEY (attach_uid)
);

ALTER TABLE tb_attach
    ADD CONSTRAINT FK_tb_attach_book_uid_tb_book_ FOREIGN KEY (book_uid)
        REFERENCES tb_book (book_uid);

       



   
       
CREATE TABLE tb_order
(
    order_uid          NUMBER    NOT NULL, 
    book_uid           NUMBER    NOT NULL, 
    account_uid        NUMBER    NOT NULL, 
    order_unit_cost    INT       NOT NULL, 
    order_quantity     INT       NOT NULL, 
    order_date         DATE      NOT NULL, 
    order_state        INT       NOT NULL, 
    CONSTRAINT TB_ORDER_PK PRIMARY KEY (order_uid)
);

ALTER TABLE tb_order
    ADD CONSTRAINT FK_tb_order_book_uid_tb_book_b FOREIGN KEY (book_uid)
        REFERENCES tb_book (book_uid);

ALTER TABLE tb_order
    ADD CONSTRAINT FK_tb_order_account_uid_tb_pub FOREIGN KEY (account_uid)
        REFERENCES tb_publisher (publisher_uid);


CREATE TABLE tb_stock
(
    bookpin_uid       NUMBER          NOT NULL, 
    book_uid          NUMBER          NOT NULL, 
    stock_state       CHAR(1)         NOT NULL, 
    stock_in_date     DATE            NULL, 
    stock_out_date    DATE            NULL, 
    stock_dwell       NUMBER          NULL, 
    stock_hold        CHAR(1)         NOT NULL, 
    location_uid      VARCHAR2(20)    NOT NULL, 
    CONSTRAINT TB_STOCK_PK PRIMARY KEY (bookpin_uid)
);

ALTER TABLE tb_stock
    ADD CONSTRAINT FK_tb_stock_book_uid_tb_book_b FOREIGN KEY (book_uid)
        REFERENCES tb_book (book_uid);

