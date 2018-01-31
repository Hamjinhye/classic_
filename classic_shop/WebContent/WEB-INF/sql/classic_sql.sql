
-- 예전 파일
-- 다른 분들이 달아놓은 주석이 있음..!

-- ▼ 1/10 기준 수정사항 포함된 최신 sql
-- classic.sql 			: table DB
-- classic_test_data : test data DB


























DROP tablespace CLASSIC_DB including contents AND datafiles;

create tablespace CLASSIC_DB
datafile 'C:/oraclexe/app/oracle/oradata/XE/CLASSIC_DB.dbf'
size 200m
autoextend ON next 10m
maxsize 500m;

DROP USER classic_dba cascade;
CREATE USER classic_dba identified BY dba1234
DEFAULT tablespace CLASSIC_DB quota unlimited ON CLASSIC_DB
TEMPORARY tablespace temp;

grant connect, resource, dba to classic_dba;

conn classic_dba/dba1234;

CREATE sequence member_seq start WITH 1 increment BY 1;
CREATE table member(
	num number(8) CONSTRAINT member_pk_num PRIMARY KEY,
	id varchar2(12) UNIQUE,
	pw varchar2(12) not null,
	phone varchar2(14),
	mail varchar2(50) UNIQUE,
	grade number(1) DEFAULT 1 not null constraint member_ck_grade check(grade between -2 and 3),
	indate date
);

CREATE sequence addr_book_seq start WITH 1 increment BY 1;
CREATE table addr_book(
	num number(8) CONSTRAINT addr_pk_num PRIMARY KEY,
	mem_num number(8) CONSTRAINT addr_fk_mem_num references member(num),
	zip_code varchar2(21) not null,
	base_addr varchar2(200) not null,
	detail_addr varchar2(200) not null
);

CREATE sequence coupon_log_seq start WITH 1 increment BY 1;
CREATE table coupon_log(
num number(8) constraint coupon_log_pk_num primary key,
	grade number(1) default 0 constraint coupon_log_ck_grade check(grade between 0 and 3),
	state number(1) default 0 constraint coupon_log_ck_state check(state IN(0,1)),
	issue number(1) default 0 constraint coupon_log_ck_issue check(issue IN(0,1)),
	name varchar2(30) UNIQUE,
	sale number(2) not null,
	content varchar2(200),
	start_date date not null,
	end_date date not null,
	total number(4) not null,
	count number(4) default 0
);

create sequence coupon_seq start with 1 increment by 1;
create table coupon(
	num number(8) constraint coupon_pk_num primary key,
	mem_num number(8) constraint coupon_fk_mem_num references member(num),
	log_num number(8) constraint coupon_fk_log_num references coupon_log(num),
	state number(1) DEFAULT 1 constraint coupon_ck_state check(state IN(0,1)),
	indate date
);

create sequence banner_seq start with 1 increment by 1;
create table banner(
	num number(8) constraint banner_pk_num primary key,
	mem_num number(8) constraint banner_fk_mem_num references member(num),
	name varchar2(50) not null,
	content varchar2(4000),
	start_date date not null,
	end_date date,
	state number(1) DEFAULT 0 constraint banner_ck_state check(state IN(-1,0,1))
);

create sequence faq_seq start with 1 increment by 1;
create table faq(
	num number(8) constraint faq_pk_num primary key,
	mem_num number(8) not null constraint faq_fk_mem_num references member(num),
	q_title varchar2(100) not null,
	a_content varchar2(4000) not null
);

create sequence notice_seq start with 1 increment by 1;
create table notice(
	num number(8) constraint notice_pk_num primary key,
	mem_num number(8) constraint notice_fk_mem_num references member(num),
	title varchar2(200) not null,
	content varchar2(4000) not null,
	count number(8) default 0 not null,
	indate date
);

create sequence qna_seq start with 1 increment by 1;
create table qna(
	num number(8) constraint qna_pk_num primary key,
	mem_num number(8) constraint qna_fk_mem_num references member(num),
	subject number(1) default 0 not null constraint qna_ck_subject check(subject between 0 and 5),
	content varchar2(4000) not null,
	count number(8) default 0 not null,
	secure number(1) default 0 not null constraint qna_ck_secure check(secure in(0,1)),
	pwd varchar2(30),
	indate date not null
);

create sequence qna_reply_seq start with 1 increment by 1;
create table qna_reply(
	num number(8) constraint reply_pk_num primary key,
	qna_num number(8) constraint reply_fk_qna_num references qna(num),
	mem_num number(8) constraint reply_fk_mem_num references member(num),
	content varchar2(4000) not null,
	indate date not null
);

create sequence product_data_seq start with 1 increment by 1;
create table product_data(
	num number(8) constraint data_pk_num primary key,
	info varchar2(160) not null,	
	material varchar2(16) not null,	
	colour varchar2(30) not null,
	sizu varchar2(20) not null,	
	wash varchar2(1000) not null,	
	maker varchar2(30) not null,	
	nation varchar2(20) not null,
	make_date varchar2(16) not null,	
	supply varchar2(30) not null,	
	q_standard varchar2(100) not null,	
	as_person varchar2(10) not null,
	as_phone varchar2(30) not null,
	weight varchar2(6) not null
);

create sequence shop_guide_seq start with 1 increment by 1;
create table shop_guide(
	num number(8) constraint guide_pk_num primary key,
	state number(8) default 0 not null constraint guide_ck_state check(state IN(0,1)),
	subject number(8) default 0 not null constraint guide_ck_subject check(subject between 0 and 4),
	deliv_info varchar2(4000),
	refund_info varchar2(4000),
	trade_info varchar2(4000),
	as_info varchar2(4000),
	unregi_info varchar2(4000)
);

create sequence cate_seq start with 1 increment by 1;
create table cate(
	num number(8) constraint cate_pk_num primary key,
	name varchar2(16) not null,
	state number(1) default 1 not null constraint cate_ck_state check(state IN(0,1))
);

create sequence mini_cate_seq start with 1 increment by 1;
create table mini_cate(
	num number(8) constraint mini_pk_num primary key,
	cate_num number(8) constraint mini_fk_cate_num references cate(num),
	name varchar2(16) not null,
	state number(1) default 1 not null constraint mini_ck_state check(state IN(0,1))
);

create sequence product_seq start with 1 increment by 1;
create table product(
	num number(8) constraint product_pk_num primary key,
	code varchar2(16),
	cate_num number(8) constraint product_fk_cate_num references mini_cate(num),
	name varchar2(30) not null,
	sub_info varchar2(300) not null,
	main_info varchar2(4000) not null,
	price number(12) not null,
	buy_price number(12),
	sizu varchar2(20) not null,
	total_pcs number(4) not null,
	guide_num number(8) constraint product_fk_guide_num references shop_guide(num),
	data_num number(8) constraint product_fk_data_num references product_data(num),
	sell_ox number(1) default 1 not null constraint product_ck_sell_ox check(sell_ox between -1 and 1),
	out_ox number(1) default 1 not null constraint product_ck_out_ox check(out_ox IN(0,1)),
	indate date,
	sale number(2) default 0,
	out_time date
);

create sequence colour_seq start with 1 increment by 1;
create table colour(
	num number(8) constraint colour_pk_num primary key,
	product_num number(8) constraint colour_fk_product_num references product(num),
	code varchar2(7) not null,
	name varchar2(10) not null
);

create sequence icon_seq start with 1 increment by 1;
create table icon(
	num number(8) constraint icon_pk_num primary key,
	product_num number(8) null constraint icon_fk_product_num references product(num),
	name varchar2(8) not null,
	icon_start date,
	icon_end date,
	icon_state number(1) default 0 not null constraint icon_ck_state check(icon_state IN(0,1))
);

create sequence wish_seq start with 1 increment by 1;
create table wish(
	num number(8) constraint wish_pk_num primary key,
	product_num number(8) constraint wish_fk_product_num references product(num),
	mem_num number(8) constraint wish_fk_mem_num references member(num),
	indate date
);

create sequence bank_seq start with 1 increment by 1;
create table bank(
	num number(8) constraint bank_pk_num primary key,
	bank_name varchar2(8) UNIQUE,
	bank_num number(12) not null,
	name varchar2(10) not null
);

create sequence paid_seq start with 1 increment by 1;
create table paid(
	num number(8) constraint paid_pk_num primary key,
	mem_num number(8) constraint paid_fk_mem_num references member(num),
	product_num number(8) constraint paid_fk_product_num references product(num),
	coupon_num number(8) null constraint paid_fk_coupon_num references coupon(num),
	order_num number(8) not null,
	name varchar2(10) not null,
	phone number(11) not null,
	zip_code varchar2(21) not null,
	base_addr varchar2(200) not null,
	detail_addr varchar2(200) not null,
	memo varchar2(100),
	paid_date date,
	pay_with number(1) default 2 not null constraint paid_ck_pay_with check(pay_with between -1 and 3),
	order_money number(12) not null,
	payment		number(12) not null,
	order_date date not null,
	order_state number(1) default 0 not null constraint paid_ck_order_state check(order_state between -2 and 3),
	deposit_name varchar2(10) not null,
	cancel_start date,
	cancel_end date,
	sizu_num number(8) CONSTRAINT paid_fk_sizu_num references sizu(num),
	colour_num number(8) constraint paid_fk_colour_num references colour(num) 
);

create sequence delivery_seq start with 1 increment by 1;
create table delivery(
	num number(8) constraint delivery_pk_num primary key,
	paid_num number(8) constraint delivery_fk_paid_num references paid(num),
	company varchar2(12) UNIQUE,
	deliv_num number(12) UNIQUE,
	state number(1) default 0 not null constraint delivery_ck_state check(state between 0 and 3),
	deliv_start date not null,
	deliv_end date
);

create sequence mileage_seq start with 1 increment by 1;
create table mileage(
	num number(8) constraint mileage_pk_num primary key,
	mem_num number(8) constraint mileage_fk_mem_num references member(num),
	paid_num number(8) null constraint mileage_fk_paid_num references paid(num),
	now_mileage number(12) not null,
	indate date,
	state number(1) default 0 not null constraint mileage_ck_state check(state between 0 and 2)
);

create sequence trade_seq start with 1 increment by 1;
create table trade(
	num number(8) constraint trade_pk_num primary key,
	paid_num number(8) constraint trade_fk_paid_num references paid(num),
	deliv_state number(1) not null constraint trade_ck_deliv_state check(deliv_state between 0 and 7),
	trade_start date not null,
	trade_end date,
	reason number(1) not null constraint trade_ck_reason check(reason between 0 and 3)
);

create sequence refund_seq start with 1 increment by 1;
create table refund(
	num number(8) constraint refund_pk_num primary key,
	paid_num number(8) constraint refund_fk_paid_num references paid(num),
	refund_start date not null,
	refund_state number(1) not null constraint refund_ck_refund_state check(refund_state between -1 and 5),
	refund_end date,
	reason number(1) not null constraint refund_ck_reason check(reason between 0 and 3),
	refund_bank varchar2(20) not null,
	refund_account number(12) not null,
	refund_name varchar2(20) not null
);

create sequence cancel_seq start with 1 increment by 1;
create table cancel(
	num number(8) constraint cancel_pk_num primary key,
	paid_num number(8) constraint cancel_fk_paid_num references paid(num),
	cancel_start date,
	cancel_end date
);

create sequence review_seq start with 1 increment by 1;
create table review(
	num number(8) constraint review_pk_num primary key,
	paid_num number(8) constraint review_fk_paid_num references paid(num),
	mem_num number(8) constraint review_fk_mem_num references member(num),
	body_size varchar2(10),
	content varchar2(4000) not null,	
	star number(1) default 0 not null constraint review_ck_star check(star between 0 and 5),
	indate date
);

create sequence img_path_seq start with 1 increment by 1;
create table img_path(
	num number(8) constraint img_pk_num primary key,
	data_num number(8) null constraint img_fk_data_num references product_data(num),
	guide_num number(8) null constraint img_fk_guide_num references shop_guide(num),
	icon_num number(8) null constraint img_fk_icon_num references icon(num),
	product_num number(8) null constraint img_fk_product_num references product(num),
	review_num number(8) null constraint img_fk_review_num references review(num),
	qna_num number(8) null constraint img_fk_qna_num references qna(num),
	notice_num number(8) null constraint img_fk_notice_num references notice(num),
	banner_num number(8) null constraint img_fk_banner_num references banner(num),
	name varchar2(100) default 'no_img.jpg' not null
);

-- TEST DATA

-- 회사정보DB
INSERT INTO company VALUES(
company_seq.nextval, 'CLASSIC', 01011112222, '클래식', '의류업', '의류', 'classic@c.com', '03164',
'서울특별시 종로구 종로 69', '서울YMCA 7층', 01022223333, 023334444, '2017-서울종로-0101','오후 3:00~8:30');

-- 회원DB
INSERT INTO member VALUES(member_seq.nextval, 'member1', '1234', '01099998888', 'member1@c.com', 1, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'member2', '1234', '01099998888', 'member2@c.com', 2, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'member3', '1234', '01099998888', 'member3@c.com', 3, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'admin1', '1234', '01099998888', 'admin1@c.com', 0, sysdate);

