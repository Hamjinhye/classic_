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
	name varchar2(50) UNIQUE,
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