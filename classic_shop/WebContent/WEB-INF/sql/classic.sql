DROP tablespace CLASSIC_DB including contents AND datafiles;

commit;

create tablespace CLASSIC_DB
datafile 'C:/oraclexe/app/oracle/oradata/XE/CLASSIC_DB.dbf'
size 200m
autoextend ON next 10m
maxsize 500m;

DROP USER classic_dba cascade;
CREATE USER classic_dba identified BY dba1234
DEFAULT tablespace CLASSIC_DB quota unlimited ON CLASSIC_DB
TEMPORARY tablespace temp;

commit;

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
	name varchar2(50) UNIQUE,
	sale number(6,2) not null,
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
	state number(1) DEFAULT 0 constraint banner_ck_state check(state IN(-1,0,1)),
	img_path varchar2(200)
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
	total_pcs number(4) not null,
	guide_num number(8) constraint product_fk_guide_num references shop_guide(num),
	data_num number(8) constraint product_fk_data_num references product_data(num),
	sell_ox number(1) default 1 not null constraint product_ck_sell_ox check(sell_ox between -1 and 1),
	out_ox number(1) default 1 not null constraint product_ck_out_ox check(out_ox IN(0,1)),
	indate date,
	sale number(2) default 0,
	out_time date
);

CREATE sequence sizu_seq start WITH 1 increment BY 1;
CREATE table sizu(
	num number(8) CONSTRAINT sizu_pk_num PRIMARY KEY,
	sizu varchar2(10),
	product_num number(8) constraint sizu_fk_product_num references product(num)
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
	indate date,
	sizu_num number(8) not null constraint wish_fk_sizu_num references sizu(num),
	colour_num number(8) not null constraint wish_fk_colour_num references colour(num)
);

create sequence bank_seq start with 1 increment by 1;
create table bank(
	num number(8) constraint bank_pk_num primary key,
	bank_name varchar2(12) UNIQUE,
	bank_num number(16) not null,
	name varchar2(10) not null
);

create sequence paid_seq start with 1 increment by 1;
create table paid(
	num number(8) constraint paid_pk_num primary key,
	mem_num number(8) constraint paid_fk_mem_num references member(num),
	product_num number(8) constraint paid_fk_product_num references product(num),
	coupon_num number(8) null constraint paid_fk_coupon_num references coupon(num),
	order_num number(16) not null,
	name varchar2(10) not null,
	phone number(11) not null,
	zip_code varchar2(21) not null,
	base_addr varchar2(200) not null,
	detail_addr varchar2(200) not null,
	memo varchar2(300),
	paid_date date,
	pay_with number(1) default 2 not null constraint paid_ck_pay_with check(pay_with between -1 and 3),
	order_money number(12) not null,
	payment	number(12) not null,
	order_date date not null,
	order_state number(1) default 0 not null constraint paid_ck_order_state check(order_state between -2 and 3),
	deposit_name varchar2(10) not null,
	sizu_num number(8) not null constraint paid_fk_sizu_num references sizu(num),
	colour_num number(8) not null constraint paid_fk_colour_num references colour(num)
);
--deliv_num number(12) ->(16으로 변경) 0000 0000 0000 0000 송장번호 16자리
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
	name varchar2(200) default 'no_img.jpg' not null
);

commit;

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

commit;

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
create synonym sizu for classic_dba.sizu;
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
create synonym sizu_seq for classic_dba.sizu_seq;
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

commit;

--Member TEST DATA
INSERT INTO member VALUES(member_seq.nextval, 'member1', '1234', '01099998888', 'member1@c.com', 1, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'member2', '1234', '01099998888', 'member2@c.com', 2, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'member3', '1234', '01099998888', 'member3@c.com', 3, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'member4', '1234', '01099998888', 'member4@c.com', 1, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'member5', '1234', '01099998888', 'member5@c.com', 2, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'member6', '1234', '01099998888', 'member6@c.com', 3, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'member7', '1234', '01099998888', 'member7@c.com', 1, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'member8', '1234', '01099998888', 'member8@c.com', 2, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'member9', '1234', '01099998888', 'member9@c.com', 3, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'user1', '1234', '01099998888', 'user1@c.com', 2, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'user2', '1234', '01099998888', 'user2@c.com', 3, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'user3', '1234', '01099998888', 'user3@c.com', 1, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'user4', '1234', '01099998888', 'user4@c.com', 2, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'user5', '1234', '01099998888', 'user5@c.com', 3, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'user6', '1234', '01099998888', 'user6@c.com', 1, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'user7', '1234', '01099998888', 'user7@c.com', 2, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'user8', '1234', '01099998888', 'user8@c.com', 3, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'user9', '1234', '01099998888', 'user9@c.com', 1, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'test1', '1234', '01099998888', 'test1@c.com', 3, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'test2', '1234', '01099998888', 'test2@c.com', 1, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'test3', '1234', '01099998888', 'test3@c.com', 2, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'test4', '1234', '01099998888', 'test4@c.com', 3, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'test5', '1234', '01099998888', 'test5@c.com', 1, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'test6', '1234', '01099998888', 'test6@c.com', 2, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'test7', '1234', '01099998888', 'test7@c.com', 3, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'test8', '1234', '01099998888', 'test8@c.com', 1, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'test9', '1234', '01099998888', 'test9@c.com', 2, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'js1', '1234', '01099998888', 'js1@c.com', -1, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'js2', '1234', '01099998888', 'js2@c.com', -1, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'js3', '1234', '01099998888', 'js3@c.com', -1, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'js4', '1234', '01099998888', 'js4@c.com', -1, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'js5', '1234', '01099998888', 'js5@c.com', -1, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'unmem1', '1234', '01099998888', 'unmem1@c.com', -2, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'unmem2', '1234', '01099998888', 'unmem2@c.com', -2, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'unmem3', '1234', '01099998888', 'unmem3@c.com', -2, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'unmem4', '1234', '01099998888', 'unmem4@c.com', -2, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'unmem5', '1234', '01099998888', 'unmem5@c.com', -2, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'admin1', '1234', '01099998888', 'admin1@c.com', 0, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'admin2', '1234', '01099998888', 'admin2@c.com', 0, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'admin3', '1234', '01099998888', 'admin3@c.com', 0, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'admin4', '1234', '01099998888', 'admin4@c.com', 0, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'admin5', '1234', '01099998888', 'admin5@c.com', 0, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'admin6', '1234', '01099998888', 'admin6@c.com', 0, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'admin7', '1234', '01099998888', 'admin7@c.com', 0, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'admin8', '1234', '01099998888', 'admin8@c.com', 0, sysdate);
INSERT INTO member VALUES(member_seq.nextval, 'admin9', '1234', '01099998888', 'admin9@c.com', 0, sysdate);

