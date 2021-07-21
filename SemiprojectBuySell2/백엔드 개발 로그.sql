-- 전체 상품 조회(최신 등록 순)
select * from item_reg_sta
order by item_reg_sta_no desc;

-- 전체 상품 조회 + 순위 조회
select rownum rnum, item_reg_sta_no, user_no, user_id, item_no, shoes_size, reg_date, price
from (select * from item_reg_sta
      order by item_reg_sta_no desc);

-- 페이징 처리용 구문
select * 
from (select rownum rnum, item_reg_sta_no, user_no, user_id, item_no, shoes_size, reg_date, price
      from (select * from item_reg_sta
      order by item_reg_sta_no desc))
where rnum >= 1 and rnum <= 10;

-- 등록 상품 순번 처리용 시퀀스
create sequence reg_seq
start with 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

-- item_reg_sta에 반송주소 컬럼 추가
alter table item_reg_sta
add (
    address varchar2(1000) not null
);

commit;

-- orders 테이블에 추가 요청사항 컬럼 추가
alter table orders
add (
    etc varchar2(3000)
);

commit;