-- 배송주소록DB
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 1, '우편번호', '기본주소', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 1, '우편번호1', '기본주소1', '상세주소1');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 2, '우편번호', '기본주소', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 2, '우편번호1', '기본주소1', '상세주소1');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 3, '우편번호', '기본주소', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 3, '우편번호1', '기본주소1', '상세주소1');

-- 쿠폰로그용DB
INSERT INTO coupon_log VALUES(coupon_log_seq.nextval, 1, 1, 1, '[Lv1 배송비 쿠폰]', 0.25, '배송비 쿠폰', sysdate, TO_DATE('2018-04-05','yyyy-mm-dd'), 100, 0);
INSERT INTO coupon_log VALUES(coupon_log_seq.nextval, 2, 0, 1, '[Lv2 30% 쿠폰]', 0.3, '30% 할인 쿠폰', sysdate, TO_DATE('2018-04-05','yyyy-mm-dd'), 100, 0);
INSERT INTO coupon_log VALUES(coupon_log_seq.nextval, 3, 0, 1, '[Lv3 50% 쿠폰]', 0.5, '50% 할인 쿠폰', sysdate, TO_DATE('2018-04-05','yyyy-mm-dd'), 100, 0);
INSERT INTO coupon_log VALUES(coupon_log_seq.nextval, 0, 0, 0,'[회원가입 할인쿠폰]', 0.5, '회원가입 할인 쿠폰', sysdate, TO_DATE('2018-04-05','yyyy-mm-dd'), 1000, 0);

-- 쿠폰DB
INSERT INTO coupon VALUES(coupon_seq.nextval, 1, 1, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 2, 2, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 3, 3, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 1, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 2, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 3, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 1, 1, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 2, 2, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 3, 3, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 1, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 2, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 3, 4, 0, sysdate);

-- 상품필수정보DB
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개1', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개2', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개3', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개4', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개5', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개6', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개7', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개8', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개9', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개10', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개11', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개12', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개13', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개14', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');

-- 가이드DB
INSERT INTO shop_guide (num, state, subject, deliv_info) VALUES(shop_guide_seq.nextval, 0, 0, '배송안내 기본 설정');
INSERT INTO shop_guide (num, state, subject, refund_info) VALUES(shop_guide_seq.nextval, 0, 1, '환불안내 기본 설정');
INSERT INTO shop_guide (num, state, subject, trade_info) VALUES(shop_guide_seq.nextval, 0, 2, '교환안내 기본 설정');
INSERT INTO shop_guide (num, state, subject, as_info) VALUES(shop_guide_seq.nextval, 0, 3, 'AS안내 기본 설정');
INSERT INTO shop_guide (num, state, subject, unregi_info) VALUES(shop_guide_seq.nextval, 0, 4, '탈퇴안내 기본 설정');
INSERT INTO shop_guide (num, state, subject, deliv_info) VALUES(shop_guide_seq.nextval, 1, 0, '배송안내 직접 입력');
INSERT INTO shop_guide (num, state, subject, refund_info) VALUES(shop_guide_seq.nextval, 1, 1, '환불안내 직접 입력');
INSERT INTO shop_guide (num, state, subject, trade_info) VALUES(shop_guide_seq.nextval, 1, 2, '교환안내 직접 입력');
INSERT INTO shop_guide (num, state, subject, as_info) VALUES(shop_guide_seq.nextval, 1, 3, 'AS안내 직접 입력');
INSERT INTO shop_guide (num, state, subject, unregi_info) VALUES(shop_guide_seq.nextval, 1, 4, '탈퇴안내 직접 입력');

-- 상품대분류DB
INSERT INTO cate VALUES(cate_seq.nextval, 'NEW', 1);
INSERT INTO cate VALUES(cate_seq.nextval, 'BEST', 1);
INSERT INTO cate VALUES(cate_seq.nextval, 'OUTER', 1);
INSERT INTO cate VALUES(cate_seq.nextval, 'TOP', 1);
INSERT INTO cate VALUES(cate_seq.nextval, 'BOTTOM', 1);
INSERT INTO cate VALUES(cate_seq.nextval, 'SHOES'||chr(38)||'BAG', 1);
INSERT INTO cate VALUES(cate_seq.nextval, 'ACC', 1);
INSERT INTO cate VALUES(cate_seq.nextval, '노출X', 0);
INSERT INTO cate VALUES(cate_seq.nextval, '노출X', 0);
INSERT INTO cate VALUES(cate_seq.nextval, '노출X', 0);

-- 상품소분류DB
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='OUTER'), 'COAT', 1);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='OUTER'), 'JACKET', 1);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='OUTER'), 'JUMPER', 1);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='OUTER'), 'CARDIGAN', 1);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='OUTER'), 'X', 0);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='TOP'), 'T-SHIRT', 1);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='TOP'), 'KNIT', 1);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='TOP'), 'BLOUSE', 1);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='TOP'), 'X', 0);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='BOTTOM'), 'SKIRTS', 1);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='BOTTOM'), 'PANTS', 1);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='BOTTOM'), 'DENIM', 1);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='BOTTOM'), 'X', 0);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='SHOES'||chr(38)||'BAG'), 'SHOES', 1);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='SHOES'||chr(38)||'BAG'), 'BAG', 1);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='ACC'), 'ACC', 1);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='ACC'), 'X', 0);
-- 상품DB
INSERT INTO product VALUES(product_seq.nextval,'0000001',1,'상품명1','서브 설명','메인 설명',100000,50000,'FREE,S,M,L',999,1,1,1,1,sysdate,0,sysdate);
INSERT INTO product VALUES(product_seq.nextval,'0000001',1,'상품명2','서브 설명','메인 설명',100000,50000,'FREE,S,M,L',999,1,1,1,0,sysdate,0,sysdate);
INSERT INTO product VALUES(product_seq.nextval,'0000001',1,'상품명3','서브 설명','메인 설명',100000,50000,'FREE,S,M,L',999,1,1,-1,1,sysdate,0,sysdate);
INSERT INTO product VALUES(product_seq.nextval,'0000001',1,'상품명4','서브 설명','메인 설명',100000,50000,'FREE,S,M,L',999,1,1,0,0,sysdate,0,sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='JACKET'), '상품명5', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='JACKET'), '상품명6', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='JACKET'), '상품명7', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='JACKET'), '상품명8', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='JUMPER'), '상품명9', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='JUMPER'), '상품명10', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='JUMPER'), '상품명11', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='JUMPER'), '상품명12', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='CARDIGAN'), '상품명13', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='CARDIGAN'), '상품명14', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='CARDIGAN'), '상품명15', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='CARDIGAN'), '상품명16', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='T-SHIRT'), '상품명17', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='T-SHIRT'), '상품명18', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='T-SHIRT'), '상품명19', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='T-SHIRT'), '상품명20', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='KNIT'), '상품명21', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='KNIT'), '상품명22', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='KNIT'), '상품명23', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='KNIT'), '상품명24', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='BLOUSE'), '상품명25', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='BLOUSE'), '상품명26', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='BLOUSE'), '상품명27', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='BLOUSE'), '상품명28', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='SKIRTS'), '상품명29', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='SKIRTS'), '상품명30', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='SKIRTS'), '상품명31', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='SKIRTS'), '상품명32', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='PANTS'), '상품명33', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='PANTS'), '상품명34', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='PANTS'), '상품명35', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='PANTS'), '상품명36', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='DENIM'), '상품명37', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='DENIM'), '상품명38', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='DENIM'), '상품명39', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='DENIM'), '상품명40', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='SHOES'), '상품명41', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='SHOES'), '상품명42', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='SHOES'), '상품명43', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='SHOES'), '상품명44', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='BAG'), '상품명45', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='BAG'), '상품명46', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='BAG'), '상품명47', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='BAG'), '상품명48', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='ACC'), '상품명49', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='ACC'), '상품명50', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='ACC'), '상품명51', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='ACC'), '상품명52', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 0, 0, sysdate, 0, sysdate);

-- 상품색상DB
INSERT INTO colour VALUES(colour_seq.nextval, 1, 'F0F8FF', '색상1');
INSERT INTO colour VALUES(colour_seq.nextval, 2, 'F0F8F1', '색상2');
INSERT INTO colour VALUES(colour_seq.nextval, 3, 'F0F8F2', '색상3');
INSERT INTO colour VALUES(colour_seq.nextval, 4, 'F0F8F3', '색상4');
INSERT INTO colour VALUES(colour_seq.nextval, 5, 'F0F8F4', '색상5');
INSERT INTO colour VALUES(colour_seq.nextval, 6, 'F0F8F5', '색상6');
INSERT INTO colour VALUES(colour_seq.nextval, 7, 'F0F8F6', '색상7');
INSERT INTO colour VALUES(colour_seq.nextval, 8, 'F0F8F7', '색상8');
INSERT INTO colour VALUES(colour_seq.nextval, 9, 'F0F8F8', '색상9');
INSERT INTO colour VALUES(colour_seq.nextval, 10, 'F0F8F9', '색상10');
INSERT INTO colour VALUES(colour_seq.nextval, 11, 'F0F810', '색상11');
INSERT INTO colour VALUES(colour_seq.nextval, 12, 'F0F811', '색상12');
INSERT INTO colour VALUES(colour_seq.nextval, 13, 'F0F812', '색상13');
INSERT INTO colour VALUES(colour_seq.nextval, 14, 'F0F813', '색상14');
INSERT INTO colour VALUES(colour_seq.nextval, 1, 'F0F8FF', '색상1');
INSERT INTO colour VALUES(colour_seq.nextval, 2, 'F0F8F1', '색상2');
INSERT INTO colour VALUES(colour_seq.nextval, 3, 'F0F8F2', '색상3');
INSERT INTO colour VALUES(colour_seq.nextval, 4, 'F0F8F3', '색상4');
INSERT INTO colour VALUES(colour_seq.nextval, 5, 'F0F8F4', '색상5');
INSERT INTO colour VALUES(colour_seq.nextval, 6, 'F0F8F5', '색상6');
INSERT INTO colour VALUES(colour_seq.nextval, 7, 'F0F8F6', '색상7');
INSERT INTO colour VALUES(colour_seq.nextval, 8, 'F0F8F7', '색상8');
INSERT INTO colour VALUES(colour_seq.nextval, 9, 'F0F8F8', '색상9');
INSERT INTO colour VALUES(colour_seq.nextval, 10, 'F0F8F9', '색상10');
INSERT INTO colour VALUES(colour_seq.nextval, 11, 'F0F810', '색상11');
INSERT INTO colour VALUES(colour_seq.nextval, 12, 'F0F811', '색상12');
INSERT INTO colour VALUES(colour_seq.nextval, 13, 'F0F812', '색상13');
INSERT INTO colour VALUES(colour_seq.nextval, 14, 'F0F813', '색상14');
INSERT INTO colour VALUES(colour_seq.nextval, 15, 'F0F8FF', '색상1');
INSERT INTO colour VALUES(colour_seq.nextval, 16, 'F0F8F1', '색상2');
INSERT INTO colour VALUES(colour_seq.nextval, 17, 'F0F8F2', '색상3');
INSERT INTO colour VALUES(colour_seq.nextval, 18, 'F0F8F3', '색상4');
INSERT INTO colour VALUES(colour_seq.nextval, 19, 'F0F8F4', '색상5');
INSERT INTO colour VALUES(colour_seq.nextval, 20, 'F0F8F5', '색상6');
INSERT INTO colour VALUES(colour_seq.nextval, 21, 'F0F8F6', '색상7');
INSERT INTO colour VALUES(colour_seq.nextval, 22, 'F0F8F7', '색상8');
INSERT INTO colour VALUES(colour_seq.nextval, 23, 'F0F8F8', '색상9');
INSERT INTO colour VALUES(colour_seq.nextval, 24, 'F0F8F9', '색상10');
INSERT INTO colour VALUES(colour_seq.nextval, 25, 'F0F810', '색상11');
INSERT INTO colour VALUES(colour_seq.nextval, 26, 'F0F811', '색상12');
INSERT INTO colour VALUES(colour_seq.nextval, 27, 'F0F812', '색상13');
INSERT INTO colour VALUES(colour_seq.nextval, 28, 'F0F813', '색상14');
INSERT INTO colour VALUES(colour_seq.nextval, 1, 'F0F8FF', '색상1');
INSERT INTO colour VALUES(colour_seq.nextval, 2, 'F0F8F1', '색상2');
INSERT INTO colour VALUES(colour_seq.nextval, 3, 'F0F8F2', '색상3');
INSERT INTO colour VALUES(colour_seq.nextval, 4, 'F0F8F3', '색상4');
INSERT INTO colour VALUES(colour_seq.nextval, 5, 'F0F8F4', '색상5');
INSERT INTO colour VALUES(colour_seq.nextval, 6, 'F0F8F5', '색상6');
INSERT INTO colour VALUES(colour_seq.nextval, 7, 'F0F8F6', '색상7');
INSERT INTO colour VALUES(colour_seq.nextval, 8, 'F0F8F7', '색상8');
INSERT INTO colour VALUES(colour_seq.nextval, 9, 'F0F8F8', '색상9');
INSERT INTO colour VALUES(colour_seq.nextval, 10, 'F0F8F9', '색상10');
INSERT INTO colour VALUES(colour_seq.nextval, 11, 'F0F810', '색상11');
INSERT INTO colour VALUES(colour_seq.nextval, 12, 'F0F811', '색상12');
INSERT INTO colour VALUES(colour_seq.nextval, 13, 'F0F812', '색상13');
INSERT INTO colour VALUES(colour_seq.nextval, 14, 'F0F813', '색상14');
INSERT INTO colour VALUES(colour_seq.nextval, 1, 'F0F8FF', '색상1');
INSERT INTO colour VALUES(colour_seq.nextval, 2, 'F0F8F1', '색상2');
INSERT INTO colour VALUES(colour_seq.nextval, 3, 'F0F8F2', '색상3');
INSERT INTO colour VALUES(colour_seq.nextval, 4, 'F0F8F3', '색상4');
INSERT INTO colour VALUES(colour_seq.nextval, 5, 'F0F8F4', '색상5');
INSERT INTO colour VALUES(colour_seq.nextval, 6, 'F0F8F5', '색상6');
INSERT INTO colour VALUES(colour_seq.nextval, 7, 'F0F8F6', '색상7');
INSERT INTO colour VALUES(colour_seq.nextval, 8, 'F0F8F7', '색상8');
INSERT INTO colour VALUES(colour_seq.nextval, 9, 'F0F8F8', '색상9');
INSERT INTO colour VALUES(colour_seq.nextval, 10, 'F0F8F9', '색상10');
INSERT INTO colour VALUES(colour_seq.nextval, 11, 'F0F810', '색상11');
INSERT INTO colour VALUES(colour_seq.nextval, 12, 'F0F811', '색상12');
INSERT INTO colour VALUES(colour_seq.nextval, 13, 'F0F812', '색상13');
INSERT INTO colour VALUES(colour_seq.nextval, 14, 'F0F813', '색상14');
INSERT INTO colour VALUES(colour_seq.nextval, 15, 'F0F8FF', '색상1');
INSERT INTO colour VALUES(colour_seq.nextval, 16, 'F0F8F1', '색상2');
INSERT INTO colour VALUES(colour_seq.nextval, 17, 'F0F8F2', '색상3');
INSERT INTO colour VALUES(colour_seq.nextval, 18, 'F0F8F3', '색상4');
INSERT INTO colour VALUES(colour_seq.nextval, 19, 'F0F8F4', '색상5');
INSERT INTO colour VALUES(colour_seq.nextval, 20, 'F0F8F5', '색상6');
INSERT INTO colour VALUES(colour_seq.nextval, 21, 'F0F8F6', '색상7');
INSERT INTO colour VALUES(colour_seq.nextval, 22, 'F0F8F7', '색상8');
INSERT INTO colour VALUES(colour_seq.nextval, 23, 'F0F8F8', '색상9');
INSERT INTO colour VALUES(colour_seq.nextval, 24, 'F0F8F9', '색상10');
INSERT INTO colour VALUES(colour_seq.nextval, 25, 'F0F810', '색상11');
INSERT INTO colour VALUES(colour_seq.nextval, 26, 'F0F811', '색상12');
INSERT INTO colour VALUES(colour_seq.nextval, 27, 'F0F812', '색상13');
INSERT INTO colour VALUES(colour_seq.nextval, 28, 'F0F813', '색상14');