--addr_book
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 1, '100011', '서울특별시 중구 충무로1가', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 2, '100012', '서울특별시 중구 충무로2가', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 3, '100013', '서울특별시 중구 충무로3가', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 4, '100014', '서울특별시 중구 충무로4가', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 5, '100015', '서울특별시 중구 충무로5가', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 6, '100021', '서울특별시 중구 명동1가', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 7, '100022', '서울특별시 중구 명동2가', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 8, '100031', '서울특별시 중구 저동1가', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 9, '100032', '서울특별시 중구 저동2가', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 10, '100041', '서울특별시 중구 남산동1가', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 11, '100042', '서울특별시 중구 남산동2가', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 12, '110011', '서울특별시 종로구 구기동', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 13, '110012', '서울특별시 종로구 평창동', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 14, '110020', '서울특별시 종로구 홍지동', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 15, '110021', '서울특별시 종로구 부암동', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 16, '110030', '서울특별시 종로구 청운동', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 17, '110031', '서울특별시 종로구 궁정동', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 18, '110032', '서울특별시 종로구 신교동', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 19, '110033', '서울특별시 종로구 효자동', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 20, '110034', '서울특별시 종로구 창성동', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 21, '110035', '서울특별시 종로구 옥인동', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 22, '120093', '서울특별시 서대문구 홍제3동', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 23, '120100', '서울특별시 서대문구 홍은동', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 24, '120101', '서울특별시 서대문구 홍은1동', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 25, '120102', '서울특별시 서대문구 홍은2동', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 26, '120110', '서울특별시 서대문구 연희동', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 27, '120120', '서울특별시 서대문구 남가좌동', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 28, '120121', '서울특별시 서대문구 남가좌1동', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 29, '120122', '서울특별시 서대문구 남가좌2동', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 30, '120130', '서울특별시 서대문구 북가좌동', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 31, '120131', '서울특별시 서대문구 북가좌1동', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 32, '121745', '서울특별시 마포구 도화동', '삼창빌딩');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 33, '121746', '서울특별시 마포구 서교동', '삼성화재해상보험빌딩');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 34, '121747', '서울특별시 마포구 성산1동', '신안빌딩');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 35, '121748', '서울특별시 마포구 도화동', '마스터즈타워빌딩');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 36, '121749', '서울특별시 마포구 염리동', '건강보험회관');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 37, '121750', '서울특별시 마포구 공덕동', '한겨레신문사');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 1, '449838', '경기도 용인시 처인구 삼가동', '경기도용인교육지원청');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 2, '442779', '경기도 수원시 팔달구 매산로3가', '경기도의회');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 3, '618730', '부산광역시 강서구 지사동', '부산지사휴먼시아');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 4, '614897', '부산광역시 부산진구 부암1동', '부산서면동문굿모닝힐');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 5, '606760', '부산광역시 영도구 남항동2가', '부산국제선용품유통센타');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 6, '616714', '부산광역시 북구 금곡동', '부산광역시소방학교');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 7, '609780', '부산광역시 금정구 남산동', '부산외국어대학교');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 8, '690796', '제주특별자치도 제주시 화북일동', '제주삼화휴먼시아1단지');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 9, '690747', '제주특별자치도 제주시 연동', '제주특별자치도의회');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 10, '690799', '제주특별자치도 제주시 일도이동', '제주일보사');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 11, '555703', '전라남도 여수시 학동', '여수시교육청');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 12, '555712', '전라남도 여수시 봉계동', '여수세무서');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 13, '462700', '경기도 성남시 중원구 여수동', '성남시청');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 14, '462740', '경기도 성남시 중원구 여수동', '성남센트럴타운');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 15, '462741', '경기도 성남시 중원구 여수동', '연꽃마을4단지');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 16, '330600', '충청남도 천안시 동남구', '천안우체국사서함');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 17, '330702', '충청남도 천안시 동남구 청당동', '천안동남경찰서');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 18, '331003', '충청남도 천안시 서북구 백석동', '천안우편집중국');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 19, '331701', '충청남도 천안시 서북구 불당동', '천안시청');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 20, '331702', '충청남도 천안시 서북구 업성동', '천안서북경찰서');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 21, '331703', '충청남도 천안시 서북구 신당동', '천안개방교도소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 22, '477851', '경기도 가평군 설악면 천안리', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 23, '330703', '충청남도 천안시 동남구 청당동', '천안세무서');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 24, '331170', '충청남도 천안시 서북구 성정동', '천안우체국');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 25, '330799', '충청남도 천안시 동남구 대흥동', '천안우체국우편물류과');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 26, '200700', '강원도 춘천시 봉의동', '강원도청');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 27, '200713', '강원도 춘천시 사농동', '강원도교육청');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 28, '220736', '강원도 원주시 우산동', '강원도산업경제진흥원');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 29, '799805', '경상북도 울릉군 울릉읍 독도리', '상세주소');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 30, '339731', '세종특별자치시 어진동', '세종상록데시앙한뜰마을1단지아파트');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 31, '443760', '경기도 수원시 영통구 이의동', '경기대학교');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 32, '443761', '경기도 수원시 영통구 영통1동', '경기중소기업청');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 33, '445784', '경기도 화성시 기산동', '경기도농업기술원');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 34, '464800', '경기도 광주시 송정동', '경기광주우체국');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 35, '480764', '경기도 의정부시 신곡2동', '경기도청북부청사');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 36, '449838', '경기도 용인시 처인구 삼가동', '경기도용인교육지원청');
INSERT INTO addr_book VALUES(addr_book_seq.nextval, 37, '442779', '경기도 수원시 팔달구 매산로3가', '경기도의회');

-- 쿠폰로그용DB
INSERT INTO coupon_log VALUES(coupon_log_seq.nextval, 1, 1, 1, '[Lv1 배송비 쿠폰]', 0.25, '배송비 쿠폰', sysdate, TO_DATE('2018-04-05','yyyy-mm-dd'), 100, 0);
INSERT INTO coupon_log VALUES(coupon_log_seq.nextval, 2, 0, 1, '[Lv2 30% 쿠폰]', 0.3, '30% 할인 쿠폰', sysdate, TO_DATE('2018-04-05','yyyy-mm-dd'), 100, 0);
INSERT INTO coupon_log VALUES(coupon_log_seq.nextval, 3, 0, 1, '[Lv3 50% 쿠폰]', 0.5, '50% 할인 쿠폰', sysdate, TO_DATE('2018-04-05','yyyy-mm-dd'), 100, 0);
INSERT INTO coupon_log VALUES(coupon_log_seq.nextval, 0, 0, 0,'[회원가입 할인쿠폰]', 0.5, '회원가입 할인 쿠폰', sysdate, TO_DATE('2018-04-05','yyyy-mm-dd'), 1000, 0);

