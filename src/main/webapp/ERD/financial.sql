<<<<<<< HEAD


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
CREATE SEQUENCE statement_seq;


-- 사용하는 쿼리문
SELECT * FROM tb_statement;

INSERT INTO tb_statement(stmt_uid, stmt_date, account_uid, stmt_summary, stmt_sum, 
 stmt_writer, stmt_manager, stmt_approver)
VALUES(statement_seq.nextval, '2020-01-01', 1, '적요', 5000, 2, 3, 4);
=======


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
CREATE SEQUENCE statement_seq;


-- 사용하는 쿼리문
SELECT * FROM tb_statement;

INSERT INTO tb_statement(stmt_uid, stmt_date, account_uid, stmt_summary, stmt_sum, 
 stmt_writer, stmt_manager, stmt_approver)
VALUES(statement_seq.nextval, '2020-01-01', 1, '적요', 5000, 2, 3, 4);
>>>>>>> branch 'master' of https://github.com/leeyji95/Yes25_Project.git