-- 아이콘DB
INSERT INTO icon VALUES(icon_seq.nextval, 1, 'best', sysdate, TO_DATE('2018-04-05','yyyy-mm-dd'), 1);
INSERT INTO icon VALUES(icon_seq.nextval, 2, 'new', sysdate, TO_DATE('2018-04-05','yyyy-mm-dd'), 1);
INSERT INTO icon VALUES(icon_seq.nextval, 4, 'hit', sysdate, TO_DATE('2018-04-05','yyyy-mm-dd'), 0);
INSERT INTO icon VALUES(icon_seq.nextval, 5, 'sale', sysdate, TO_DATE('2018-04-05','yyyy-mm-dd'), 0);

-- 배너
insert into banner values(banner_seq.nextval,4,'연말특별세일','내용',TO_DATE('2017-01-02','yyyy-mm-dd'),TO_DATE('2017-01-09','yyyy-mm-dd'),1);
insert into banner values(banner_seq.nextval,4,'리뷰이벤트','내용',TO_DATE('2017-01-02','yyyy-mm-dd'),TO_DATE('2017-01-09','yyyy-mm-dd'),0);
insert into banner values(banner_seq.nextval,4,'무료배송이벤트','내용',TO_DATE('2017-01-02','yyyy-mm-dd'),TO_DATE('2017-01-09','yyyy-mm-dd'),-1);

--faq
insert into faq values(faq_seq.nextval,4,'불량제품이 왔어요','자답');
insert into faq values(faq_seq.nextval,4,'배송기간이 어떻게 되나요?','자답');
insert into faq values(faq_seq.nextval,4,'배송조회는 어디서 하나요?','자답');

-- notice
insert into notice values(notice_seq.nextval,4,'설연휴 배송 지연 안내','내용',0,sysdate);
insert into notice values(notice_seq.nextval,4,'교환 및 환불양식','내용',0,sysdate);
insert into notice values(notice_seq.nextval,4,'상품별 사이즈 측정 방법안내','내용',0,sysdate);

-- qna
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,1,0,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,1,1,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,1,2,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,1,3,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,1,4,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,1,5,'내용',0,0,sysdate);
insert into qna values(qna_seq.nextval,1,0,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,1,1,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,1,2,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,1,3,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,1,4,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,1,5,'내용',0,1,'1234',sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,2,0,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,2,1,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,2,2,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,2,3,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,2,4,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,2,5,'내용',0,0,sysdate);
insert into qna values(qna_seq.nextval,2,0,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,2,1,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,2,2,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,2,3,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,2,4,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,2,5,'내용',0,1,'1234',sysdate);

-- qna_reply
insert into qna_reply values(qna_reply_seq.nextval,1,4,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,2,4,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,3,4,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,4,4,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,5,4,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,6,4,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,7,4,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,8,4,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,9,4,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,10,4,'내용',sysdate);

drop user classic_admin cascade;
create user classic_admin identified by admin1234 default tablespace CLASSIC_DB
quota unlimited on CLASSIC_DB;

grant connect to classic_admin;
grant create synonym to classic_admin;
grant select any table to classic_admin;
grant delete any table to classic_admin;
grant update any table to classic_admin;
grant insert any table to classic_admin;
grant select any sequence to classic_admin;

conn classic_admin/admin1234;

create synonym company for classic_dba.company;
create synonym member for classic_dba.member;
create synonym addr_book for classic_dba.addr_book;
create synonym coupon for classic_dba.coupon;
create synonym coupon_log for classic_dba.coupon_log;
create synonym banner for classic_dba.banner;
create synonym faq for classic_dba.faq;
create synonym notice for classic_dba.notice;
create synonym qna for classic_dba.qna;
create synonym qna_reply for classic_dba.qna_reply;
create synonym product_data for classic_dba.product_data;
create synonym shop_guide for classic_dba.shop_guide;
create synonym colour for classic_dba.colour;
create synonym cate for classic_dba.cate;
create synonym mini_cate for classic_dba.mini_cate;
create synonym product for classic_dba.product;
create synonym review for classic_dba.review;
create synonym icon for classic_dba.icon;
create synonym wish for classic_dba.wish;
create synonym bank for classic_dba.bank;
create synonym paid for classic_dba.paid;
create synonym delivery for classic_dba.delivery;
create synonym trade for classic_dba.trade;
create synonym refund for classic_dba.refund;
create synonym cancel for classic_dba.cancel;
create synonym mileage for classic_dba.mileage;
create synonym img_path for classic_dba.img_path;

create synonym company_seq for classic_dba.company_seq;
create synonym member_seq for classic_dba.member_seq;
create synonym addr_book_seq for classic_dba.addr_book_seq;
create synonym coupon_seq for classic_dba.coupon_seq;
create synonym coupon_log_seq for classic_dba.coupon_log_seq;
create synonym banner_seq for classic_dba.banner_seq;
create synonym faq_seq for classic_dba.faq_seq;
create synonym notice_seq for classic_dba.notice_seq;
create synonym qna_seq for classic_dba.qna_seq;
create synonym qna_reply_seq for classic_dba.qna_reply_seq;
create synonym product_data_seq for classic_dba.product_data_seq;
create synonym shop_guide_seq for classic_dba.shop_guide_seq;
create synonym colour_seq for classic_dba.colour_seq;
create synonym cate_seq for classic_dba.cate_seq;
create synonym mini_cate_seq for classic_dba.mini_cate_seq;
create synonym product_seq for classic_dba.product_seq;
create synonym review_seq for classic_dba.review_seq;
create synonym icon_seq for classic_dba.icon_seq;
create synonym wish_seq for classic_dba.wish_seq;
create synonym bank_seq for classic_dba.bank_seq;
create synonym paid_seq for classic_dba.paid_seq;
create synonym delivery_seq for classic_dba.delivery_seq;
create synonym trade_seq for classic_dba.trade_seq;
create synonym refund_seq for classic_dba.refund_seq;
create synonym cancel_seq for classic_dba.cancel_seq;
create synonym mileage_seq for classic_dba.mileage_seq;
create synonym img_path_seq for classic_dba.img_path_seq;


-- 테이블 수정

conn classic_dba/dba1234

ALTER TABLE paid MODIFY(order_num NUMBER(16));
ALTER TABLE paid MODIFY(memo VARCHAR2(300));
ALTER TABLE paid DROP COLUMN cancel_start;
ALTER TABLE paid DROP COLUMN cancel_end;
ALTER TABLE coupon_log MODIFY(name VARCHAR2(50));

conn classic_admin/admin1234

--은경
--가능하다면 coupon_log name도 사이즈 늘렸으면 좋겠어요. 이거 오류나서 뒤에 연결되는 테이블도 오류납니다. --> 완료
--이렇게 오류나면 레코드 생성안되고 시퀀스 번호 넘어가서 뒤에 연결되는 테이블 줄줄이 시퀀스 꼬입니다. --> 완료
--fk 는 되도록이면 서브쿼리 써주세요. -->힝구..
--fk 쓰는 테이블들 db test sample 서브쿼리 안 쓴 레코드들은 확인 부탁 드립니다. --> 힝구....
--예) INSERT INTO coupon VALUES(coupon_seq.nextval, 1, (select num from coupon_log where name='[회원가입 할인쿠폰]'), 1, sysdate);
--주문번호 select concat(to_number(to_char(sysdate, 'yymmdd')), coupon_log_seq.nextval) from dual;

-- 주문 db
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,1,null,2017110812345678,'김경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','벨고장났어요',to_date('2017-11-09','yyyy-mm-dd'),0,100000,90000,to_date('2017-11-08','yyyy-mm-dd'),1,'김경미',);
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,1,null,2017112900000001,'박경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','배송 전 연락 부탁드려요',null,0,100000,90000,to_date('2017-11-29','yyyy-mm-dd'),0,'함혜진');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,1,null,2017120800000001,'최경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','부재 시 문 앞에 두고 가주세요',to_date('2017-12-08','yyyy-mm-dd'),0,100000,90000,to_date('2017-12-08','yyyy-mm-dd'),1,'최경미'); 
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,1,null,2017111800000001,'이경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','부재 시 경비실에 맡겨주세요',to_date('2017-11-19','yyyy-mm-dd'),0,100000,90000,to_date('2017-11-18','yyyy-mm-dd'),2,'이경미');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,1,null,2017123000000001,'강경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호',null,null,0,100000,90000,to_date('2017-12-30','yyyy-mm-dd'),0,'송유정');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,1,null,2017101900000001,'유경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','도착하셔서 연락 부탁드립니다',to_date('2017-10-20','yyyy-mm-dd'),0,100000,90000,to_date('2017-10-19','yyyy-mm-dd'),2,'유경미');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,1,null,2017112400000011,'곽경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호',null,null,0,100000,90000,to_date('2017-11-24','yyyy-mm-dd'),0,'곽경미');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,1,null,2017122800000011,'함경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','잘 부탁드립니다.',to_date('2017-12-29','yyyy-mm-dd'),0,100000,90000,to_date('2017-12-28','yyyy-mm-dd'),1,'곽은경');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,1,null,2017082900000011,'송경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','감사합니다.',to_date('2017-08-29','yyyy-mm-dd'),0,100000,90000,to_date('2017-08-29','yyyy-mm-dd'),1,'송경미');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,1,null,2018010100000011,'경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','출입문 앞에서 연락 부탁드려요',null,0,100000,90000,to_date('2018-01-01','yyyy-mm-dd'),0,'유반니');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,1,null,2017110800000002,'미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','항상 감사합니다',to_date('2017-11-08','yyyy-mm-dd'),0,100000,90000,to_date('2017-11-08','yyyy-mm-dd'),1,'김주연');

insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,1,null,2017112900000002,'송유정',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호',null,null,2,100000,100000,to_date('2017-11-29','yyyy-mm-dd'),0,'박보검');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,1,null,2017120100000011,'김혜자',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','빠른배송 부탁드립니다.',to_date('2017-12-01','yyyy-mm-dd'),2,100000,97000,to_date('2017-12-01','yyyy-mm-dd'),1,'김혜자');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,2,1,null,2017120300000001,'김창렬',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호',null,to_date('2017-12-04','yyyy-mm-dd'),0,100000,1000000,to_date('2017-12-01','yyyy-mm-dd'),1,'김창렬');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,3,5,null,2017120500000123,'김종렬',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','노크부탁',to_date('2017-12-05','yyyy-mm-dd'),1,100000,1000000 ,to_date('2017-12-06','yyyy-mm-dd'),1,'김종렬');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values(paid_seq.nextval,2,50,null,2017121200000011,'심수봉',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호',null,to_date('2017-12-12','yyyy-mm-dd'),0,100000,1000000,to_date('2017-12-12','yyyy-mm-dd'),1,'남진');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,3,25,null,2017121300000012,'김지석',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호',null,to_date('2017-12-14','yyyy-mm-dd'),0,100000,1000000,to_date('2017-12-13','yyyy-mm-dd'),1,'김지석');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,2,3,null,2017121500000012,'송지석',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','빠른배송ㄱㄱ',null,0,100000,1000000,to_date('2017-12-15','yyyy-mm-dd'),0,'송지석');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,3,1,null,2017122200000123,'유정란',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','차조심',to_date('2017-12-22','yyyy-mm-dd'),0,100000,1000000,to_date('2017-12-22','yyyy-mm-dd'),2,'무정란');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,35,null,2017122400000121,'유정',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','크리스마스조심',to_date('2017-12-24','yyyy-mm-dd'),0,100000,1000000,to_date('2017-12-25','yyyy-mm-dd'),1,'유정');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,52,null,2017123000000122,'김상우',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','신년조심',to_date('2017-12-30','yyyy-mm-dd'),0,100000,1000000,to_date('2017-12-30','yyyy-mm-dd'),1,'김상우');


--wish db
INSERT INTO wish VALUES(wish_seq.nextval ,1 , 1, sysdate);
INSERT INTO wish VALUES(wish_seq.nextval ,2 , 2, sysdate);
INSERT INTO wish VALUES(wish_seq.nextval ,3 , 3, sysdate);
INSERT INTO wish VALUES(wish_seq.nextval ,5 , 3, sysdate);
INSERT INTO wish VALUES(wish_seq.nextval ,6 , 3, sysdate);

-- 상품후기DB
INSERT INTO review VALUES(review_seq.nextval, 1, 1, '치수', '내용', 1, sysdate);
INSERT INTO review VALUES(review_seq.nextval, 1, 1, '치수', '내용', 2, sysdate);
INSERT INTO review VALUES(review_seq.nextval, 1, 1, '치수', '내용', 3, sysdate);
INSERT INTO review VALUES(review_seq.nextval, 1, 1, '치수', '내용', 4, sysdate);
INSERT INTO review VALUES(review_seq.nextval, 1, 1, '치수', '내용', 5, sysdate);
INSERT INTO review VALUES(review_seq.nextval, 1, 1, '치수', '내용', 5, sysdate);

--마일리지
INSERT INTO mileage VALUES(mileage_seq.nextval,1,1,200000,sysdate,2);
-- bank, delivery, trade, refund, cancel, mileage, img_path TEST DATA 없음
INSERT INTO mileage VALUES(mileage_seq.nextval,1,1,null,200000,sysdate,2);

--테이블 수정
ALTER TABLE bank MODIFY(bank_name VARCHAR2(12));
ALTER TABLE bank MODIFY(bank_num NUMBER(16));

--company uk빼야함
drop table delivery;
create sequence delivery_seq start with 1 increment by 1;
create table delivery(
	num number(8) constraint delivery_pk_num primary key,
	paid_num number(8) constraint delivery_fk_paid_num references paid(num),
	company varchar2(12),
	deliv_num number(16) UNIQUE,
	state number(1) default 0 not null constraint delivery_ck_state check(state between 0 and 3),
	deliv_start date not null,
	deliv_end date
);

-- bank
INSERT INTO bank VALUES(bank_seq.nextval ,'우리은행' ,'1002536238755','클래식');
INSERT INTO bank VALUES(bank_seq.nextval ,'신한은행' ,'22875504956326','클래식');
INSERT INTO bank VALUES(bank_seq.nextval ,'국민은행' ,'5678920563257','클래식');

--delivery
INSERT INTO delivery VALUES(delivery_seq.nextval ,41 ,'CJ택배','6898000144426575' ,1 ,sysdate , '');
INSERT INTO delivery VALUES(delivery_seq.nextval ,52 ,'','' ,0 ,sysdate , '');
INSERT INTO delivery VALUES(delivery_seq.nextval ,43 ,'대한통운','1111222233334444' ,2 ,sysdate , '');
INSERT INTO delivery VALUES(delivery_seq.nextval ,47 ,'대한통운','6666222233335555' ,3 ,sysdate , '20180107');

--trade
INSERT INTO trade VALUES(trade_seq.nextval ,44,0,sysdate,'',0);
INSERT INTO trade VALUES(trade_seq.nextval ,45,2,sysdate,'',2);

--refund
INSERT INTO refund VALUES(refund_seq.nextval ,46,sysdate,1,'',1,'카카오뱅크','12345678912','김다혜');
INSERT INTO refund VALUES(refund_seq.nextval ,47,sysdate,5,'',2,'우리은행','12345678912','홍길동');

--cancel
INSERT INTO cancel VALUES(cancel_seq.nextval ,48,sysdate,'');
INSERT INTO cancel VALUES(cancel_seq.nextval ,49,sysdate,'20180109');

-- img_path TEST DATA 없음
-- 수정사항: 주문테이블(paid) 주문번호에 uk 빼야함니다!!
-- 주문디비 다 수정함!! 
-- 18/01/09 DB 수정 