-- 쿠폰DB
INSERT INTO coupon VALUES(coupon_seq.nextval, 1, 1, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 2, 2, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 3, 3, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 4, 1, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 5, 2, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 6, 3, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 7, 1, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 8, 2, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 9, 3, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 10, 1, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 11, 2, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 12, 3, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 13, 1, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 14, 2, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 15, 3, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 16, 1, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 17, 2, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 18, 3, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 19, 1, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 20, 2, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 21, 3, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 22, 1, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 23, 2, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 24, 3, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 25, 1, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 26, 2, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 27, 3, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 28, 1, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 29, 2, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 30, 3, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 31, 1, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 32, 2, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 33, 3, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 34, 1, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 35, 2, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 36, 3, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 1, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 2, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 3, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 4, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 5, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 6, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 7, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 8, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 9, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 10, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 11, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 12, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 13, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 14, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 15, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 16, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 17, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 18, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 19, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 20, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 21, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 22, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 23, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 24, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 25, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 26, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 27, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 28, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 29, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 30, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 31, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 32, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 33, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 34, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 35, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 36, 4, 1, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 1, 1, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 2, 2, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 3, 3, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 4, 1, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 5, 2, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 6, 3, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 7, 1, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 8, 2, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 9, 3, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 10, 1, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 11, 2, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 12, 3, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 13, 1, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 14, 2, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 15, 3, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 16, 1, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 17, 2, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 18, 3, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 19, 1, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 20, 2, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 21, 3, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 22, 1, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 23, 2, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 24, 3, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 25, 1, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 26, 2, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 27, 3, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 28, 1, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 29, 2, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 30, 3, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 31, 1, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 32, 2, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 33, 3, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 34, 1, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 35, 2, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 36, 3, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 1, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 2, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 3, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 4, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 5, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 6, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 7, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 8, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 9, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 10, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 11, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 12, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 13, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 14, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 15, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 16, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 17, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 18, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 19, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 20, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 21, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 22, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 23, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 24, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 25, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 26, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 27, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 28, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 29, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 30, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 31, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 32, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 33, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 34, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 35, 4, 0, sysdate);
INSERT INTO coupon VALUES(coupon_seq.nextval, 36, 4, 0, sysdate);

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
INSERT INTO product VALUES(product_seq.nextval,'0000001',1,'상품명1','서브 설명','메인 설명',100000,50000,999,1,1,1,1,sysdate,0,sysdate);
INSERT INTO product VALUES(product_seq.nextval,'0000001',1,'상품명2','서브 설명','메인 설명',100000,50000,999,1,1,1,0,sysdate,0,sysdate);
INSERT INTO product VALUES(product_seq.nextval,'0000001',1,'상품명3','서브 설명','메인 설명',100000,50000,999,1,1,-1,1,sysdate,0,sysdate);
INSERT INTO product VALUES(product_seq.nextval,'0000001',1,'상품명4','서브 설명','메인 설명',100000,50000,999,1,1,0,0,sysdate,0,sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='JACKET'), '상품명5', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='JACKET'), '상품명6', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='JACKET'), '상품명7', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='JACKET'), '상품명8', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='JUMPER'), '상품명9', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='JUMPER'), '상품명10', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='JUMPER'), '상품명11', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='JUMPER'), '상품명12', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='CARDIGAN'), '상품명13', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='CARDIGAN'), '상품명14', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='CARDIGAN'), '상품명15', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='CARDIGAN'), '상품명16', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='T-SHIRT'), '상품명17', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='T-SHIRT'), '상품명18', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='T-SHIRT'), '상품명19', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='T-SHIRT'), '상품명20', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='KNIT'), '상품명21', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='KNIT'), '상품명22', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='KNIT'), '상품명23', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='KNIT'), '상품명24', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='BLOUSE'), '상품명25', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='BLOUSE'), '상품명26', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='BLOUSE'), '상품명27', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='BLOUSE'), '상품명28', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='SKIRTS'), '상품명29', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='SKIRTS'), '상품명30', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='SKIRTS'), '상품명31', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='SKIRTS'), '상품명32', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='PANTS'), '상품명33', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='PANTS'), '상품명34', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='PANTS'), '상품명35', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='PANTS'), '상품명36', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='DENIM'), '상품명37', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='DENIM'), '상품명38', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='DENIM'), '상품명39', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='DENIM'), '상품명40', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='SHOES'), '상품명41', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='SHOES'), '상품명42', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='SHOES'), '상품명43', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='SHOES'), '상품명44', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='BAG'), '상품명45', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='BAG'), '상품명46', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='BAG'), '상품명47', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='BAG'), '상품명48', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 0, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='ACC'), '상품명49', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='ACC'), '상품명50', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 1, 0, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='ACC'), '상품명51', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, -1, 1, sysdate, 0, sysdate);
INSERT INTO product VALUES(product_seq.nextval, '0000001', (SELECT num FROM mini_cate where name='ACC'), '상품명52', '서브 설명', '메인 설명', 100000, 50000,  999, 1, 1, 0, 0, sysdate, 0, sysdate);

