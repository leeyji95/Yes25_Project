DROP TABLE tb_statement;
DROP SEQUENCE statement_seq;

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
VALUES(statement_seq.nextval, '2015-05-05', 1890, 'zzz요', 5000, 2, 7, 4);

SELECT count(*) FROM tb_statement;

SELECT 
	stmt_uid, 
	account_uid, 
	stmt_summary, 
	stmt_sum, 
	stmt_manager, 
	stmt_approver, 
	stmt_proceed
FROM 
(SELECT ROWNUM AS RNUM, T.* FROM 
	(SELECT * FROM tb_statement ORDER BY stmt_uid DESC) T) 
WHERE 
	RNUM >= 6 AND RNUM < 6 + 5;

SELECT 
	stmt_uid,
	stmt_date regDate,
	account_uid,
	stmt_summary summary,
	stmt_sum money,
	stmt_writer writer,
	stmt_manager manager,
	stmt_approver approver,
	stmt_proceed proceed
FROM 
	tb_statement;
