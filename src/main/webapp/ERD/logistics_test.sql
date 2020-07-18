--테이블 삭제
DROP TABLE tb_publisher_test CASCADE CONSTRAINT purge;
DROP TABLE tb_book_test CASCADE CONSTRAINT purge;
DROP TABLE tb_attach_test CASCADE CONSTRAINT purge;
DROP TABLE tb_category_test CASCADE CONSTRAINT purge;
DROP TABLE tb_order_test CASCADE CONSTRAINT purge;
DROP TABLE tb_stock_test CASCADE CONSTRAINT purge;
DROP TABLE tb_inbound_test CASCADE CONSTRAINT purge;
DROP TABLE tb_outbound_test CASCADE CONSTRAINT purge;


-- 시퀀스 삭제
DROP SEQUENCE publisher_test_seq;
DROP SEQUENCE book_test_seq;
DROP SEQUENCE category_test_seq;
DROP SEQUENCE order_test_seq;
DROP SEQUENCE stock_test_seq;
DROP SEQUENCE inbound_test_seq;
DROP SEQUENCE outbound_test_seq;



--시퀀스 생성
CREATE SEQUENCE publisher_test_seq;
CREATE SEQUENCE book_test_seq;
CREATE SEQUENCE category_test_seq;
CREATE SEQUENCE order_test_seq;
CREATE SEQUENCE stock_test_seq;
CREATE SEQUENCE inbound_test_seq;
CREATE SEQUENCE outbound_test_seq;



--테이블 생성

CREATE TABLE tb_category_test
(
    category_uid       NUMBER          NOT NULL, 
    category_name      VARCHAR2(30)    NULL, 
    category_parent    NUMBER          NULL, 
    CONSTRAINT TB_CATEGORY_TEST_PK PRIMARY KEY (category_uid)
);

ALTER TABLE tb_category_test
    ADD CONSTRAINT FK_tb_category_test_category_parent FOREIGN KEY (category_parent)
        REFERENCES tb_category_test (category_uid);

       
CREATE TABLE tb_publisher_test
(
    publisher_uid        NUMBER           NOT NULL, 
    publisher_name       VARCHAR2(100)    NOT NULL, 
    publisher_num        VARCHAR2(12)     NOT NULL, 
    publisher_rep        VARCHAR2(30)     NOT NULL, 
    publisher_contact    VARCHAR2(60)     NOT NULL, 
    publisher_address    VARCHAR2(200)    NOT NULL, 
    CONSTRAINT TB_PUBLISHER_TEST_PK PRIMARY KEY (publisher_uid)
);

ALTER TABLE tb_publisher_test
    ADD CONSTRAINT UC_publisher_num UNIQUE (publisher_num);

       
CREATE TABLE tb_book_test
(
    book_uid         NUMBER           NOT NULL, 
    book_subject     VARCHAR2(200)    NOT NULL, 
    book_author      VARCHAR2(20)     NOT NULL, 
    book_content     CLOB             NULL, 
    book_pubdate     DATE             NOT NULL, 
    book_regdate     DATE             DEFAULT SYSDATE NOT NULL, 
    book_isbn        NUMBER           NULL, 
    category_uid     NUMBER           NOT NULL, 
    publisher_uid    NUMBER           NOT NULL,
    price            NUMBER           NOT NULL,
    CONSTRAINT TB_BOOK_TEST_PK PRIMARY KEY (book_uid)
);

ALTER TABLE tb_book_test
    ADD CONSTRAINT FK_tb_book_test_category_uid_tb_cat FOREIGN KEY (category_uid)
        REFERENCES tb_category_test (category_uid);

ALTER TABLE tb_book_test
    ADD CONSTRAINT FK_tb_book_test_publisher_uid_tb_pu FOREIGN KEY (publisher_uid)
        REFERENCES tb_publisher_test (publisher_uid);  
       
CREATE TABLE tb_order_test
(
    order_uid          NUMBER    NOT NULL, 
    book_uid           NUMBER    NOT NULL, 
    account_uid        NUMBER    NOT NULL, 
    order_unit_cost    INT       NOT NULL, 
    order_quantity     INT       NOT NULL, 
    order_date         DATE      NOT NULL, 
    order_state        INT       NOT NULL, 
    CONSTRAINT TB_ORDER_TEST_PK PRIMARY KEY (order_uid)
);

ALTER TABLE tb_order_test
    ADD CONSTRAINT FK_tb_order_book_uid_tb_book_b FOREIGN KEY (book_uid)
        REFERENCES tb_book_test (book_uid);



CREATE TABLE tb_stock_test
(
    stock_uid    NUMBER    NOT NULL, 
    book_uid     NUMBER    NOT NULL, 
    stock_quantity        NUMBER    DEFAULT 0 NOT NULL, 
    location     NUMBER    DEFAULT 0 NOT NULL, 
    CONSTRAINT TB_STOCK_TEST_PK PRIMARY KEY (stock_uid)
);

ALTER TABLE tb_stock_test
    ADD CONSTRAINT FK_tb_stock_test_book_uid_tb_b FOREIGN KEY (book_uid)
        REFERENCES tb_book_test (book_uid);


CREATE TABLE tb_inbound_test
(
    inbound_uid         NUMBER    NOT NULL, 
    order_uid           NUMBER    NOT NULL,
    book_uid            NUMBER    NOT NULL,
    inbound_quantity    NUMBER    DEFAULT 0 NOT NULL, 
    inbound_date        DATE      DEFAULT SYSDATE NOT NULL, 
    CONSTRAINT TB_INBOUND_TEST_PK PRIMARY KEY (inbound_uid)
);

ALTER TABLE tb_inbound_test
    ADD CONSTRAINT FK_tb_inbound_test_order_uid_t FOREIGN KEY (order_uid)
        REFERENCES tb_order_test (order_uid);


ALTER TABLE tb_inbound_test
    ADD CONSTRAINT FK_tb_inbound_test_book_uid_tb FOREIGN KEY (book_uid)
        REFERENCES tb_book_test (book_uid);

CREATE TABLE tb_outbound_test
(
    outbound_uid           INT             NOT NULL,
    book_uid               NUMBER          NOT NULL,
    outbound_quantitiy      VARCHAR2(20)    DEFAULT '0' NOT NULL, 
    outbound_unit_price    VARCHAR2(20)    NOT NULL, 
    outbound_date          DATE            DEFAULT SYSDATE NOT NULL, 
    CONSTRAINT TB_OUTBOUND_TEST_PK PRIMARY KEY (outbound_uid)
);

ALTER TABLE tb_outbound_test
    ADD CONSTRAINT FK_tb_outbound_test_book_uid_t FOREIGN KEY (book_uid)
        REFERENCES tb_book_test (book_uid);



SELECT * FROM tb_stock_test;
SELECT * FROM tb_inbound_test;