-- 상품색상DB
INSERT INTO colour VALUES(colour_seq.nextval, 1, 'F0F8FF', '색상1');
INSERT INTO colour VALUES(colour_seq.nextval, 1, 'F0F8F1', '색상2');
INSERT INTO colour VALUES(colour_seq.nextval, 1, 'F0F8F2', '색상3');
INSERT INTO colour VALUES(colour_seq.nextval, 1, 'F0F8F3', '색상4');
INSERT INTO colour VALUES(colour_seq.nextval, 2, 'F0F8F4', '색상5');
INSERT INTO colour VALUES(colour_seq.nextval, 2, 'F0F8F5', '색상6');
INSERT INTO colour VALUES(colour_seq.nextval, 2, 'F0F8F6', '색상7');
INSERT INTO colour VALUES(colour_seq.nextval, 2, 'F0F8F7', '색상8');
INSERT INTO colour VALUES(colour_seq.nextval, 3, 'F0F8F8', '색상9');
INSERT INTO colour VALUES(colour_seq.nextval, 3, 'F0F8F9', '색상10');
INSERT INTO colour VALUES(colour_seq.nextval, 3, 'F0F810', '색상11');
INSERT INTO colour VALUES(colour_seq.nextval, 4, 'F0F811', '색상12');
INSERT INTO colour VALUES(colour_seq.nextval, 4, 'F0F812', '색상13');
INSERT INTO colour VALUES(colour_seq.nextval, 4, 'F0F813', '색상14');
INSERT INTO colour VALUES(colour_seq.nextval, 5, 'F0F8FF', '색상1');
INSERT INTO colour VALUES(colour_seq.nextval, 5, 'F0F8F1', '색상2');
INSERT INTO colour VALUES(colour_seq.nextval, 5, 'F0F8F2', '색상3');
INSERT INTO colour VALUES(colour_seq.nextval, 6, 'F0F8F3', '색상4');
INSERT INTO colour VALUES(colour_seq.nextval, 6, 'F0F8F4', '색상5');
INSERT INTO colour VALUES(colour_seq.nextval, 6, 'F0F8F5', '색상6');
INSERT INTO colour VALUES(colour_seq.nextval, 7, 'F0F8F6', '색상7');
INSERT INTO colour VALUES(colour_seq.nextval, 7, 'F0F8F7', '색상8');
INSERT INTO colour VALUES(colour_seq.nextval, 7, 'F0F8F8', '색상9');
INSERT INTO colour VALUES(colour_seq.nextval, 8, 'F0F8F9', '색상10');
INSERT INTO colour VALUES(colour_seq.nextval, 8, 'F0F810', '색상11');
INSERT INTO colour VALUES(colour_seq.nextval, 8, 'F0F811', '색상12');
INSERT INTO colour VALUES(colour_seq.nextval, 9, 'F0F812', '색상13');
INSERT INTO colour VALUES(colour_seq.nextval, 9, 'F0F813', '색상14');
INSERT INTO colour VALUES(colour_seq.nextval, 9, 'F0F8FF', '색상1');
INSERT INTO colour VALUES(colour_seq.nextval, 10, 'F0F8F1', '색상2');
INSERT INTO colour VALUES(colour_seq.nextval, 10, 'F0F8F2', '색상3');
INSERT INTO colour VALUES(colour_seq.nextval, 10, 'F0F8F3', '색상4');
INSERT INTO colour VALUES(colour_seq.nextval, 11, 'F0F8F4', '색상5');
INSERT INTO colour VALUES(colour_seq.nextval, 11, 'F0F8F5', '색상6');
INSERT INTO colour VALUES(colour_seq.nextval, 11, 'F0F8F6', '색상7');
INSERT INTO colour VALUES(colour_seq.nextval, 12, 'F0F8F7', '색상8');
INSERT INTO colour VALUES(colour_seq.nextval, 12, 'F0F8F8', '색상9');
INSERT INTO colour VALUES(colour_seq.nextval, 12, 'F0F8F9', '색상10');
INSERT INTO colour VALUES(colour_seq.nextval, 13, 'F0F810', '색상11');
INSERT INTO colour VALUES(colour_seq.nextval, 13, 'F0F811', '색상12');
INSERT INTO colour VALUES(colour_seq.nextval, 14, 'F0F812', '색상13');
INSERT INTO colour VALUES(colour_seq.nextval, 14, 'F0F813', '색상14');
INSERT INTO colour VALUES(colour_seq.nextval, 15, 'F0F8FF', '색상1');
INSERT INTO colour VALUES(colour_seq.nextval, 15, 'F0F8F1', '색상2');
INSERT INTO colour VALUES(colour_seq.nextval, 16, 'F0F8F2', '색상3');
INSERT INTO colour VALUES(colour_seq.nextval, 16, 'F0F8F3', '색상4');
INSERT INTO colour VALUES(colour_seq.nextval, 16, 'F0F8F4', '색상5');
INSERT INTO colour VALUES(colour_seq.nextval, 17, 'F0F8F5', '색상6');
INSERT INTO colour VALUES(colour_seq.nextval, 17, 'F0F8F6', '색상7');
INSERT INTO colour VALUES(colour_seq.nextval, 17, 'F0F8F7', '색상8');
INSERT INTO colour VALUES(colour_seq.nextval, 18, 'F0F8F8', '색상9');
INSERT INTO colour VALUES(colour_seq.nextval, 18, 'F0F8F9', '색상10');
INSERT INTO colour VALUES(colour_seq.nextval, 18, 'F0F810', '색상11');
INSERT INTO colour VALUES(colour_seq.nextval, 19, 'F0F811', '색상12');
INSERT INTO colour VALUES(colour_seq.nextval, 19, 'F0F812', '색상13');
INSERT INTO colour VALUES(colour_seq.nextval, 19, 'F0F813', '색상14');
INSERT INTO colour VALUES(colour_seq.nextval, 20, 'F0F8FF', '색상1');
INSERT INTO colour VALUES(colour_seq.nextval, 20, 'F0F8F1', '색상2');
INSERT INTO colour VALUES(colour_seq.nextval, 21, 'F0F8F2', '색상3');
INSERT INTO colour VALUES(colour_seq.nextval, 21, 'F0F8F3', '색상4');
INSERT INTO colour VALUES(colour_seq.nextval, 22, 'F0F8F4', '색상5');
INSERT INTO colour VALUES(colour_seq.nextval, 22, 'F0F8F5', '색상6');
INSERT INTO colour VALUES(colour_seq.nextval, 22, 'F0F8F6', '색상7');
INSERT INTO colour VALUES(colour_seq.nextval, 23, 'F0F8F7', '색상8');
INSERT INTO colour VALUES(colour_seq.nextval, 23, 'F0F8F8', '색상9');
INSERT INTO colour VALUES(colour_seq.nextval, 24, 'F0F8F9', '색상10');
INSERT INTO colour VALUES(colour_seq.nextval, 24, 'F0F810', '색상11');
INSERT INTO colour VALUES(colour_seq.nextval, 25, 'F0F811', '색상12');
INSERT INTO colour VALUES(colour_seq.nextval, 25, 'F0F812', '색상13');
INSERT INTO colour VALUES(colour_seq.nextval, 26, 'F0F813', '색상14');
INSERT INTO colour VALUES(colour_seq.nextval, 26, 'F0F8FF', '색상1');
INSERT INTO colour VALUES(colour_seq.nextval, 27, 'F0F8F1', '색상2');
INSERT INTO colour VALUES(colour_seq.nextval, 27, 'F0F8F2', '색상3');
INSERT INTO colour VALUES(colour_seq.nextval, 28, 'F0F8F3', '색상4');
INSERT INTO colour VALUES(colour_seq.nextval, 28, 'F0F8F4', '색상5');
INSERT INTO colour VALUES(colour_seq.nextval, 29, 'F0F8F5', '색상6');
INSERT INTO colour VALUES(colour_seq.nextval, 29, 'F0F8F6', '색상7');
INSERT INTO colour VALUES(colour_seq.nextval, 30, 'F0F8F7', '색상8');
INSERT INTO colour VALUES(colour_seq.nextval, 30, 'F0F8F8', '색상9');
INSERT INTO colour VALUES(colour_seq.nextval, 31, 'F0F8F9', '색상10');
INSERT INTO colour VALUES(colour_seq.nextval, 31, 'F0F810', '색상11');
INSERT INTO colour VALUES(colour_seq.nextval, 32, 'F0F811', '색상12');
INSERT INTO colour VALUES(colour_seq.nextval, 32, 'F0F812', '색상13');
INSERT INTO colour VALUES(colour_seq.nextval, 33, 'F0F813', '색상14');
INSERT INTO colour VALUES(colour_seq.nextval, 33, 'F0F8FF', '색상1');
INSERT INTO colour VALUES(colour_seq.nextval, 34, 'F0F8F1', '색상2');
INSERT INTO colour VALUES(colour_seq.nextval, 34, 'F0F8F2', '색상3');
INSERT INTO colour VALUES(colour_seq.nextval, 35, 'F0F8F3', '색상4');
INSERT INTO colour VALUES(colour_seq.nextval, 35, 'F0F8F4', '색상5');
INSERT INTO colour VALUES(colour_seq.nextval, 36, 'F0F8F5', '색상6');
INSERT INTO colour VALUES(colour_seq.nextval, 36, 'F0F8F6', '색상7');
INSERT INTO colour VALUES(colour_seq.nextval, 37, 'F0F8F7', '색상8');
INSERT INTO colour VALUES(colour_seq.nextval, 37, 'F0F8F8', '색상9');
INSERT INTO colour VALUES(colour_seq.nextval, 38, 'F0F8F9', '색상10');
INSERT INTO colour VALUES(colour_seq.nextval, 38, 'F0F810', '색상11');
INSERT INTO colour VALUES(colour_seq.nextval, 39, 'F0F811', '색상12');
INSERT INTO colour VALUES(colour_seq.nextval, 39, 'F0F812', '색상13');
INSERT INTO colour VALUES(colour_seq.nextval, 40, 'F0F813', '색상14');
INSERT INTO colour VALUES(colour_seq.nextval, 40, 'F0F8FF', '색상1');
INSERT INTO colour VALUES(colour_seq.nextval, 41, 'F0F8F1', '색상2');
INSERT INTO colour VALUES(colour_seq.nextval, 41, 'F0F8F2', '색상3');
INSERT INTO colour VALUES(colour_seq.nextval, 42, 'F0F8F3', '색상4');
INSERT INTO colour VALUES(colour_seq.nextval, 42, 'F0F8F4', '색상5');
INSERT INTO colour VALUES(colour_seq.nextval, 43, 'F0F8F5', '색상6');
INSERT INTO colour VALUES(colour_seq.nextval, 43, 'F0F8F6', '색상7');
INSERT INTO colour VALUES(colour_seq.nextval, 44, 'F0F8F7', '색상8');
INSERT INTO colour VALUES(colour_seq.nextval, 44, 'F0F8F8', '색상9');
INSERT INTO colour VALUES(colour_seq.nextval, 45, 'F0F8F9', '색상10');
INSERT INTO colour VALUES(colour_seq.nextval, 45, 'F0F810', '색상11');
INSERT INTO colour VALUES(colour_seq.nextval, 46, 'F0F811', '색상12');
INSERT INTO colour VALUES(colour_seq.nextval, 46, 'F0F812', '색상13');
INSERT INTO colour VALUES(colour_seq.nextval, 47, 'F0F813', '색상14');
INSERT INTO colour VALUES(colour_seq.nextval, 47, 'F0F8FF', '색상1');
INSERT INTO colour VALUES(colour_seq.nextval, 48, 'F0F8F1', '색상2');
INSERT INTO colour VALUES(colour_seq.nextval, 48, 'F0F8F2', '색상3');
INSERT INTO colour VALUES(colour_seq.nextval, 49, 'F0F8F3', '색상4');
INSERT INTO colour VALUES(colour_seq.nextval, 49, 'F0F8F4', '색상5');
INSERT INTO colour VALUES(colour_seq.nextval, 50, 'F0F8F5', '색상6');
INSERT INTO colour VALUES(colour_seq.nextval, 50, 'F0F8F6', '색상7');
INSERT INTO colour VALUES(colour_seq.nextval, 51, 'F0F8F7', '색상8');
INSERT INTO colour VALUES(colour_seq.nextval, 51, 'F0F8F8', '색상9');
INSERT INTO colour VALUES(colour_seq.nextval, 52, 'F0F8F9', '색상10');
INSERT INTO colour VALUES(colour_seq.nextval, 52, 'F0F810', '색상11');



