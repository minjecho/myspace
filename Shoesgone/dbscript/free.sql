drop table free;

CREATE TABLE FREE(
 FREE_NO NUMBER,
 FREE_TITLE VARCHAR2(50),
 FREE_WRITER VARCHAR2(20),
 FREE_DATE DATE DEFAULT SYSDATE,
 FREE_CONTENT VARCHAR2(2048),
 FREE_LIKE NUMBER,
 FREE_READCOUNT NUMBER DEFAULT 0,
 CONSTRAINT PK_FREE PRIMARY KEY (FREE_NO)
);

insert into free values(1, '자유', '홍길동', sysdate, 
'덩크 드로우 전부 광탈!', 1 , 722);

insert into free values(2, '게시판', '이순신', sysdate, 
'특이점이 온 조던 케이스.jpg (feat.리버풀)', 1 , 87);

insert into free values(3, '테스트', '김머리', sysdate, 
'ㅁㄴㅇㄹ', 1 , 42);

insert into free values(4, '자유1', '홍길동', sysdate, 
'시카고 덩크 로우 드로우', 1 , 157);

insert into free values(5, '자유2', '이순신', sysdate, 
'ㅁㄴㅇㄹ', 1 , 81);

insert into free values(6, '자유3', '김머리', sysdate, 
'덩크의 시대가 왔죠', 1 , 501);

insert into free values(7, '자유4', '홍길동', sysdate, 
'나이키 / 덩크 로우 삼바, 시카고 래플 예정 / 나코공홈', 1 , 139);

insert into free values(8, '자유5', '이순신', sysdate, 
'평일엔 편안한 후질근룩', 1 , 124);

insert into free values(9, '자유6', '김머리', sysdate, 
'나이키 / 덩크로우 디스럽터 3컬러 출시 예정 / 공홈', 1 , 91);

insert into free values(10, '자유7', '홍길동', sysdate, 
'신발 할인 기획전 오픈!', 1 , 531);

insert into free values(11, '자유8', '이순신', sysdate, 
'테스트 페이지', 1 , 121);

insert into free values(12, '자유9', '김머리', sysdate, 
'[카시나 덩크 로우 세일] 온라인 응모', 1 , 129);

commit;