conn classic_dba/dba1234
ALTER TABLE product DROP COLUMN sizu;
CREATE sequence sizu_seq start WITH 1 increment BY 1;
CREATE table sizu(
	num number(8) CONSTRAINT sizu_pk_num PRIMARY KEY,
	sizu varchar2(10),
	product_num number(8) constraint sizu_fk_product_num references product(num)
);
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명1'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명1'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명1'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명2'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명2'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명2'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명2'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명3'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명3'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명3'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명3'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명4'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명4'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명4'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명4'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명5'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명5'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명5'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명5'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명6'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명6'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명6'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명6'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명7'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명7'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명7'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명7'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명8'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명8'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명8'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명8'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명9'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명9'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명9'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명9'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명10'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명10'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명10'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명10'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명11'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명11'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명11'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명11'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명12'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명12'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명12'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명12'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명13'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명13'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명13'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명13'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명14'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명14'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명14'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명14'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명15'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명15'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명15'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명15'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명16'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명16'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명16'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명16'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명17'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명17'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명17'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명17'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명18'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명18'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명18'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명18'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명19'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명19'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명19'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명19'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명20'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명20'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명20'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명20'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명21'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명21'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명21'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명21'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명22'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명22'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명22'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명22'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명23'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명23'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명23'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명23'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명24'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명24'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명24'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명24'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명25'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명25'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명25'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명25'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명26'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명26'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명26'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명26'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명27'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명27'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명27'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명27'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명28'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명28'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명28'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명28'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명29'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명29'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명29'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명29'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명30'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명30'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명30'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명30'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명31'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명31'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명31'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명31'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명32'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명32'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명32'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명32'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명33'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명33'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명33'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명33'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명34'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명34'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명34'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명34'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명35'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명35'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명35'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명35'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명36'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명36'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명36'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명36'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명37'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명37'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명37'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명37'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명38'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명38'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명38'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명38'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명39'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명39'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명39'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명39'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명40'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명40'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명40'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명40'));
--41~44 mini_cate 14(shoes) 
INSERT INTO sizu VALUES(sizu_seq.nextval, '230', (Select num from product where name='상품명41'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '235', (Select num from product where name='상품명41'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '240', (Select num from product where name='상품명41'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '245', (Select num from product where name='상품명41'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '230', (Select num from product where name='상품명42'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '235', (Select num from product where name='상품명42'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '240', (Select num from product where name='상품명42'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '245', (Select num from product where name='상품명42'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '230', (Select num from product where name='상품명43'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '235', (Select num from product where name='상품명43'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '240', (Select num from product where name='상품명43'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '245', (Select num from product where name='상품명43'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '230', (Select num from product where name='상품명44'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '235', (Select num from product where name='상품명44'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '240', (Select num from product where name='상품명44'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '245', (Select num from product where name='상품명44'));
-- 45~48 mini_cate 15(bag),  49~52 mini_cate 16(acc)
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명45'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명46'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명47'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명48'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명49'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명50'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명51'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명52'));

conn classic_admin/admin1234
create synonym sizu for classic_dba.sizu;
create synonym sizu_seq for classic_dba.sizu_seq;

--혜진 필요 DB
INSERT INTO member VALUES(member_seq.nextval, 'member4', '1234', '01099998888', 'member4@c.com', 3, sysdate);
INSERT INTO product VALUES(product_seq.nextval,'0000053',1,'상품명53','서브 설명','메인 설명',100000,50000,'FREE',999,1,1,1,1,sysdate,0,sysdate);
INSERT INTO product VALUES(product_seq.nextval,'0000054',1,'상품명53','서브 설명','메인 설명',100000,50000,'S',999,1,1,1,1,sysdate,0,sysdate);
INSERT INTO product VALUES(product_seq.nextval,'0000055',1,'상품명53','서브 설명','메인 설명',100000,50000,'M',999,1,1,1,1,sysdate,0,sysdate);
INSERT INTO product VALUES(product_seq.nextval,'0000056',1,'상품명53','서브 설명','메인 설명',100000,50000,'L',999,1,1,1,1,sysdate,0,sysdate);
INSERT INTO product VALUES(product_seq.nextval,'0000057',1,'상품명54','서브 설명','메인 설명',100000,50000,'FREE',999,1,1,1,1,sysdate,0,sysdate);
INSERT INTO product VALUES(product_seq.nextval,'0000058',1,'상품명54','서브 설명','메인 설명',100000,50000,'S',999,1,1,1,1,sysdate,0,sysdate);
INSERT INTO product VALUES(product_seq.nextval,'0000059',1,'상품명54','서브 설명','메인 설명',100000,50000,'M',999,1,1,1,1,sysdate,0,sysdate);
INSERT INTO product VALUES(product_seq.nextval,'0000060',1,'상품명54','서브 설명','메인 설명',100000,50000,'L',999,1,1,1,1,sysdate,0,sysdate);
INSERT INTO colour VALUES(colour_seq.nextval, (select num from product where code='0000053'), 'F0F8FF', '하늘색');
INSERT INTO colour VALUES(colour_seq.nextval, (select num from product where code='0000054'), 'F0F8FF', '하늘색');
INSERT INTO colour VALUES(colour_seq.nextval, (select num from product where code='0000055'), 'F0F8FF', '하늘색');
INSERT INTO colour VALUES(colour_seq.nextval, (select num from product where code='0000056'), 'F0F8FF', '하늘색');
INSERT INTO colour VALUES(colour_seq.nextval, (select num from product where code='0000057'), 'F0F8FF', '하늘색');
INSERT INTO colour VALUES(colour_seq.nextval, (select num from product where code='0000058'), 'F0F8FF', '하늘색');
INSERT INTO colour VALUES(colour_seq.nextval, (select num from product where code='0000059'), 'F0F8FF', '하늘색');
INSERT INTO colour VALUES(colour_seq.nextval, (select num from product where code='0000060'), 'F0F8FF', '하늘색');
INSERT INTO wish VALUES(wish_seq.nextval ,(select num from product where code='0000053'), (select num from member where id='member4'), sysdate);
INSERT INTO wish VALUES(wish_seq.nextval ,(select num from product where code='0000057'), (select num from member where id='member4'), sysdate);
INSERT INTO wish VALUES(wish_seq.nextval ,(select num from product where code='0000057'), (select num from member where id='member4'), sysdate);

--shop guide temporary data insert
insert into shop_guide values(shop_guide_seq.nextval, 1, 0, '배송안내 샵가이드 테스트 데이터 입니다.', '환불규정 안내 샵가이드 테스트 데이터입니다.','교환 안내 샵가이드 테스트 데이터입니다.', '고장수리 안내 샵가이드 테스트 데이터입니다.','탈퇴 안내 샵가이드 테스트 데이터입니다.' )


=======
-- 예전 파일
-- 다른 분들이 달아놓은 주석이 있음..!

-- ▼ 1/10 기준 수정사항 포함된 최신 sql
-- classic.sql 			: table DB
-- classic_test_data : test data DB


























DROP tablespace CLASSIC_DB including contents AND datafiles;

create tablespace CLASSIC_DB
datafile 'C:/oraclexe/app/oracle/oradata/XE/CLASSIC_DB.dbf'
size 200m
autoextend ON next 10m
maxsize 500m;

DROP USER classic_dba cascade;
CREATE USER classic_dba identified BY dba1234
DEFAULT tablespace CLASSIC_DB quota unlimited ON CLASSIC_DB
TEMPORARY tablespace temp;

grant connect, resource, dba to classic_dba;

conn classic_dba/dba1234;

CREATE sequence member_seq start WITH 1 increment BY 1;
CREATE table member(
	num number(8) CONSTRAINT member_pk_num PRIMARY KEY,
	id varchar2(12) UNIQUE,
	pw varchar2(12) not null,
	phone varchar2(14),
	mail varchar2(50) UNIQUE,
	grade number(1) DEFAULT 1 not null constraint member_ck_grade check(grade between -2 and 3),
	indate date
);

CREATE sequence addr_book_seq start WITH 1 increment BY 1;
CREATE table addr_book(
	num number(8) CONSTRAINT addr_pk_num PRIMARY KEY,
	mem_num number(8) CONSTRAINT addr_fk_mem_num references member(num),
	zip_code varchar2(21) not null,
	base_addr varchar2(200) not null,
	detail_addr varchar2(200) not null
);

CREATE sequence coupon_log_seq start WITH 1 increment BY 1;
CREATE table coupon_log(
num number(8) constraint coupon_log_pk_num primary key,
	grade number(1) default 0 constraint coupon_log_ck_grade check(grade between 0 and 3),
	state number(1) default 0 constraint coupon_log_ck_state check(state IN(0,1)),
	issue number(1) default 0 constraint coupon_log_ck_issue check(issue IN(0,1)),
	name varchar2(30) UNIQUE,
	sale number(2) not null,
	content varchar2(200),
	start_date date not null,
	end_date date not null,
	total number(4) not null,
	count number(4) default 0
);

create sequence coupon_seq start with 1 increment by 1;
create table coupon(
	num number(8) constraint coupon_pk_num primary key,
	mem_num number(8) constraint coupon_fk_mem_num references member(num),
	log_num number(8) constraint coupon_fk_log_num references coupon_log(num),
	state number(1) DEFAULT 1 constraint coupon_ck_state check(state IN(0,1)),
	indate date
);

create sequence banner_seq start with 1 increment by 1;
create table banner(
	num number(8) constraint banner_pk_num primary key,
	mem_num number(8) constraint banner_fk_mem_num references member(num),
	name varchar2(50) not null,
	content varchar2(4000),
	start_date date not null,
	end_date date,
	state number(1) DEFAULT 0 constraint banner_ck_state check(state IN(-1,0,1))
);

create sequence faq_seq start with 1 increment by 1;
create table faq(
	num number(8) constraint faq_pk_num primary key,
	mem_num number(8) not null constraint faq_fk_mem_num references member(num),
	q_title varchar2(100) not null,
	a_content varchar2(4000) not null
);

create sequence notice_seq start with 1 increment by 1;
create table notice(
	num number(8) constraint notice_pk_num primary key,
	mem_num number(8) constraint notice_fk_mem_num references member(num),
	title varchar2(200) not null,
	content varchar2(4000) not null,
	count number(8) default 0 not null,
	indate date
);

create sequence qna_seq start with 1 increment by 1;
create table qna(
	num number(8) constraint qna_pk_num primary key,
	mem_num number(8) constraint qna_fk_mem_num references member(num),
	subject number(1) default 0 not null constraint qna_ck_subject check(subject between 0 and 5),
	content varchar2(4000) not null,
	count number(8) default 0 not null,
	secure number(1) default 0 not null constraint qna_ck_secure check(secure in(0,1)),
	pwd varchar2(30),
	indate date not null
);

create sequence qna_reply_seq start with 1 increment by 1;
create table qna_reply(
	num number(8) constraint reply_pk_num primary key,
	qna_num number(8) constraint reply_fk_qna_num references qna(num),
	mem_num number(8) constraint reply_fk_mem_num references member(num),
	content varchar2(4000) not null,
	indate date not null
);

create sequence product_data_seq start with 1 increment by 1;
create table product_data(
	num number(8) constraint data_pk_num primary key,
	info varchar2(160) not null,	
	material varchar2(16) not null,	
	colour varchar2(30) not null,
	sizu varchar2(20) not null,	
	wash varchar2(1000) not null,	
	maker varchar2(30) not null,	
	nation varchar2(20) not null,
	make_date varchar2(16) not null,	
	supply varchar2(30) not null,	
	q_standard varchar2(100) not null,	
	as_person varchar2(10) not null,
	as_phone varchar2(30) not null,
	weight varchar2(6) not null
);

create sequence shop_guide_seq start with 1 increment by 1;
create table shop_guide(
	num number(8) constraint guide_pk_num primary key,
	state number(8) default 0 not null constraint guide_ck_state check(state IN(0,1)),
	subject number(8) default 0 not null constraint guide_ck_subject check(subject between 0 and 4),
	deliv_info varchar2(4000),
	refund_info varchar2(4000),
	trade_info varchar2(4000),
	as_info varchar2(4000),
	unregi_info varchar2(4000)
);

create sequence cate_seq start with 1 increment by 1;
create table cate(
	num number(8) constraint cate_pk_num primary key,
	name varchar2(16) not null,
	state number(1) default 1 not null constraint cate_ck_state check(state IN(0,1))
);

create sequence mini_cate_seq start with 1 increment by 1;
create table mini_cate(
	num number(8) constraint mini_pk_num primary key,
	cate_num number(8) constraint mini_fk_cate_num references cate(num),
	name varchar2(16) not null,
	state number(1) default 1 not null constraint mini_ck_state check(state IN(0,1))
);

create sequence product_seq start with 1 increment by 1;
create table product(
	num number(8) constraint product_pk_num primary key,
	code varchar2(16),
	cate_num number(8) constraint product_fk_cate_num references mini_cate(num),
	name varchar2(30) not null,
	sub_info varchar2(300) not null,
	main_info varchar2(4000) not null,
	price number(12) not null,
	buy_price number(12),
	sizu varchar2(20) not null,
	total_pcs number(4) not null,
	guide_num number(8) constraint product_fk_guide_num references shop_guide(num),
	data_num number(8) constraint product_fk_data_num references product_data(num),
	sell_ox number(1) default 1 not null constraint product_ck_sell_ox check(sell_ox between -1 and 1),
	out_ox number(1) default 1 not null constraint product_ck_out_ox check(out_ox IN(0,1)),
	indate date,
	sale number(2) default 0,
	out_time date
);

create sequence colour_seq start with 1 increment by 1;
create table colour(
	num number(8) constraint colour_pk_num primary key,
	product_num number(8) constraint colour_fk_product_num references product(num),
	code varchar2(7) not null,
	name varchar2(10) not null
);

create sequence icon_seq start with 1 increment by 1;
create table icon(
	num number(8) constraint icon_pk_num primary key,
	product_num number(8) null constraint icon_fk_product_num references product(num),
	name varchar2(8) not null,
	icon_start date,
	icon_end date,
	icon_state number(1) default 0 not null constraint icon_ck_state check(icon_state IN(0,1))
);

create sequence wish_seq start with 1 increment by 1;
create table wish(
	num number(8) constraint wish_pk_num primary key,
	product_num number(8) constraint wish_fk_product_num references product(num),
	mem_num number(8) constraint wish_fk_mem_num references member(num),
	indate date
);

create sequence bank_seq start with 1 increment by 1;
create table bank(
	num number(8) constraint bank_pk_num primary key,
	bank_name varchar2(8) UNIQUE,
	bank_num number(12) not null,
	name varchar2(10) not null
);

create sequence paid_seq start with 1 increment by 1;
create table paid(
	num number(8) constraint paid_pk_num primary key,
	mem_num number(8) constraint paid_fk_mem_num references member(num),
	product_num number(8) constraint paid_fk_product_num references product(num),
	coupon_num number(8) null constraint paid_fk_coupon_num references coupon(num),
	order_num number(8) not null,
	name varchar2(10) not null,
	phone number(11) not null,
	zip_code varchar2(21) not null,
	base_addr varchar2(200) not null,
	detail_addr varchar2(200) not null,
	memo varchar2(100),
	paid_date date,
	pay_with number(1) default 2 not null constraint paid_ck_pay_with check(pay_with between -1 and 3),
	order_money number(12) not null,
	payment		number(12) not null,
	order_date date not null,
	order_state number(1) default 0 not null constraint paid_ck_order_state check(order_state between -2 and 3),
	deposit_name varchar2(10) not null,
	cancel_start date,
	cancel_end date,
	sizu_num number(8) CONSTRAINT paid_fk_sizu_num references sizu(num),
	colour_num number(8) constraint paid_fk_colour_num references colour(num) 
);

create sequence delivery_seq start with 1 increment by 1;
create table delivery(
	num number(8) constraint delivery_pk_num primary key,
	paid_num number(8) constraint delivery_fk_paid_num references paid(num),
	company varchar2(12) UNIQUE,
	deliv_num number(12) UNIQUE,
	state number(1) default 0 not null constraint delivery_ck_state check(state between 0 and 3),
	deliv_start date not null,
	deliv_end date
);

create sequence mileage_seq start with 1 increment by 1;
create table mileage(
	num number(8) constraint mileage_pk_num primary key,
	mem_num number(8) constraint mileage_fk_mem_num references member(num),
	paid_num number(8) null constraint mileage_fk_paid_num references paid(num),
	now_mileage number(12) not null,
	indate date,
	state number(1) default 0 not null constraint mileage_ck_state check(state between 0 and 2)
);

create sequence trade_seq start with 1 increment by 1;
create table trade(
	num number(8) constraint trade_pk_num primary key,
	paid_num number(8) constraint trade_fk_paid_num references paid(num),
	deliv_state number(1) not null constraint trade_ck_deliv_state check(deliv_state between 0 and 7),
	trade_start date not null,
	trade_end date,
	reason number(1) not null constraint trade_ck_reason check(reason between 0 and 3)
);

create sequence refund_seq start with 1 increment by 1;
create table refund(
	num number(8) constraint refund_pk_num primary key,
	paid_num number(8) constraint refund_fk_paid_num references paid(num),
	refund_start date not null,
	refund_state number(1) not null constraint refund_ck_refund_state check(refund_state between -1 and 5),
	refund_end date,
	reason number(1) not null constraint refund_ck_reason check(reason between 0 and 3),
	refund_bank varchar2(20) not null,
	refund_account number(12) not null,
	refund_name varchar2(20) not null
);

create sequence cancel_seq start with 1 increment by 1;
create table cancel(
	num number(8) constraint cancel_pk_num primary key,
	paid_num number(8) constraint cancel_fk_paid_num references paid(num),
	cancel_start date,
	cancel_end date
);

create sequence review_seq start with 1 increment by 1;
create table review(
	num number(8) constraint review_pk_num primary key,
	paid_num number(8) constraint review_fk_paid_num references paid(num),
	mem_num number(8) constraint review_fk_mem_num references member(num),
	body_size varchar2(10),
	content varchar2(4000) not null,	
	star number(1) default 0 not null constraint review_ck_star check(star between 0 and 5),
	indate date
);

create sequence img_path_seq start with 1 increment by 1;
create table img_path(
	num number(8) constraint img_pk_num primary key,
	data_num number(8) null constraint img_fk_data_num references product_data(num),
	guide_num number(8) null constraint img_fk_guide_num references shop_guide(num),
	icon_num number(8) null constraint img_fk_icon_num references icon(num),
	product_num number(8) null constraint img_fk_product_num references product(num),
	review_num number(8) null constraint img_fk_review_num references review(num),
	qna_num number(8) null constraint img_fk_qna_num references qna(num),
	notice_num number(8) null constraint img_fk_notice_num references notice(num),
	banner_num number(8) null constraint img_fk_banner_num references banner(num),
	name varchar2(100) default 'no_img.jpg' not null
);

-- TEST DATA

-- 회사정보DB
INSERT INTO company VALUES(
company_seq.nextval, 'CLASSIC', 01011112222, '클래식', '의류업', '의류', 'classic@c.com', '03164',
'서울특별시 종로구 종로 69', '서울YMCA 7층', 01022223333, 023334444, '2017-서울종로-0101','오후 3:00~8:30');

-- 회원DB
INSERT INTO member VALUES(member_seq.nextval, 'member1', '1234', '01099998888', 'member1@c.com', 1, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'member2', '1234', '01099998888', 'member2@c.com', 2, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'member3', '1234', '01099998888', 'member3@c.com', 3, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'admin1', '1234', '01099998888', 'admin1@c.com', 0, sysdate);

-- 배송주소록DB
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 1, '우편번호', '기본주소', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 1, '우편번호1', '기본주소1', '상세주소1');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 2, '우편번호', '기본주소', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 2, '우편번호1', '기본주소1', '상세주소1');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 3, '우편번호', '기본주소', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 3, '우편번호1', '기본주소1', '상세주소1');

-- 쿠폰로그용DB
INSERT INTO coupon_log VALUES(coupon_log_seq.nextval, 1, 1, 1, '[Lv1 배송비 쿠폰]', 0.25, '배송비 쿠폰', sysdate, TO_DATE('2018-04-05','yyyy-mm-dd'), 100, 0);
INSERT INTO coupon_log VALUES(coupon_log_seq.nextval, 2, 0, 1, '[Lv2 30% 쿠폰]', 0.3, '30% 할인 쿠폰', sysdate, TO_DATE('2018-04-05','yyyy-mm-dd'), 100, 0);
INSERT INTO coupon_log VALUES(coupon_log_seq.nextval, 3, 0, 1, '[Lv3 50% 쿠폰]', 0.5, '50% 할인 쿠폰', sysdate, TO_DATE('2018-04-05','yyyy-mm-dd'), 100, 0);
INSERT INTO coupon_log VALUES(coupon_log_seq.nextval, 0, 0, 0,'[회원가입 할인쿠폰]', 0.5, '회원가입 할인 쿠폰', sysdate, TO_DATE('2018-04-05','yyyy-mm-dd'), 1000, 0);

-- 쿠폰DB
INSERT INTO coupon VALUES(coupon_seq.nextval, 1, 1, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 2, 2, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 3, 3, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 1, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 2, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 3, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 1, 1, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 2, 2, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 3, 3, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 1, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 2, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 3, 4, 0, sysdate);

-- 상품필수정보DB
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개1', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개2', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개3', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개4', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개5', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개6', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개7', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개8', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개9', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개10', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개11', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개12', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개13', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');
INSERT INTO product_data VALUES(product_data_seq.nextval, '상품소개14', '소재', '색상', '사이즈', '세탁법', 'CLASSIC 협력업체', '한국', '제조일', '공급사', 'no_img.jpg', 'CLASSIC', '01011112222', '무게');

-- 가이드DB
INSERT INTO shop_guide (num, state, subject, deliv_info) VALUES(shop_guide_seq.nextval, 0, 0, '배송안내 기본 설정');
INSERT INTO shop_guide (num, state, subject, refund_info) VALUES(shop_guide_seq.nextval, 0, 1, '환불안내 기본 설정');
INSERT INTO shop_guide (num, state, subject, trade_info) VALUES(shop_guide_seq.nextval, 0, 2, '교환안내 기본 설정');
INSERT INTO shop_guide (num, state, subject, as_info) VALUES(shop_guide_seq.nextval, 0, 3, 'AS안내 기본 설정');
INSERT INTO shop_guide (num, state, subject, unregi_info) VALUES(shop_guide_seq.nextval, 0, 4, '탈퇴안내 기본 설정');
INSERT INTO shop_guide (num, state, subject, deliv_info) VALUES(shop_guide_seq.nextval, 1, 0, '배송안내 직접 입력');
INSERT INTO shop_guide (num, state, subject, refund_info) VALUES(shop_guide_seq.nextval, 1, 1, '환불안내 직접 입력');
INSERT INTO shop_guide (num, state, subject, trade_info) VALUES(shop_guide_seq.nextval, 1, 2, '교환안내 직접 입력');
INSERT INTO shop_guide (num, state, subject, as_info) VALUES(shop_guide_seq.nextval, 1, 3, 'AS안내 직접 입력');
INSERT INTO shop_guide (num, state, subject, unregi_info) VALUES(shop_guide_seq.nextval, 1, 4, '탈퇴안내 직접 입력');

-- 상품대분류DB
INSERT INTO cate VALUES(cate_seq.nextval, 'NEW', 1);
INSERT INTO cate VALUES(cate_seq.nextval, 'BEST', 1);
INSERT INTO cate VALUES(cate_seq.nextval, 'OUTER', 1);
INSERT INTO cate VALUES(cate_seq.nextval, 'TOP', 1);
INSERT INTO cate VALUES(cate_seq.nextval, 'BOTTOM', 1);
INSERT INTO cate VALUES(cate_seq.nextval, 'SHOES'||chr(38)||'BAG', 1);
INSERT INTO cate VALUES(cate_seq.nextval, 'ACC', 1);
INSERT INTO cate VALUES(cate_seq.nextval, '노출X', 0);
INSERT INTO cate VALUES(cate_seq.nextval, '노출X', 0);
INSERT INTO cate VALUES(cate_seq.nextval, '노출X', 0);

-- 상품소분류DB
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='OUTER'), 'COAT', 1);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='OUTER'), 'JACKET', 1);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='OUTER'), 'JUMPER', 1);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='OUTER'), 'CARDIGAN', 1);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='OUTER'), 'X', 0);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='TOP'), 'T-SHIRT', 1);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='TOP'), 'KNIT', 1);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='TOP'), 'BLOUSE', 1);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='TOP'), 'X', 0);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='BOTTOM'), 'SKIRTS', 1);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='BOTTOM'), 'PANTS', 1);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='BOTTOM'), 'DENIM', 1);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='BOTTOM'), 'X', 0);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='SHOES'||chr(38)||'BAG'), 'SHOES', 1);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='SHOES'||chr(38)||'BAG'), 'BAG', 1);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='ACC'), 'ACC', 1);
INSERT INTO mini_cate VALUES(mini_cate_seq.nextval, (select num from cate where name='ACC'), 'X', 0);
-- 상품DB
INSERT INTO product VALUES(product_seq.nextval,'0000001',1,'상품명1','서브 설명','메인 설명',100000,50000,'FREE,S,M,L',999,1,1,1,1,sysdate,0,sysdate);
INSERT INTO product VALUES(product_seq.nextval,'0000001',1,'상품명2','서브 설명','메인 설명',100000,50000,'FREE,S,M,L',999,1,1,1,0,sysdate,0,sysdate);
INSERT INTO product VALUES(product_seq.nextval,'0000001',1,'상품명3','서브 설명','메인 설명',100000,50000,'FREE,S,M,L',999,1,1,-1,1,sysdate,0,sysdate);
INSERT INTO product VALUES(product_seq.nextval,'0000001',1,'상품명4','서브 설명','메인 설명',100000,50000,'FREE,S,M,L',999,1,1,0,0,sysdate,0,sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='JACKET'), '상품명5', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='JACKET'), '상품명6', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='JACKET'), '상품명7', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='JACKET'), '상품명8', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='JUMPER'), '상품명9', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='JUMPER'), '상품명10', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='JUMPER'), '상품명11', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='JUMPER'), '상품명12', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='CARDIGAN'), '상품명13', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='CARDIGAN'), '상품명14', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='CARDIGAN'), '상품명15', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='CARDIGAN'), '상품명16', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='T-SHIRT'), '상품명17', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='T-SHIRT'), '상품명18', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='T-SHIRT'), '상품명19', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='T-SHIRT'), '상품명20', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='KNIT'), '상품명21', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='KNIT'), '상품명22', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='KNIT'), '상품명23', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='KNIT'), '상품명24', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='BLOUSE'), '상품명25', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='BLOUSE'), '상품명26', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='BLOUSE'), '상품명27', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='BLOUSE'), '상품명28', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='SKIRTS'), '상품명29', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='SKIRTS'), '상품명30', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='SKIRTS'), '상품명31', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='SKIRTS'), '상품명32', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='PANTS'), '상품명33', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='PANTS'), '상품명34', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='PANTS'), '상품명35', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='PANTS'), '상품명36', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='DENIM'), '상품명37', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='DENIM'), '상품명38', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='DENIM'), '상품명39', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='DENIM'), '상품명40', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='SHOES'), '상품명41', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='SHOES'), '상품명42', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='SHOES'), '상품명43', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='SHOES'), '상품명44', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='BAG'), '상품명45', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='BAG'), '상품명46', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='BAG'), '상품명47', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='BAG'), '상품명48', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='ACC'), '상품명49', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='ACC'), '상품명50', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='ACC'), '상품명51', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='ACC'), '상품명52', '서브 설명', '메인 설명', 100000, 50000, 'FREE,S,M,L', 999, 1, 1, 0, 0, sysdate, 0, sysdate);