--SIZE
INSERT INTO sizu VALUES(sizu_seq.nextval, 'FREE', (Select num from product where name='상품명1'));
INSERT INTO sizu VALUES(sizu_seq.nextval, 'S', (Select num from product where name='상품명1'));
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

-- 아이콘DB
INSERT INTO icon VALUES(icon_seq.nextval, 1, 'best', sysdate, TO_DATE('2018-04-05','yyyy-mm-dd'), 1);
INSERT INTO icon VALUES(icon_seq.nextval, 2, 'new', sysdate, TO_DATE('2018-04-05','yyyy-mm-dd'), 1);
INSERT INTO icon VALUES(icon_seq.nextval, 4, 'hit', sysdate, TO_DATE('2018-04-05','yyyy-mm-dd'), 0);
INSERT INTO icon VALUES(icon_seq.nextval, 5, 'sale', sysdate, TO_DATE('2018-04-05','yyyy-mm-dd'), 0);

-- 배너
insert into banner values(banner_seq.nextval,4,'리뷰이벤트','내용',TO_DATE('2017-01-02','yyyy-mm-dd'),TO_DATE('2017-01-09','yyyy-mm-dd'),0, 'test배너.png');
insert into banner values(banner_seq.nextval,4,'연말특별세일','내용',TO_DATE('2017-01-02','yyyy-mm-dd'),TO_DATE('2017-01-09','yyyy-mm-dd'),1, null);
insert into banner values(banner_seq.nextval,4,'무료배송이벤트','내용',TO_DATE('2017-01-02','yyyy-mm-dd'),TO_DATE('2017-01-09','yyyy-mm-dd'),-1, null);

--faq
insert into faq values(faq_seq.nextval,4,'불량제품이 왔어요','고객센터로 연락주세요');
insert into faq values(faq_seq.nextval,4,'배송기간이 어떻게 되나요?','택배사의 상황에 따라 다릅니다');
insert into faq values(faq_seq.nextval,4,'배송조회는 어디서 하나요?','주문내역에서 운송장 번호로 조회하시면 됩니다');

-- notice
insert into notice values(notice_seq.nextval,4,'설연휴 배송 지연 안내','설연휴라~ 부득이하게~ 배송이~ 느려요~',0,sysdate);
insert into notice values(notice_seq.nextval,4,'교환 및 환불양식','내용',0,sysdate);
insert into notice values(notice_seq.nextval,4,'상품별 사이즈 측정 방법안내','내용',0,sysdate);

-- qna
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,1,0,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,2,1,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,3,2,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,4,3,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,5,4,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,6,5,'내용',0,0,sysdate);
insert into qna values(qna_seq.nextval,7,0,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,8,1,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,9,2,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,10,3,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,11,4,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,12,5,'내용',0,1,'1234',sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,22,0,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,25,1,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,32,2,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,27,3,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,2,4,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,12,5,'내용',0,0,sysdate);
insert into qna values(qna_seq.nextval,16,0,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,29,1,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,36,2,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,7,3,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,5,4,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,24,5,'내용',0,1,'1234',sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,11,0,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,22,1,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,10,2,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,11,3,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,21,4,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,31,5,'내용',0,0,sysdate);
insert into qna values(qna_seq.nextval,27,0,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,18,1,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,29,2,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,10,3,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,21,4,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,32,5,'내용',0,1,'1234',sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,27,0,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,24,1,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,30,2,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,28,3,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,12,4,'내용',0,0,sysdate);
insert into qna (num, mem_num, subject, content, count, secure, indate) values(qna_seq.nextval,15,5,'내용',0,0,sysdate);
insert into qna values(qna_seq.nextval,36,0,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,19,1,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,26,2,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,8,3,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,35,4,'내용',0,1,'1234',sysdate);
insert into qna values(qna_seq.nextval,24,5,'내용',0,1,'1234',sysdate);

-- qna_reply
insert into qna_reply values(qna_reply_seq.nextval,1,38,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,2,39,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,3,40,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,4,41,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,5,42,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,6,43,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,7,44,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,8,45,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,9,46,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,10,45,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,11,44,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,12,43,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,13,42,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,14,41,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,15,40,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,16,41,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,17,42,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,18,43,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,19,44,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,20,45,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,21,46,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,22,42,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,23,40,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,24,43,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,25,42,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,26,45,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,27,46,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,28,41,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,29,40,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,30,41,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,31,42,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,32,43,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,33,44,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,34,45,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,35,46,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,36,44,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,37,43,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,38,42,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,39,41,'내용',sysdate);
insert into qna_reply values(qna_reply_seq.nextval,40,40,'내용',sysdate);

