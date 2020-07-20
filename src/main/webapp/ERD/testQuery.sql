SELECT * FROM tab;
SELECT * FROM tb_book;
SELECT * FROM tb_category;
SELECT * FROM tb_publisher;

DELETE FROM TB_BOOK tb WHERE BOOK_UID = 4;

UPDATE TB_BOOK 
SET 
	BOOK_SUBJECT = '바뀌었지', BOOK_AUTHOR = '이장훈', BOOK_CONTENT = '바뀌었다구', BOOK_PUBDATE = SYSDATE, BOOK_ISBN = 34262, CATEGORY_UID = 2, PUBLISHER_UID = 1 
WHERE BOOK_UID = 10;

SELECT BOOK_UID, BOOK_SUBJECT, BOOK_AUTHOR, BOOK_CONTENT, BOOK_PUBDATE, BOOK_REGDATE, BOOK_ISBN, CATEGORY_UID, PUBLISHER_UID 
FROM tb_book 
ORDER BY BOOK_UID DESC;

SELECT 
		BOOK_UID bookUid, BOOK_SUBJECT subject, BOOK_AUTHOR author, BOOK_CONTENT content, BOOK_PUBDATE pubdate, BOOK_REGDATE regdate, BOOK_ISBN isbn, CATEGORY_UID categoryUid, PUBLISHER_UID pubUid 
	FROM tb_book 
	ORDER BY BOOK_UID DESC;

INSERT INTO TB_CATEGORY 
	(CATEGORY_UID, CATEGORY_NAME, CATEGORY_PARENT) 
VALUES
	(1, '컴퓨터', null);

INSERT INTO TB_CATEGORY 
	(CATEGORY_UID, CATEGORY_NAME, CATEGORY_PARENT) 
VALUES
	(2, '자바', 2);

INSERT INTO TB_CATEGORY 
	(CATEGORY_UID, CATEGORY_NAME, CATEGORY_PARENT) 
VALUES
	(3, 'C', 1);

INSERT INTO TB_PUBLISHER 
	(PUBLISHER_UID, PUBLISHER_NAME, PUBLISHER_NUM, PUBLISHER_REP, PUBLISHER_CONTACT, PUBLISHER_ADDRESS) 
VALUES
	(publisher_seq.nextval, '길벗', '02-6522-6511', '김재훈', '구매부', '서울 서초구');

INSERT INTO TB_PUBLISHER 
	(PUBLISHER_UID, PUBLISHER_NAME, PUBLISHER_NUM, PUBLISHER_REP, PUBLISHER_CONTACT, PUBLISHER_ADDRESS) 
VALUES
	(publisher_seq.nextval, '한빛', '02-1232-6511', '이재훈', '총부부', '서울 동작구');

INSERT INTO TB_BOOK 
	(BOOK_UID, BOOK_SUBJECT, BOOK_AUTHOR, BOOK_CONTENT, BOOK_PUBDATE, BOOK_REGDATE, BOOK_ISBN, CATEGORY_UID, PUBLISHER_UID) 
VALUES
	(book_seq.nextval, '자바의 정석', '제임스', '자바를 배워봅시다', SYSDATE, SYSDATE, '12435', 1, 2);

INSERT INTO TB_BOOK 
	(BOOK_UID, BOOK_SUBJECT, BOOK_AUTHOR, BOOK_CONTENT, BOOK_PUBDATE, BOOK_REGDATE, BOOK_ISBN, CATEGORY_UID, PUBLISHER_UID) 
VALUES
	(book_seq.nextval, 'C를 배워보자', '고슬링', 'C를 배워봅시다', SYSDATE, SYSDATE, '12435', 3, 1);