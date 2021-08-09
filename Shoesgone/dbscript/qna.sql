drop table qna;

CREATE TABLE qna(
 QnA_NO NUMBER,
 QnA_TITLE VARCHAR2(60),
 QnA_WRITER VARCHAR2(20),
 QnA_DATE DATE DEFAULT SYSDATE,
 QnA_CONTENT VARCHAR2(2048),
 QnA_AVAILABLE NUMBER,
 QnA_READCOUNT NUMBER DEFAULT 0,
 CONSTRAINT PK_QnA PRIMARY KEY (QnA_NO)
);

insert into qna values(1, '조던 신발 정보가 너무 궁금해요!', '질문자', sysdate, 
'ㅁㄴㅇㄹ', 1 , 22);

insert into qna values(2, '나이키 덩크 이 제품 관련 정보가 있을까요?', '질문자', sysdate, 
'ㅁㄴㅇㄹ', 1 , 8);

insert into qna values(3, '조던에 어울리는 바지 추천해주세요', '질문자', sysdate, 
'ㅁㄴㅇㄹ', 1 , 4);

insert into qna values(4, '조던1 시리즈가 컨버스보다 발볼이 넓나요?', '질문자', sysdate, 
'ㅁㄴㅇㄹ', 1 , 57);

insert into qna values(5, '덩크 유니버시티 블루', '질문자', sysdate, 
'ㅁㄴㅇㄹ', 1 , 8);

insert into qna values(6, '조던1 입문 추천', '질문자', sysdate, 
'ㅁㄴㅇㄹ', 1 , 51);

insert into qna values(7, '질문', '질문자', sysdate, 
'ㅁㄴㅇㄹ', 1 , 39);

insert into qna values(8, '질문', '질문자', sysdate, 
'ㅁㄴㅇㄹ', 1 , 24);

insert into qna values(9, '질문', '질문자', sysdate, 
'ㅁㄴㅇㄹ', 1 , 1);

insert into qna values(10, '질문', '질문자', sysdate, 
'ㅁㄴㅇㄹ', 1 , 51);

insert into qna values(11, '질문', '질문자', sysdate, 
'ㅁㄴㅇㄹ', 1 , 21);

insert into qna values(12, '질문', '질문자', sysdate, 
'ㅁㄴㅇㄹ', 1 , 19);

commit;