-- 주문 db
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name,sizu_num,colour_num) 
values (paid_seq.nextval,1,1,null,2017110812345678,'김경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','벨고장났어요',to_date('2017-11-09','yyyy-mm-dd'),0,100000,90000,to_date('2017-11-08','yyyy-mm-dd'),1,'김경미',(select num from sizu where product_num =1 and sizu='L'),(select num from colour where product_num=1 and name='색상1'));
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name,sizu_num,colour_num) 
values (paid_seq.nextval,1,1,null,2017112900000001,'박경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','배송 전 연락 부탁드려요',null,0,100000,90000,to_date('2017-11-29','yyyy-mm-dd'),0,'함혜진',(select num from sizu where product_num =1 and sizu='FREE'),(select num from colour where product_num=1 and name='색상2'));
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name,sizu_num,colour_num) 
values (paid_seq.nextval,1,1,null,2017120800000001,'최경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','부재 시 문 앞에 두고 가주세요',to_date('2017-12-08','yyyy-mm-dd'),0,100000,90000,to_date('2017-12-08','yyyy-mm-dd'),1,'최경미',(select num from sizu where product_num =1 and sizu='S'),(select num from colour where product_num=1 and name='색상3')); 
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name,sizu_num,colour_num) 
values (paid_seq.nextval,1,1,null,2017111800000001,'이경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','부재 시 경비실에 맡겨주세요',to_date('2017-11-19','yyyy-mm-dd'),0,100000,90000,to_date('2017-11-18','yyyy-mm-dd'),2,'이경미',(select num from sizu where product_num =1 and sizu='M'),(select num from colour where product_num=1 and name='색상4'));
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name,sizu_num,colour_num) 
values (paid_seq.nextval,1,1,null,2017123000000001,'강경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호',null,null,0,100000,90000,to_date('2017-12-30','yyyy-mm-dd'),0,'송유정',(select num from sizu where product_num =1 and sizu='S'),(select num where product_num=1 and name='색상3'));
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name,sizu_num,colour_num) 
values (paid_seq.nextval,1,1,null,2017101900000001,'유경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','도착하셔서 연락 부탁드립니다',to_date('2017-10-20','yyyy-mm-dd'),0,100000,90000,to_date('2017-10-19','yyyy-mm-dd'),2,'유경미',(select num from sizu where product_num =1 and sizu='FREE'),(select num from colour where product_num=1 and name='색상2'));
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name,sizu_num,colour_num) 
values (paid_seq.nextval,1,1,null,2017112400000011,'곽경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호',null,null,0,100000,90000,to_date('2017-11-24','yyyy-mm-dd'),0,'곽경미',(select num from sizu where product_num =1 and sizu='S'),(select num from colour where product_num=1 and name='색상3'));
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name,sizu_num,colour_num) 
values (paid_seq.nextval,1,1,null,2017122800000011,'함경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','잘 부탁드립니다.',to_date('2017-12-29','yyyy-mm-dd'),0,100000,90000,to_date('2017-12-28','yyyy-mm-dd'),1,'곽은경',(select num from sizu where product_num =1 and sizu='S'),(select num from colour where product_num=1 and name='색상3'));
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name,sizu_num,colour_num) 
values (paid_seq.nextval,1,1,null,2017082900000011,'송경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','감사합니다.',to_date('2017-08-29','yyyy-mm-dd'),0,100000,90000,to_date('2017-08-29','yyyy-mm-dd'),1,'송경미',(select num from sizu where product_num =1 and sizu='S'),(select num from colour where product_num=1 and name='색상2'));
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name,sizu_num,colour_num) 
values (paid_seq.nextval,1,1,null,2018010100000011,'경미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','출입문 앞에서 연락 부탁드려요',null,0,100000,90000,to_date('2018-01-01','yyyy-mm-dd'),0,'유반니',(select num from sizu where product_num =1 and sizu='M'),(select num from colour where product_num=1 and name='색상1'));
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name,sizu_num,colour_num) 
values (paid_seq.nextval,1,1,null,2017110800000002,'미',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','항상 감사합니다',to_date('2017-11-08','yyyy-mm-dd'),0,100000,90000,to_date('2017-11-08','yyyy-mm-dd'),1,'김주연',(select num from sizu where product_num =1 and sizu='FREE'),(select num from colour where product_num=1 and name='색상4'));
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name,sizu_num,colour_num) 
values (paid_seq.nextval,1,1,null,2017112900000002,'송유정',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호',null,null,2,100000,100000,to_date('2017-11-29','yyyy-mm-dd'),0,'박보검',(select num from sizu where product_num =1 and sizu='M'),(select num from colour where product_num=1 and name='색상3'));
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name,sizu_num,colour_num) 
values (paid_seq.nextval,1,1,null,2017120100000011,'김혜자',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','빠른배송 부탁드립니다.',to_date('2017-12-01','yyyy-mm-dd'),2,100000,97000,to_date('2017-12-01','yyyy-mm-dd'),1,'김혜자',(select num from sizu where product_num =1 and sizu='FREE'),(select num from colour where product_num=1 and name='색상3'));
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name,sizu_num,colour_num) 
values (paid_seq.nextval,2,1,null,2017120300000001,'김창렬',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호',null,to_date('2017-12-04','yyyy-mm-dd'),0,100000,1000000,to_date('2017-12-01','yyyy-mm-dd'),1,'김창렬',(select num from sizu where product_num =1 and sizu='S'),(select num from colour where product_num=1 and name='색상1'));
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name,sizu_num,colour_num) 
values (paid_seq.nextval,3,1,null,2017122200000123,'유정란',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','차조심',to_date('2017-12-22','yyyy-mm-dd'),0,100000,1000000,to_date('2017-12-22','yyyy-mm-dd'),2,'무정란',(select num from sizu where product_num =1 and sizu='M'),(select num from colour where product_num=1 and name='색상3'));
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name,sizu_num,colour_num) 
values (paid_seq.nextval,3,5,null,2017120500000123,'김종렬',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','노크부탁',to_date('2017-12-05','yyyy-mm-dd'),1,100000,1000000 ,to_date('2017-12-06','yyyy-mm-dd'),1,'김종렬',(select num from sizu where product_num =5 and sizu='FREE'),(select num from colour where product_num=5 and name='색상3'));
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name,sizu_num,colour_num) 
values(paid_seq.nextval,2,50,null,2017121200000011,'심수봉',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호',null,to_date('2017-12-12','yyyy-mm-dd'),0,100000,1000000,to_date('2017-12-12','yyyy-mm-dd'),1,'남진',(select num from sizu where product_num =50 and sizu='M'),(select num from colour where product_num=50 and name='색상6'));
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name,sizu_num,colour_num) 
values (paid_seq.nextval,3,25,null,2017121300000012,'김지석',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호',null,to_date('2017-12-14','yyyy-mm-dd'),0,100000,1000000,to_date('2017-12-13','yyyy-mm-dd'),1,'김지석',(select num from sizu where product_num =25 and sizu='FREE'),(select num from colour where product_num=25 and name='색상12'));
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name,sizu_num,colour_num) 
values (paid_seq.nextval,2,3,null,2017121500000012,'송지석',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','빠른배송ㄱㄱ',null,0,100000,1000000,to_date('2017-12-15','yyyy-mm-dd'),0,'송지석',(select num from sizu where product_num =3 and sizu='L'),(select num from colour where product_num=3 and name='색상9'));
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name,sizu_num,colour_num) 
values (paid_seq.nextval,1,35,null,2017122400000121,'유정',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','크리스마스조심',to_date('2017-12-24','yyyy-mm-dd'),0,100000,1000000,to_date('2017-12-25','yyyy-mm-dd'),1,'유정',(select num from sizu where product_num =35 and sizu='L'),(select num from colour where product_num=35 and name='색상5'));
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name,sizu_num,colour_num) 
values (paid_seq.nextval,1,52,null,2017123000000122,'김상우',01012341234,11758,'경기도 의정부시 장암동','**아파트 101동 504호','신년조심',to_date('2017-12-30','yyyy-mm-dd'),0,100000,1000000,to_date('2017-12-30','yyyy-mm-dd'),1,'김상우',(select num from sizu where product_num =52 and sizu='FREE'),(select num from colour where product_num=52 and name='색상11'));
--주문 db --다혜 취소,교환/반품 테스트디비 추가
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name,sizu_num,colour_num) 
values (paid_seq.nextval,1,52,null,2017123000000122,'김다혜',01012341234,11758,'경기도 구리시 장암동','**아파트 101동 504호','취소할거',to_date('2017-12-30','yyyy-mm-dd'),0,100000,1000000,to_date('2017-12-30','yyyy-mm-dd'),-2,'김다혜',(select num from sizu where product_num =52 and sizu='FREE'),(select num from colour where product_num=52 and name='색상11'));
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name,sizu_num,colour_num) 
values (paid_seq.nextval,1,52,null,2017123000000122,'김라혜',01012341234,11758,'경기도 안산시 장암동','**아파트 101동 504호','교환할거',to_date('2017-12-30','yyyy-mm-dd'),0,100000,1000000,to_date('2017-12-30','yyyy-mm-dd'),-1,'김라혜',(select num from sizu where product_num =52 and sizu='FREE'),(select num from colour where product_num=52 and name='색상11'));
insert into paid(num,mem_num,product_num,coupon_num, order_num, name, phone, zip_code, base_addr, detail_addr, memo, paid_date, pay_with, order_money, payment, order_date, order_state,deposit_name,sizu_num,colour_num) 
values (paid_seq.nextval,1,52,null,2017123000000122,'김마혜',01012341234,11758,'경기도 남양주시 장암동','**아파트 101동 504호','반품할거',to_date('2017-12-30','yyyy-mm-dd'),0,100000,1000000,to_date('2017-12-30','yyyy-mm-dd'),-1,'김마혜',(select num from sizu where product_num =52 and sizu='FREE'),(select num from colour where product_num=52 and name='색상11'));


