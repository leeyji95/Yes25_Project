--테이블 삭제

DROP TABLE tb_publisher CASCADE CONSTRAINT purge;
DROP TABLE tb_book CASCADE CONSTRAINT purge;
DROP TABLE tb_attach CASCADE CONSTRAINT purge;
DROP TABLE tb_category CASCADE CONSTRAINT purge;

DROP TABLE tb_order CASCADE CONSTRAINT purge;




-- 시퀀스 삭제
DROP SEQUENCE publisher_seq;
DROP SEQUENCE book_seq;
DROP SEQUENCE category_seq;

DROP SEQUENCE order_seq;





--시퀀스 생성
CREATE SEQUENCE publisher_seq;
CREATE SEQUENCE book_seq;
CREATE SEQUENCE category_seq;

CREATE SEQUENCE order_seq;




--테이블 생성

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
    book_author      VARCHAR2(20)     NOT NULL, 
    book_content     CLOB             NULL, 
    book_pubdate     DATE             NOT NULL, 
    book_regdate     DATE             DEFAULT SYSDATE NOT NULL, 
    book_isbn        NUMBER           NULL, 
    category_uid     NUMBER           NOT NULL, 
    publisher_uid    NUMBER           NOT NULL, 
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
    attach_uri           VARCHAR2(200)    NOT NULL, 
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




