drop table review;

CREATE TABLE REVIEW(
 REVIEW_NO NUMBER,
 REVIEW_TITLE VARCHAR2(50),
 REVIEW_WRITER VARCHAR2(20),
 REVIEW_DATE DATE DEFAULT SYSDATE,
 REVIEW_CONTENT VARCHAR2,
 REVIEW_STAR NUMBER,
 REVIEW_READCOUNT NUMBER DEFAULT 0,
 CONSTRAINT PK_REVIEW PRIMARY KEY (REVIEW_NO)
);

insert into review values(1, 'ÆÄ¶û¸ÇÅõ¸Ç°ú Á¶´ø1±×·¹ÀÌ Á¶ÇÕ!', 'È«±æµ¿', sysdate, 
'¸®ºä1', 1 , 14);

insert into review values(2, 'µ¢Å© À¯´Ï¹ö½ÃÆ¼ ºí·ç', 'ÀÌ¼ø½Å', sysdate, 
'¸®ºä2', 1 , 12);

insert into review values(3, '³ªÀÌÅ° / Á¶´ø 1 ·°Å°±×¸° ·¡ÇÃ', '±è¸Ó¸®', sysdate, 
'¸®ºä3', 1 , 1);

insert into review values(4, '¸®ºä1', 'È«±æµ¿', sysdate, 
'¸®ºä4', 1 , default);

insert into review values(5, '¸®ºä2', 'ÀÌ¼ø½Å', sysdate, 
'¸®ºä5', 1 , 1);

insert into review values(6, '¸®ºä3', '±è¸Ó¸®', sysdate, 
'¸®ºä6', 1 , 13);

insert into review values(7, '¸®ºä4', 'È«±æµ¿', sysdate, 
'¸®ºä7', 1 , default);

insert into review values(8, '¸®ºä5', 'ÀÌ¼ø½Å', sysdate, 
'¸®ºä8', 1 , 11);

insert into review values(9, '¸®ºä6', '±è¸Ó¸®', sysdate, 
'¸®ºä9', 1 , default);

insert into review values(10, '¸®ºä7', 'È«±æµ¿', sysdate, 
'¸®ºä0', 1 , 1);

insert into review values(11, '¸®ºä8', 'ÀÌ¼ø½Å', sysdate, 
'¸®ºä1', 1 , 10);

commit;