--wish db
-- 							num, productNum, productNum, date, sizuNum, colourNum
INSERT INTO wish VALUES(wish_seq.nextval ,1 , 1, sysdate, (select num from sizu where sizu='FREE' and product_num=1),(select num from colour where product_num=1 and name='색상1'));
INSERT INTO wish VALUES(wish_seq.nextval ,1 , 3, sysdate, (select num from sizu where sizu='L' and product_num=1),(select num from colour where product_num=1 and name='색상2'));
INSERT INTO wish VALUES(wish_seq.nextval ,1 , 5, sysdate, (select num from sizu where sizu='M' and product_num=1),(select num from colour where product_num=1 and name='색상3'));
INSERT INTO wish VALUES(wish_seq.nextval ,1 , 7, sysdate, (select num from sizu where sizu='S' and product_num=1),(select num from colour where product_num=1 and name='색상4'));
INSERT INTO wish VALUES(wish_seq.nextval ,2 , 1, sysdate, (select num from sizu where sizu='FREE' and product_num=2),(select num from colour where product_num=2 and name='색상5'));
INSERT INTO wish VALUES(wish_seq.nextval ,2 , 3, sysdate, (select num from sizu where sizu='L' and product_num=2),(select num from colour where product_num=2 and name='색상6'));
INSERT INTO wish VALUES(wish_seq.nextval ,2 , 5, sysdate, (select num from sizu where sizu='M' and product_num=2),(select num from colour where product_num=2 and name='색상7'));
INSERT INTO wish VALUES(wish_seq.nextval ,2 , 7, sysdate, (select num from sizu where sizu='S' and product_num=2),(select num from colour where product_num=2 and name='색상8'));
INSERT INTO wish VALUES(wish_seq.nextval ,3 , 1, sysdate, (select num from sizu where sizu='FREE' and product_num=3),(select num from colour where product_num=3 and name='색상9'));
INSERT INTO wish VALUES(wish_seq.nextval ,3 , 3, sysdate, (select num from sizu where sizu='L' and product_num=3),(select num from colour where product_num=3 and name='색상10'));
INSERT INTO wish VALUES(wish_seq.nextval ,3 , 5, sysdate, (select num from sizu where sizu='M' and product_num=3),(select num from colour where product_num=3 and name='색상10'));
INSERT INTO wish VALUES(wish_seq.nextval ,3 , 7, sysdate, (select num from sizu where sizu='S' and product_num=3),(select num from colour where product_num=3 and name='색상11'));
INSERT INTO wish VALUES(wish_seq.nextval ,4 , 1, sysdate, (select num from sizu where sizu='FREE' and product_num=4),(select num from colour where product_num=4 and name='색상12'));
INSERT INTO wish VALUES(wish_seq.nextval ,4 , 3, sysdate, (select num from sizu where sizu='L' and product_num=4),(select num from colour where product_num=4 and name='색상12'));
INSERT INTO wish VALUES(wish_seq.nextval ,4 , 5, sysdate, (select num from sizu where sizu='M' and product_num=4),(select num from colour where product_num=4 and name='색상13'));
INSERT INTO wish VALUES(wish_seq.nextval ,4 , 7, sysdate, (select num from sizu where sizu='S' and product_num=4),(select num from colour where product_num=4 and name='색상14'));
INSERT INTO wish VALUES(wish_seq.nextval ,5 , 1, sysdate, (select num from sizu where sizu='FREE' and product_num=5),(select num from colour where product_num=5 and name='색상1'));
INSERT INTO wish VALUES(wish_seq.nextval ,5 , 3, sysdate, (select num from sizu where sizu='L' and product_num=5),(select num from colour where product_num=5 and name='색상2'));
INSERT INTO wish VALUES(wish_seq.nextval ,5 , 5, sysdate, (select num from sizu where sizu='M' and product_num=5),(select num from colour where product_num=5 and name='색상2'));
INSERT INTO wish VALUES(wish_seq.nextval ,5 , 7, sysdate, (select num from sizu where sizu='S' and product_num=5),(select num from colour where product_num=5 and name='색상3'));
INSERT INTO wish VALUES(wish_seq.nextval ,6 , 2, sysdate, (select num from sizu where sizu='FREE' and product_num=6),(select num from colour where product_num=6 and name='색상4'));
INSERT INTO wish VALUES(wish_seq.nextval ,6 , 4, sysdate, (select num from sizu where sizu='L' and product_num=6),(select num from colour where product_num=6 and name='색상4'));
INSERT INTO wish VALUES(wish_seq.nextval ,6 , 6, sysdate, (select num from sizu where sizu='M' and product_num=6),(select num from colour where product_num=6 and name='색상5'));
INSERT INTO wish VALUES(wish_seq.nextval ,6 , 8, sysdate, (select num from sizu where sizu='S' and product_num=6),(select num from colour where product_num=6 and name='색상6'));
INSERT INTO wish VALUES(wish_seq.nextval ,7 , 2, sysdate, (select num from sizu where sizu='FREE' and product_num=7),(select num from colour where product_num=7 and name='색상7'));
INSERT INTO wish VALUES(wish_seq.nextval ,7 , 4, sysdate, (select num from sizu where sizu='L' and product_num=7),(select num from colour where product_num=7 and name='색상7'));
INSERT INTO wish VALUES(wish_seq.nextval ,7 , 6, sysdate, (select num from sizu where sizu='M' and product_num=7),(select num from colour where product_num=7 and name='색상8'));
INSERT INTO wish VALUES(wish_seq.nextval ,7 , 8, sysdate, (select num from sizu where sizu='S' and product_num=7),(select num from colour where product_num=7 and name='색상9'));
INSERT INTO wish VALUES(wish_seq.nextval ,8 , 2, sysdate, (select num from sizu where sizu='FREE' and product_num=8),(select num from colour where product_num=8 and name='색상10'));
INSERT INTO wish VALUES(wish_seq.nextval ,8 , 4, sysdate, (select num from sizu where sizu='L' and product_num=8),(select num from colour where product_num=8 and name='색상10'));
INSERT INTO wish VALUES(wish_seq.nextval ,8 , 6, sysdate, (select num from sizu where sizu='M' and product_num=8),(select num from colour where product_num=8 and name='색상11'));
INSERT INTO wish VALUES(wish_seq.nextval ,8 , 8, sysdate, (select num from sizu where sizu='S' and product_num=8),(select num from colour where product_num=8 and name='색상12'));
INSERT INTO wish VALUES(wish_seq.nextval ,9 , 2, sysdate, (select num from sizu where sizu='FREE' and product_num=9),(select num from colour where product_num=9 and name='색상13'));
INSERT INTO wish VALUES(wish_seq.nextval ,9 , 4, sysdate, (select num from sizu where sizu='L' and product_num=9),(select num from colour where product_num=9 and name='색상13'));
INSERT INTO wish VALUES(wish_seq.nextval ,9 , 6, sysdate, (select num from sizu where sizu='M' and product_num=9),(select num from colour where product_num=9 and name='색상14'));
INSERT INTO wish VALUES(wish_seq.nextval ,9 , 8, sysdate, (select num from sizu where sizu='S' and product_num=9),(select num from colour where product_num=9 and name='색상1'));
INSERT INTO wish VALUES(wish_seq.nextval ,10 , 2, sysdate, (select num from sizu where sizu='FREE' and product_num=10),(select num from colour where product_num=10 and name='색상2'));
INSERT INTO wish VALUES(wish_seq.nextval ,10 , 4, sysdate, (select num from sizu where sizu='L' and product_num=10),(select num from colour where product_num=10 and name='색상3'));
INSERT INTO wish VALUES(wish_seq.nextval ,10 , 6, sysdate, (select num from sizu where sizu='M' and product_num=10),(select num from colour where product_num=10 and name='색상4'));
INSERT INTO wish VALUES(wish_seq.nextval ,10 , 8, sysdate, (select num from sizu where sizu='S' and product_num=10),(select num from colour where product_num=10 and name='색상4'));

-- 상품후기DB
INSERT INTO review VALUES(review_seq.nextval, 1, 1, '치수', '내용', 1, sysdate);
INSERT INTO review VALUES(review_seq.nextval, 1, 1, '치수', '내용', 2, sysdate);
INSERT INTO review VALUES(review_seq.nextval, 1, 1, '치수', '내용', 3, sysdate);
INSERT INTO review VALUES(review_seq.nextval, 1, 1, '치수', '내용', 4, sysdate);
INSERT INTO review VALUES(review_seq.nextval, 1, 1, '치수', '내용', 5, sysdate);
INSERT INTO review VALUES(review_seq.nextval, 1, 1, '치수', '내용', 5, sysdate);