-- 상품색상DB
INSERT INTO colour VALUES(colour_seq.nextval, 1, 'F0F8FF', '색상1');
INSERT INTO colour VALUES(colour_seq.nextval, 2, 'F0F8F1', '색상2');
INSERT INTO colour VALUES(colour_seq.nextval, 3, 'F0F8F2', '색상3');
INSERT INTO colour VALUES(colour_seq.nextval, 4, 'F0F8F3', '색상4');
INSERT INTO colour VALUES(colour_seq.nextval, 5, 'F0F8F4', '색상5');
INSERT INTO colour VALUES(colour_seq.nextval, 6, 'F0F8F5', '색상6');
INSERT INTO colour VALUES(colour_seq.nextval, 7, 'F0F8F6', '색상7');
INSERT INTO colour VALUES(colour_seq.nextval, 8, 'F0F8F7', '색상8');
INSERT INTO colour VALUES(colour_seq.nextval, 9, 'F0F8F8', '색상9');
INSERT INTO colour VALUES(colour_seq.nextval, 10, 'F0F8F9', '색상10');
INSERT INTO colour VALUES(colour_seq.nextval, 11, 'F0F810', '색상11');
INSERT INTO colour VALUES(colour_seq.nextval, 12, 'F0F811', '색상12');
INSERT INTO colour VALUES(colour_seq.nextval, 13, 'F0F812', '색상13');
INSERT INTO colour VALUES(colour_seq.nextval, 14, 'F0F813', '색상14');
INSERT INTO colour VALUES(colour_seq.nextval, 1, 'F0F8FF', '색상1');
INSERT INTO colour VALUES(colour_seq.nextval, 2, 'F0F8F1', '색상2');
INSERT INTO colour VALUES(colour_seq.nextval, 3, 'F0F8F2', '색상3');
INSERT INTO colour VALUES(colour_seq.nextval, 4, 'F0F8F3', '색상4');
INSERT INTO colour VALUES(colour_seq.nextval, 5, 'F0F8F4', '색상5');
INSERT INTO colour VALUES(colour_seq.nextval, 6, 'F0F8F5', '색상6');
INSERT INTO colour VALUES(colour_seq.nextval, 7, 'F0F8F6', '색상7');
INSERT INTO colour VALUES(colour_seq.nextval, 8, 'F0F8F7', '색상8');
INSERT INTO colour VALUES(colour_seq.nextval, 9, 'F0F8F8', '색상9');
INSERT INTO colour VALUES(colour_seq.nextval, 10, 'F0F8F9', '색상10');
INSERT INTO colour VALUES(colour_seq.nextval, 11, 'F0F810', '색상11');
INSERT INTO colour VALUES(colour_seq.nextval, 12, 'F0F811', '색상12');
INSERT INTO colour VALUES(colour_seq.nextval, 13, 'F0F812', '색상13');
INSERT INTO colour VALUES(colour_seq.nextval, 14, 'F0F813', '색상14');
INSERT INTO colour VALUES(colour_seq.nextval, 15, 'F0F8FF', '색상1');
INSERT INTO colour VALUES(colour_seq.nextval, 16, 'F0F8F1', '색상2');
INSERT INTO colour VALUES(colour_seq.nextval, 17, 'F0F8F2', '색상3');
INSERT INTO colour VALUES(colour_seq.nextval, 18, 'F0F8F3', '색상4');
INSERT INTO colour VALUES(colour_seq.nextval, 19, 'F0F8F4', '색상5');
INSERT INTO colour VALUES(colour_seq.nextval, 20, 'F0F8F5', '색상6');
INSERT INTO colour VALUES(colour_seq.nextval, 21, 'F0F8F6', '색상7');
INSERT INTO colour VALUES(colour_seq.nextval, 22, 'F0F8F7', '색상8');
INSERT INTO colour VALUES(colour_seq.nextval, 23, 'F0F8F8', '색상9');
INSERT INTO colour VALUES(colour_seq.nextval, 24, 'F0F8F9', '색상10');
INSERT INTO colour VALUES(colour_seq.nextval, 25, 'F0F810', '색상11');
INSERT INTO colour VALUES(colour_seq.nextval, 26, 'F0F811', '색상12');
INSERT INTO colour VALUES(colour_seq.nextval, 27, 'F0F812', '색상13');
INSERT INTO colour VALUES(colour_seq.nextval, 28, 'F0F813', '색상14');
INSERT INTO colour VALUES(colour_seq.nextval, 1, 'F0F8FF', '색상1');
INSERT INTO colour VALUES(colour_seq.nextval, 2, 'F0F8F1', '색상2');
INSERT INTO colour VALUES(colour_seq.nextval, 3, 'F0F8F2', '색상3');
INSERT INTO colour VALUES(colour_seq.nextval, 4, 'F0F8F3', '색상4');
INSERT INTO colour VALUES(colour_seq.nextval, 5, 'F0F8F4', '색상5');
INSERT INTO colour VALUES(colour_seq.nextval, 6, 'F0F8F5', '색상6');
INSERT INTO colour VALUES(colour_seq.nextval, 7, 'F0F8F6', '색상7');
INSERT INTO colour VALUES(colour_seq.nextval, 8, 'F0F8F7', '색상8');
INSERT INTO colour VALUES(colour_seq.nextval, 9, 'F0F8F8', '색상9');
INSERT INTO colour VALUES(colour_seq.nextval, 10, 'F0F8F9', '색상10');
INSERT INTO colour VALUES(colour_seq.nextval, 11, 'F0F810', '색상11');
INSERT INTO colour VALUES(colour_seq.nextval, 12, 'F0F811', '색상12');
INSERT INTO colour VALUES(colour_seq.nextval, 13, 'F0F812', '색상13');
INSERT INTO colour VALUES(colour_seq.nextval, 14, 'F0F813', '색상14');
INSERT INTO colour VALUES(colour_seq.nextval, 1, 'F0F8FF', '색상1');
INSERT INTO colour VALUES(colour_seq.nextval, 2, 'F0F8F1', '색상2');
INSERT INTO colour VALUES(colour_seq.nextval, 3, 'F0F8F2', '색상3');
INSERT INTO colour VALUES(colour_seq.nextval, 4, 'F0F8F3', '색상4');
INSERT INTO colour VALUES(colour_seq.nextval, 5, 'F0F8F4', '색상5');
INSERT INTO colour VALUES(colour_seq.nextval, 6, 'F0F8F5', '색상6');
INSERT INTO colour VALUES(colour_seq.nextval, 7, 'F0F8F6', '색상7');
INSERT INTO colour VALUES(colour_seq.nextval, 8, 'F0F8F7', '색상8');
INSERT INTO colour VALUES(colour_seq.nextval, 9, 'F0F8F8', '색상9');
INSERT INTO colour VALUES(colour_seq.nextval, 10, 'F0F8F9', '색상10');
INSERT INTO colour VALUES(colour_seq.nextval, 11, 'F0F810', '색상11');
INSERT INTO colour VALUES(colour_seq.nextval, 12, 'F0F811', '색상12');
INSERT INTO colour VALUES(colour_seq.nextval, 13, 'F0F812', '색상13');
INSERT INTO colour VALUES(colour_seq.nextval, 14, 'F0F813', '색상14');
INSERT INTO colour VALUES(colour_seq.nextval, 15, 'F0F8FF', '색상1');
INSERT INTO colour VALUES(colour_seq.nextval, 16, 'F0F8F1', '색상2');
INSERT INTO colour VALUES(colour_seq.nextval, 17, 'F0F8F2', '색상3');
INSERT INTO colour VALUES(colour_seq.nextval, 18, 'F0F8F3', '색상4');
INSERT INTO colour VALUES(colour_seq.nextval, 19, 'F0F8F4', '색상5');
INSERT INTO colour VALUES(colour_seq.nextval, 20, 'F0F8F5', '색상6');
INSERT INTO colour VALUES(colour_seq.nextval, 21, 'F0F8F6', '색상7');
INSERT INTO colour VALUES(colour_seq.nextval, 22, 'F0F8F7', '색상8');
INSERT INTO colour VALUES(colour_seq.nextval, 23, 'F0F8F8', '색상9');
INSERT INTO colour VALUES(colour_seq.nextval, 24, 'F0F8F9', '색상10');
INSERT INTO colour VALUES(colour_seq.nextval, 25, 'F0F810', '색상11');
INSERT INTO colour VALUES(colour_seq.nextval, 26, 'F0F811', '색상12');
INSERT INTO colour VALUES(colour_seq.nextval, 27, 'F0F812', '색상13');
INSERT INTO colour VALUES(colour_seq.nextval, 28, 'F0F813', '색상14');

