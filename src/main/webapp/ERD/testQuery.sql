SELECT * FROM tab;
SELECT * FROM tb_book;
SELECT * FROM tb_category;
SELECT * FROM tb_publisher;
SELECT * FROM TB_ATTACH;

SELECT ROOT_UID rootUid, ROOT_NAME rootName,
DOWN1_UID down1Uid, DOWN1_NAME down1Name,
DOWN2_UID down2Uid, DOWN2_NAME down2Name
FROM view_category;

CREATE OR REPLACE VIEW view_category AS
SELECT root.CATEGORY_UID root_uid, root.CATEGORY_NAME root_name, 
down1.CATEGORY_UID down1_uid, down1.CATEGORY_NAME down1_name,  
down2.CATEGORY_UID down2_uid, down2.CATEGORY_NAME down2_name  
FROM TB_CATEGORY root 
LEFT OUTER JOIN TB_CATEGORY down1 ON down1.CATEGORY_PARENT = root.CATEGORY_UID
LEFT OUTER JOIN TB_CATEGORY down2 ON down2.CATEGORY_PARENT = down1.CATEGORY_UID 
WHERE root.CATEGORY_PARENT IS NULL 
ORDER BY root.CATEGORY_NAME, down1.CATEGORY_NAME, down2.CATEGORY_NAME 
;

UPDATE TB_ATTACH SET BOOK_UID = 8 WHERE ATTACH_UID = 11;

CREATE OR REPLACE VIEW view_book AS
SELECT  
		tbk.BOOK_UID bookUid, tbk.BOOK_SUBJECT subject, tbk.BOOK_AUTHOR author, 
		tbk.BOOK_CONTENT content, tbk.BOOK_PRICE price, tbk.BOOK_PUBDATE pubdate, tbk.BOOK_REGDATE regdate, 
		tbk.BOOK_ISBN isbn, tbk.CATEGORY_UID categoryUid, tbk.PUBLISHER_UID pubUid,
		tpb.PUBLISHER_NAME pubName, tct.CATEGORY_NAME categoryName,
		tat.ATTACH_SERVERNAME serName, tat.ATTACH_URI uri
	FROM tb_book tbk
	LEFT OUTER JOIN TB_PUBLISHER tpb 
	ON tbk.PUBLISHER_UID = tpb.PUBLISHER_UID 
	LEFT OUTER JOIN TB_CATEGORY tct 
	ON tbk.CATEGORY_UID = tct.CATEGORY_UID 
	LEFT OUTER JOIN TB_ATTACH tat
	ON tbk.BOOK_UID = tat.BOOK_UID 
	ORDER BY tbk.BOOK_UID DESC;

SELECT * FROM view_book;	


SELECT *
FROM 
(SELECT rownum AS rnum, vb.* 
FROM VIEW_BOOK vb)
WHERE RNUM >= 1 AND RNUM < 1 + 5
;

SELECT count(*) FROM TB_BOOK;

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
	(1, 'IT 모바일', null);
INSERT INTO TB_CATEGORY VALUES(2, '게임', 1);
INSERT INTO TB_CATEGORY VALUES(3, '그래픽', 1);
INSERT INTO TB_CATEGORY VALUES(4, '네트워크', 1);
INSERT INTO TB_CATEGORY VALUES(5, '프로그래밍 언어', 1);
INSERT INTO TB_CATEGORY VALUES(6, '오피스활용', 1);
INSERT INTO TB_CATEGORY VALUES(7, '웹사이트', 1);
INSERT INTO TB_CATEGORY VALUES(8, '게임 기획', 2);
INSERT INTO TB_CATEGORY VALUES(9, '게임 개발', 2);
INSERT INTO TB_CATEGORY VALUES(10, '3DS', 3);
INSERT INTO TB_CATEGORY VALUES(11, '포토샵', 3);
INSERT INTO TB_CATEGORY VALUES(12, '프리미어', 3);
INSERT INTO TB_CATEGORY VALUES(13, '네트워크 일반', 4);
INSERT INTO TB_CATEGORY VALUES(14, '보안/해킹', 4);
INSERT INTO TB_CATEGORY VALUES(15, 'Java', 5);
INSERT INTO TB_CATEGORY VALUES(16, 'C', 5);
INSERT INTO TB_CATEGORY VALUES(17, 'Python', 5);
INSERT INTO TB_CATEGORY VALUES(18, 'Ruby', 5);
INSERT INTO TB_CATEGORY VALUES(19, '엑셀', 6);
INSERT INTO TB_CATEGORY VALUES(20, '파워포인트', 6);
INSERT INTO TB_CATEGORY VALUES(21, '한글', 6);
INSERT INTO TB_CATEGORY VALUES(22, 'HTML/CSS', 7);
INSERT INTO TB_CATEGORY VALUES(23, '웹디자인', 7);
INSERT INTO TB_CATEGORY VALUES(24, '웹기획', 7);
INSERT INTO TB_CATEGORY VALUES(25, 'JavaScript', 7);

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
	(book_seq.nextval, 'C를 배워보자', '고슬링', 'C를 배워봅시다', SYSDATE, SYSDATE, '12435', 1, 1);