--마일리지
INSERT INTO mileage VALUES(mileage_seq.nextval,1,1,200000,sysdate,2);
INSERT INTO mileage VALUES(mileage_seq.nextval,1,1,200000,sysdate,2);

-- bank
INSERT INTO bank VALUES(bank_seq.nextval ,'우리은행' ,'1002536238755','클래식');
INSERT INTO bank VALUES(bank_seq.nextval ,'신한은행' ,'22875504956326','클래식');
INSERT INTO bank VALUES(bank_seq.nextval ,'국민은행' ,'5678920563257','클래식');

--delivery// 요 밑에 디비 못넣음 혜진 체크용 --다혜 디비수정0118 (order_state와 deliv_state 상황 맞춰서 재수정)
--order_State=0결제대기 -> delivery_state=0배송준비
INSERT INTO delivery VALUES(delivery_seq.nextval ,(select num from paid where order_state=0 and num=2) ,NULL,NULL ,0 ,sysdate , NULL);
INSERT INTO delivery VALUES(delivery_seq.nextval ,(select num from paid where order_state=0 and num=6) ,NULL,NULL ,0 ,sysdate , NULL);
INSERT INTO delivery VALUES(delivery_seq.nextval ,(select num from paid where order_state=0 and num=9) ,NULL,NULL ,0 ,sysdate , NULL);
INSERT INTO delivery VALUES(delivery_seq.nextval ,(select num from paid where order_state=0 and num=11) ,NULL,NULL ,0 ,sysdate , NULL);
INSERT INTO delivery VALUES(delivery_seq.nextval ,(select num from paid where order_state=0 and num=18) ,NULL,NULL ,0 ,sysdate , NULL);
--order_State=1결제완료 -> delivery_state=1배송중
INSERT INTO delivery VALUES(delivery_seq.nextval ,(select num from paid where order_state=1 and num=1) ,'CJ택배','6898000111111111' ,1 ,sysdate , NULL);
INSERT INTO delivery VALUES(delivery_seq.nextval ,(select num from paid where order_state=1 and num=3) ,'CJ택배','6898000122222222' ,1 ,sysdate , NULL);
INSERT INTO delivery VALUES(delivery_seq.nextval ,(select num from paid where order_state=1 and num=7) ,'CJ택배','6898000133333333' ,1 ,sysdate , NULL);
INSERT INTO delivery VALUES(delivery_seq.nextval ,(select num from paid where order_state=1 and num=8) ,'CJ택배','6898000144444444' ,1 ,sysdate , NULL);
INSERT INTO delivery VALUES(delivery_seq.nextval ,(select num from paid where order_state=1 and num=10) ,'CJ택배','6898000145555555' ,1 ,sysdate , NULL);
INSERT INTO delivery VALUES(delivery_seq.nextval ,(select num from paid where order_state=1 and num=20) ,'CJ택배','6898000146666666' ,1 ,sysdate , NULL);
--order_State=1결제완료 -> delivery_state=2배송완료
INSERT INTO delivery VALUES(delivery_seq.nextval ,(select num from paid where order_state=1 and num=12) ,'CJ택배','1111111144426575' ,2 ,sysdate , '20180118');
INSERT INTO delivery VALUES(delivery_seq.nextval ,(select num from paid where order_state=1 and num=13) ,'CJ택배','2222222244426575' ,2 ,sysdate , '20180118');
INSERT INTO delivery VALUES(delivery_seq.nextval ,(select num from paid where order_state=1 and num=15) ,'CJ택배','3333333344426575' ,2 ,sysdate , '20180118');
INSERT INTO delivery VALUES(delivery_seq.nextval ,(select num from paid where order_state=1 and num=17) ,'CJ택배','4444444444426575' ,2 ,sysdate , '20180118');
INSERT INTO delivery VALUES(delivery_seq.nextval ,(select num from paid where order_state=1 and num=19) ,'CJ택배','5555555544426575' ,2 ,sysdate , '20180118');
--order_State=2주문확인 -> delivery_state=3수취확인
INSERT INTO delivery VALUES(delivery_seq.nextval ,(select num from paid where order_state=2 and num=4) ,'대한통운','6666666633334444' ,3 ,sysdate , '20180118');
INSERT INTO delivery VALUES(delivery_seq.nextval ,(select num from paid where order_state=2 and num=5) ,'대한통운','7777777733334444' ,3 ,sysdate , '20180118');
INSERT INTO delivery VALUES(delivery_seq.nextval ,(select num from paid where order_state=2 and num=10) ,'대한통운','8888222233334444' ,3 ,sysdate , '20180118');
--order_State=-1교환/반품 -> delivery_state=2배송완료
INSERT INTO delivery VALUES(delivery_seq.nextval ,(select num from paid where order_state=-1 and num=22) ,'대한통운','999999233334444' ,3 ,sysdate , '20180118');
INSERT INTO delivery VALUES(delivery_seq.nextval ,(select num from paid where order_state=-1 and num=23) ,'대한통운','999222233334444' ,3 ,sysdate , '20180118');
--order_State=-2주문취소 -> delivery_state=0배송준비
INSERT INTO delivery VALUES(delivery_seq.nextval ,(select num from paid where order_state=-2 and num=21) ,NULL,NULL ,0 ,sysdate , NULL);

--delivery
---------------------!!!!!!!!DO NOT INSERT DATA DOWN BELOW!!!!!!!!!!!!------------------------
--delivery// 요 밑에 디비 못넣음 혜진 체크용 
INSERT INTO delivery VALUES(delivery_seq.nextval ,41 ,'CJ택배','6898000144426575' ,1 ,sysdate , NULL);
INSERT INTO delivery VALUES(delivery_seq.nextval ,52 ,NULL,NULL ,0 ,sysdate , NULL);
INSERT INTO delivery VALUES(delivery_seq.nextval ,43 ,'대한통운','1111222233334444' ,2 ,sysdate , NULL);
INSERT INTO delivery VALUES(delivery_seq.nextval ,47 ,'대한통운','6666222233335555' ,3 ,sysdate , '20180107');

--trade--다혜 디비수정0118 (order_state와 deliv_state 상황 맞춰서 재수정)
INSERT INTO trade VALUES(trade_seq.nextval ,(select num from paid where order_state=-1 and num=22),0,sysdate,NULL,0);

--refund--다혜 디비수정0118 (order_state와 deliv_state 상황 맞춰서 재수정)
INSERT INTO refund VALUES(refund_seq.nextval ,(select num from paid where order_state=-1 and num=23),sysdate,1,NULL,1,'카카오뱅크','12345678912','김다혜');

--cancel--다혜 디비수정0118 (order_state와 deliv_state 상황 맞춰서 재수정)
INSERT INTO cancel VALUES(cancel_seq.nextval ,(select num from paid where order_state=-2 and num=21),sysdate,NULL);
--INSERT INTO cancel VALUES(cancel_seq.nextval ,49,sysdate,'20180109');

---------------------!!!!!!!!DO NOT INSERT DATA ABOVE!!!!!!!!!!!! 디비안들어가는 거 확인함------------------------
--cancel
INSERT INTO cancel VALUES(cancel_seq.nextval ,48,sysdate,NULL);
INSERT INTO cancel VALUES(cancel_seq.nextval ,49,sysdate,'20180109');
commit;


--은경 Colour table to modify code column for colorchip--
update colour set code='FFA4D4' where mod(num,2)=0 and code!='F0F813';
update colour set code='A4D4FF' where mod(num,2)=1 and code!='F0F813';
commit;
update product set main_info='메인상품설명입니다. 서브인포보다 더 길게 쓸 수 있어요. 상품에 대한 자세한 설명을 적는 곳입니다.' where num=1;
commit;