-- 아이콘DB
INSERT INTO icon VALUES(icon_seq.nextval, 1, 'best', sysdate, TO_DATE('2018-04-05','yyyy-mm-dd'), 1);
INSERT INTO icon VALUES(icon_seq.nextval, 2, 'new', sysdate, TO_DATE('2018-04-05','yyyy-mm-dd'), 1);
INSERT INTO icon VALUES(icon_seq.nextval, 4, 'hit', sysdate, TO_DATE('2018-04-05','yyyy-mm-dd'), 0);
INSERT INTO icon VALUES(icon_seq.nextval, 5, 'sale', sysdate, TO_DATE('2018-04-05','yyyy-mm-dd'), 0);

-- 배너
insert into banner values(banner_seq.nextval,4,'연말특별세일','내용',TO_DATE('2017-01-02','yyyy-mm-dd'),TO_DATE('2017-01-09','yyyy-mm-dd'),1);
insert into banner values(banner_seq.nextval,4,'리뷰이벤트','내용',TO_DATE('2017-01-02','yyyy-mm-dd'),TO_DATE('2017-01-09','yyyy-mm-dd'),0);
insert into banner values(banner_seq.nextval,4,'무료배송이벤트','내용',TO_DATE('2017-01-02','yyyy-mm-dd'),TO_DATE('2017-01-09','yyyy-mm-dd'),-1);

--faq
insert into faq values(faq_seq.nextval,4,'불량제품이 왔어요','자답');
insert into faq values(faq_seq.nextval,4,'배송기간이 어떻게 되나요?','자답');
insert into faq values(faq_seq.nextval,4,'배송조회는 어디서 하나요?','자답');

-- notice
insert into notice values(notice_seq.nextval,4,'설연휴 배송 지연 안내','내용',0,sysdate);
insert into notice values(notice_seq.nextval,4,'교환 및 환불양식','내용',0,sysdate);
insert into notice values(notice_seq.nextval,4,'상품별 사이즈 측정 방법안내','내용',0,sysdate);

-- qna
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,1,0,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,1,1,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,1,2,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,1,3,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,1,4,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,1,5,'내용',0,0,sysdate);
insert into qna values(qna_seq.nextval,1,0,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,1,1,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,1,2,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,1,3,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,1,4,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,1,5,'내용',0,1,'1234',sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,2,0,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,2,1,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,2,2,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,2,3,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,2,4,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,2,5,'내용',0,0,sysdate);
insert into qna values(qna_seq.nextval,2,0,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,2,1,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,2,2,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,2,3,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,2,4,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,2,5,'내용',0,1,'1234',sysdate);

-- qna_reply
insert into qna_reply values(qna_reply_seq.nextval,1,4,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,2,4,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,3,4,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,4,4,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,5,4,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,6,4,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,7,4,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,8,4,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,9,4,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,10,4,'내용',sysdate);

drop user classic_admin cascade;
create user classic_admin identified by admin1234 default tablespace CLASSIC_DB
quota unlimited on CLASSIC_DB;

grant connect to classic_admin;
grant create synonym to classic_admin;
grant select any table to classic_admin;
grant delete any table to classic_admin;
grant update any table to classic_admin;
grant insert any table to classic_admin;
grant select any sequence to classic_admin;

conn classic_admin/admin1234;

create synonym company for classic_dba.company;
create synonym member for classic_dba.member;
create synonym addr_book for classic_dba.addr_book;
create synonym coupon for classic_dba.coupon;
create synonym coupon_log for classic_dba.coupon_log;
create synonym banner for classic_dba.banner;
create synonym faq for classic_dba.faq;
create synonym notice for classic_dba.notice;
create synonym qna for classic_dba.qna;
create synonym qna_reply for classic_dba.qna_reply;
create synonym product_data for classic_dba.product_data;
create synonym shop_guide for classic_dba.shop_guide;
create synonym colour for classic_dba.colour;
create synonym cate for classic_dba.cate;
create synonym mini_cate for classic_dba.mini_cate;
create synonym product for classic_dba.product;
create synonym review for classic_dba.review;
create synonym icon for classic_dba.icon;
create synonym wish for classic_dba.wish;
create synonym bank for classic_dba.bank;
create synonym paid for classic_dba.paid;
create synonym delivery for classic_dba.delivery;
create synonym trade for classic_dba.trade;
create synonym refund for classic_dba.refund;
create synonym cancel for classic_dba.cancel;
create synonym mileage for classic_dba.mileage;
create synonym img_path for classic_dba.img_path;

create synonym company_seq for classic_dba.company_seq;
create synonym member_seq for classic_dba.member_seq;
create synonym addr_book_seq for classic_dba.addr_book_seq;
create synonym coupon_seq for classic_dba.coupon_seq;
create synonym coupon_log_seq for classic_dba.coupon_log_seq;
create synonym banner_seq for classic_dba.banner_seq;
create synonym faq_seq for classic_dba.faq_seq;
create synonym notice_seq for classic_dba.notice_seq;
create synonym qna_seq for classic_dba.qna_seq;
create synonym qna_reply_seq for classic_dba.qna_reply_seq;
create synonym product_data_seq for classic_dba.product_data_seq;
create synonym shop_guide_seq for classic_dba.shop_guide_seq;
create synonym colour_seq for classic_dba.colour_seq;
create synonym cate_seq for classic_dba.cate_seq;
create synonym mini_cate_seq for classic_dba.mini_cate_seq;
create synonym product_seq for classic_dba.product_seq;
create synonym review_seq for classic_dba.review_seq;
create synonym icon_seq for classic_dba.icon_seq;
create synonym wish_seq for classic_dba.wish_seq;
create synonym bank_seq for classic_dba.bank_seq;
create synonym paid_seq for classic_dba.paid_seq;
create synonym delivery_seq for classic_dba.delivery_seq;
create synonym trade_seq for classic_dba.trade_seq;
create synonym refund_seq for classic_dba.refund_seq;
create synonym cancel_seq for classic_dba.cancel_seq;
create synonym mileage_seq for classic_dba.mileage_seq;
create synonym img_path_seq for classic_dba.img_path_seq;


-- 테이블 수정

conn classic_dba/dba1234

ALTER TABLE paid MODIFY(order_num NUMBER(16));
ALTER TABLE paid MODIFY(memo VARCHAR2(300));
ALTER TABLE paid DROP COLUMN cancel_start;
ALTER TABLE paid DROP COLUMN cancel_end;
ALTER TABLE coupon_log MODIFY(name VARCHAR2(50));

conn classic_admin/admin1234

--은경
--가능하다면 coupon_log name도 사이즈 늘렸으면 좋겠어요. 이거 오류나서 뒤에 연결되는 테이블도 오류납니다. --> 완료
--이렇게 오류나면 레코드 생성안되고 시퀀스 번호 넘어가서 뒤에 연결되는 테이블 줄줄이 시퀀스 꼬입니다. --> 완료
--fk 는 되도록이면 서브쿼리 써주세요. -->힝구..
--fk 쓰는 테이블들 db test sample 서브쿼리 안 쓴 레코드들은 확인 부탁 드립니다. --> 힝구....
--예) INSERT INTO coupon VALUES(coupon_seq.nextval, 1, (select num from coupon_log where name='[회원가입 할인쿠폰]'), 1, sysdate);
--주문번호 select concat(to_number(to_char(sysdate, 'yymmdd')), coupon_log_seq.nextval) from dual;

-- 주문 db
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,1,null,2017110812345678,'김경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','벨고장났어요',to_date('2017-11-09','yyyy-mm-dd'),0,100000,90000,to_date('2017-11-08','yyyy-mm-dd'),1,'김경미',);
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,1,null,2017112900000001,'박경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','배송 전 연락 부탁드려요',null,0,100000,90000,to_date('2017-11-29','yyyy-mm-dd'),0,'함혜진');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,1,null,2017120800000001,'최경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','부재 시 문 앞에 두고 가주세요',to_date('2017-12-08','yyyy-mm-dd'),0,100000,90000,to_date('2017-12-08','yyyy-mm-dd'),1,'최경미'); 
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,1,null,2017111800000001,'이경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','부재 시 경비실에 맡겨주세요',to_date('2017-11-19','yyyy-mm-dd'),0,100000,90000,to_date('2017-11-18','yyyy-mm-dd'),2,'이경미');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,1,null,2017123000000001,'강경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호',null,null,0,100000,90000,to_date('2017-12-30','yyyy-mm-dd'),0,'송유정');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,1,null,2017101900000001,'유경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','도착하셔서 연락 부탁드립니다',to_date('2017-10-20','yyyy-mm-dd'),0,100000,90000,to_date('2017-10-19','yyyy-mm-dd'),2,'유경미');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,1,null,2017112400000011,'곽경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호',null,null,0,100000,90000,to_date('2017-11-24','yyyy-mm-dd'),0,'곽경미');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,1,null,2017122800000011,'함경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','잘 부탁드립니다.',to_date('2017-12-29','yyyy-mm-dd'),0,100000,90000,to_date('2017-12-28','yyyy-mm-dd'),1,'곽은경');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,1,null,2017082900000011,'송경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','감사합니다.',to_date('2017-08-29','yyyy-mm-dd'),0,100000,90000,to_date('2017-08-29','yyyy-mm-dd'),1,'송경미');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,1,null,2018010100000011,'경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','출입문 앞에서 연락 부탁드려요',null,0,100000,90000,to_date('2018-01-01','yyyy-mm-dd'),0,'유반니');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,1,null,2017110800000002,'미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','항상 감사합니다',to_date('2017-11-08','yyyy-mm-dd'),0,100000,90000,to_date('2017-11-08','yyyy-mm-dd'),1,'김주연');

insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,1,null,2017112900000002,'송유정',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호',null,null,2,100000,100000,to_date('2017-11-29','yyyy-mm-dd'),0,'박보검');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,1,null,2017120100000011,'김혜자',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','빠른배송 부탁드립니다.',to_date('2017-12-01','yyyy-mm-dd'),2,100000,97000,to_date('2017-12-01','yyyy-mm-dd'),1,'김혜자');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,2,1,null,2017120300000001,'김창렬',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호',null,to_date('2017-12-04','yyyy-mm-dd'),0,100000,1000000,to_date('2017-12-01','yyyy-mm-dd'),1,'김창렬');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,3,5,null,2017120500000123,'김종렬',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','노크부탁',to_date('2017-12-05','yyyy-mm-dd'),1,100000,1000000 ,to_date('2017-12-06','yyyy-mm-dd'),1,'김종렬');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values(paid_seq.nextval,2,50,null,2017121200000011,'심수봉',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호',null,to_date('2017-12-12','yyyy-mm-dd'),0,100000,1000000,to_date('2017-12-12','yyyy-mm-dd'),1,'남진');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,3,25,null,2017121300000012,'김지석',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호',null,to_date('2017-12-14','yyyy-mm-dd'),0,100000,1000000,to_date('2017-12-13','yyyy-mm-dd'),1,'김지석');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,2,3,null,2017121500000012,'송지석',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','빠른배송ㄱㄱ',null,0,100000,1000000,to_date('2017-12-15','yyyy-mm-dd'),0,'송지석');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,3,1,null,2017122200000123,'유정란',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','차조심',to_date('2017-12-22','yyyy-mm-dd'),0,100000,1000000,to_date('2017-12-22','yyyy-mm-dd'),2,'무정란');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,35,null,2017122400000121,'유정',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','크리스마스조심',to_date('2017-12-24','yyyy-mm-dd'),0,100000,1000000,to_date('2017-12-25','yyyy-mm-dd'),1,'유정');
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name) 
values (paid_seq.nextval,1,52,null,2017123000000122,'김상우',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','신년조심',to_date('2017-12-30','yyyy-mm-dd'),0,100000,1000000,to_date('2017-12-30','yyyy-mm-dd'),1,'김상우');


--wish db
INSERT INTO wish VALUES(wish_seq.nextval ,1 , 1, sysdate);
INSERT INTO wish VALUES(wish_seq.nextval ,2 , 2, sysdate);
INSERT INTO wish VALUES(wish_seq.nextval ,3 , 3, sysdate);
INSERT INTO wish VALUES(wish_seq.nextval ,5 , 3, sysdate);
INSERT INTO wish VALUES(wish_seq.nextval ,6 , 3, sysdate);

-- 상품후기DB
INSERT INTO review VALUES(review_seq.nextval, 1, 1, '치수', '내용', 1, sysdate);
INSERT INTO review VALUES(review_seq.nextval, 1, 1, '치수', '내용', 2, sysdate);
INSERT INTO review VALUES(review_seq.nextval, 1, 1, '치수', '내용', 3, sysdate);
INSERT INTO review VALUES(review_seq.nextval, 1, 1, '치수', '내용', 4, sysdate);
INSERT INTO review VALUES(review_seq.nextval, 1, 1, '치수', '내용', 5, sysdate);
INSERT INTO review VALUES(review_seq.nextval, 1, 1, '치수', '내용', 5, sysdate);

--마일리지
INSERT INTO mileage VALUES(mileage_seq.nextval,1,1,200000,sysdate,2);
-- bank, delivery, trade, refund, cancel, mileage, img_path TEST DATA 없음
INSERT INTO mileage VALUES(mileage_seq.nextval,1,1,null,200000,sysdate,2);

--테이블 수정
ALTER TABLE bank MODIFY(bank_name VARCHAR2(12));
ALTER TABLE bank MODIFY(bank_num NUMBER(16));

--company uk빼야함
drop table delivery;
create sequence delivery_seq start with 1 increment by 1;
create table delivery(
	num number(8) constraint delivery_pk_num primary key,
	paid_num number(8) constraint delivery_fk_paid_num references paid(num),
	company varchar2(12),
	deliv_num number(16) UNIQUE,
	state number(1) default 0 not null constraint delivery_ck_state check(state between 0 and 3),
	deliv_start date not null,
	deliv_end date
);

-- bank
INSERT INTO bank VALUES(bank_seq.nextval ,'우리은행' ,'1002536238755','클래식');
INSERT INTO bank VALUES(bank_seq.nextval ,'신한은행' ,'22875504956326','클래식');
INSERT INTO bank VALUES(bank_seq.nextval ,'국민은행' ,'5678920563257','클래식');

--delivery
INSERT INTO delivery VALUES(delivery_seq.nextval ,41 ,'CJ택배','6898000144426575' ,1 ,sysdate , '');
INSERT INTO delivery VALUES(delivery_seq.nextval ,52 ,'','' ,0 ,sysdate , '');
INSERT INTO delivery VALUES(delivery_seq.nextval ,43 ,'대한통운','1111222233334444' ,2 ,sysdate , '');
INSERT INTO delivery VALUES(delivery_seq.nextval ,47 ,'대한통운','6666222233335555' ,3 ,sysdate , '20180107');

--trade
INSERT INTO trade VALUES(trade_seq.nextval ,44,0,sysdate,'',0);
INSERT INTO trade VALUES(trade_seq.nextval ,45,2,sysdate,'',2);

--refund
INSERT INTO refund VALUES(refund_seq.nextval ,46,sysdate,1,'',1,'카카오뱅크','12345678912','김다혜');
INSERT INTO refund VALUES(refund_seq.nextval ,47,sysdate,5,'',2,'우리은행','12345678912','홍길동');

--cancel
INSERT INTO cancel VALUES(cancel_seq.nextval ,48,sysdate,'');
INSERT INTO cancel VALUES(cancel_seq.nextval ,49,sysdate,'20180109');

-- img_path TEST DATA 없음
-- 수정사항: 주문테이블(paid) 주문번호에 uk 빼야함니다!!
-- 주문디비 다 수정함!! 
-- 18/01/09 DB 수정 

conn classic_dba/dba1234
ALTER TABLE product DROP COLUMN sizu;
CREATE sequence sizu_seq start WITH 1 increment BY 1;
CREATE table sizu(
	num number(8) CONSTRAINT sizu_pk_num PRIMARY KEY,
	sizu varchar2(10),
	product_num number(8) constraint sizu_fk_product_num references product(num)
);
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명1'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명1'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명1'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명2'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명2'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명2'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명2'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명3'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명3'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명3'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명3'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명4'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명4'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명4'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명4'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명5'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명5'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명5'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명5'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명6'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명6'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명6'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명6'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명7'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명7'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명7'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명7'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명8'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명8'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명8'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명8'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명9'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명9'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명9'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명9'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명10'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명10'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명10'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명10'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명11'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명11'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명11'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명11'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명12'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명12'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명12'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명12'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명13'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명13'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명13'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명13'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명14'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명14'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명14'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명14'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명15'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명15'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명15'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명15'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명16'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명16'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명16'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명16'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명17'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명17'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명17'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명17'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명18'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명18'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명18'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명18'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명19'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명19'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명19'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명19'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명20'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명20'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명20'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명20'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명21'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명21'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명21'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명21'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명22'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명22'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명22'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명22'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명23'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명23'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명23'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명23'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명24'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명24'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명24'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명24'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명25'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명25'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명25'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명25'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명26'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명26'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명26'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명26'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명27'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명27'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명27'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명27'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명28'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명28'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명28'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명28'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명29'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명29'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명29'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명29'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명30'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명30'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명30'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명30'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명31'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명31'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명31'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명31'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명32'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명32'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명32'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명32'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명33'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명33'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명33'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명33'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명34'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명34'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명34'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명34'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명35'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명35'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명35'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명35'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명36'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명36'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명36'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명36'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명37'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명37'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명37'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명37'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명38'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명38'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명38'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명38'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명39'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명39'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명39'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명39'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명40'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명40'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'M', (Select num from product where name='상품명40'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'L', (Select num from product where name='상품명40'));
--41~44 mini_cate 14(shoes) 
INSERT INTO sizu VALUES(sizu_seq.nextval, '230', (Select num from product where name='상품명41'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '235', (Select num from product where name='상품명41'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '240', (Select num from product where name='상품명41'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '245', (Select num from product where name='상품명41'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '230', (Select num from product where name='상품명42'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '235', (Select num from product where name='상품명42'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '240', (Select num from product where name='상품명42'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '245', (Select num from product where name='상품명42'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '230', (Select num from product where name='상품명43'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '235', (Select num from product where name='상품명43'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '240', (Select num from product where name='상품명43'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '245', (Select num from product where name='상품명43'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '230', (Select num from product where name='상품명44'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '235', (Select num from product where name='상품명44'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '240', (Select num from product where name='상품명44'));
INSERT INTO sizu VALUES(sizu_seq.nextval, '245', (Select num from product where name='상품명44'));
-- 45~48 mini_cate 15(bag),  49~52 mini_cate 16(acc)
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명45'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명46'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명47'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명48'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명49'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명50'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명51'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명52'));

conn classic_admin/admin1234
create synonym sizu for classic_dba.sizu;
create synonym sizu_seq for classic_dba.sizu_seq;

--혜진 필요 DB
INSERT INTO member VALUES(member_seq.nextval, 'member4', '1234', '01099998888', 'member4@c.com', 3, sysdate);
INSERT INTO product VALUES(product_seq.nextval,'0000053',1,'상품명53','서브 설명','메인 설명',100000,50000,'FREE',999,1,1,1,1,sysdate,0,sysdate);
INSERT INTO product VALUES(product_seq.nextval,'0000054',1,'상품명53','서브 설명','메인 설명',100000,50000,'S',999,1,1,1,1,sysdate,0,sysdate);
INSERT INTO product VALUES(product_seq.nextval,'0000055',1,'상품명53','서브 설명','메인 설명',100000,50000,'M',999,1,1,1,1,sysdate,0,sysdate);
INSERT INTO product VALUES(product_seq.nextval,'0000056',1,'상품명53','서브 설명','메인 설명',100000,50000,'L',999,1,1,1,1,sysdate,0,sysdate);
INSERT INTO product VALUES(product_seq.nextval,'0000057',1,'상품명54','서브 설명','메인 설명',100000,50000,'FREE',999,1,1,1,1,sysdate,0,sysdate);
INSERT INTO product VALUES(product_seq.nextval,'0000058',1,'상품명54','서브 설명','메인 설명',100000,50000,'S',999,1,1,1,1,sysdate,0,sysdate);
INSERT INTO product VALUES(product_seq.nextval,'0000059',1,'상품명54','서브 설명','메인 설명',100000,50000,'M',999,1,1,1,1,sysdate,0,sysdate);
INSERT INTO product VALUES(product_seq.nextval,'0000060',1,'상품명54','서브 설명','메인 설명',100000,50000,'L',999,1,1,1,1,sysdate,0,sysdate);
INSERT INTO colour VALUES(colour_seq.nextval, (select num from product where code='0000053'), 'F0F8FF', '하늘색');
INSERT INTO colour VALUES(colour_seq.nextval, (select num from product where code='0000054'), 'F0F8FF', '하늘색');
INSERT INTO colour VALUES(colour_seq.nextval, (select num from product where code='0000055'), 'F0F8FF', '하늘색');
INSERT INTO colour VALUES(colour_seq.nextval, (select num from product where code='0000056'), 'F0F8FF', '하늘색');
INSERT INTO colour VALUES(colour_seq.nextval, (select num from product where code='0000057'), 'F0F8FF', '하늘색');
INSERT INTO colour VALUES(colour_seq.nextval, (select num from product where code='0000058'), 'F0F8FF', '하늘색');
INSERT INTO colour VALUES(colour_seq.nextval, (select num from product where code='0000059'), 'F0F8FF', '하늘색');
INSERT INTO colour VALUES(colour_seq.nextval, (select num from product where code='0000060'), 'F0F8FF', '하늘색');
INSERT INTO wish VALUES(wish_seq.nextval ,(select num from product where code='0000053'), (select num from member where id='member4'), sysdate);
INSERT INTO wish VALUES(wish_seq.nextval ,(select num from product where code='0000057'), (select num from member where id='member4'), sysdate);
INSERT INTO wish VALUES(wish_seq.nextval ,(select num from product where code='0000057'), (select num from member where id='member4'), sysdate);

--shop guide temporary data insert
insert into shop_guide values(shop_guide_seq.nextval, 1, 0, '배송안내 샵가이드 테스트 데이터 입니다.', '환불규정 안내 샵가이드 테스트 데이터입니다.','교환 안내 샵가이드 테스트 데이터입니다.', '고장수리 안내 샵가이드 테스트 데이터입니다.','탈퇴 안내 샵가이드 테스트 데이터입니다.' )


>>>>>>> c3e6436486e2f638d9631f148d2bd3102c75f05e
