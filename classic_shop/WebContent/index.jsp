<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	window.location.href="/classic_shop/main.do";
</script>

<!-- 
	안 한 거
		-. 이메일 인증 api
		-. 구글 로그인
		-. product search (자동완성O)
		-. 첨부파일 기능 아예 안함 == 나중에 할 것
		-. qna 유효성 검사 및 자잘한 것들
			- 비공개글 클릭 시 비밀번호 입력창
			- 비공개글 삭제 시 비밀번호 입력창
		-. CSS 총정리(로그인, 회원가입, 게시판)
			- 네비게이션 三
			- 반응형
			- 버튼 위치
			- 게시판 아이콘(카메라)
			- 테이블 효과 제거
			- 테이블 위치 및 여백, 출력 라인
			- 비밀번호 입력창 / 로그인 id/pw 찾기창
 -->
<!-- 
	이메일 인증 참고자료
	http://altongmon.tistory.com/308
	http://sick33.tistory.com/30
	http://hunit.tistory.com/306
	http://compunication.tistory.com/15
	https://prezi.com/ggcv6bezgvmr/mvc/
	
	http://drsggg.tistory.com/47
	https://shj7242.github.io/2017/12/04/Spring28/
	
	로그인 SSL 인증
	RSA 암호화
	
	http://cofs.tistory.com/297
	http://vip00112.tistory.com/40
	
	http://bamtol.woweb.net/bbs/skin/ggambo7002_board/print.php?id=a260&no=147
	http://rios.tistory.com/42
	https://blog.erulabo.com/web-development/javascript-popup-window/
 -->
 <!-- 
 	QNA 검색 AJAX
 	- SUBJECT 옵션 클릭할 때마다 리스트가 변해!
 	- NAME 클릭 시엔 버튼을 눌러야 검색 쿼리 돌아간다!
 	
 	http://hunit.tistory.com/204
 	http://hellogk.tistory.com/74
  -->
  <!-- 
  	QNA 비밀글
  		- 공개 글을 눌렀을 때, 내가 쓴 글이든 아니든 read.do?num= 실행 시킨다.
  		- 비공개 글을 눌렀을 때, 내가 쓴 글이든 아니든 비밀번호 입력창을 띄운다.
  			- 해당하는 qna.num의 qna.pwd가 일치한 경우 read.do?num= 실행.
  			- 해당하는 qna.num의 qna.pwd가 불일치한 경우 alert창 띄우고, 비밀번호 입력창 close();
  	===========
  	비밀글 제목을 눌렀을 때, qna.secure & qna.num을 가진 채 자바스크립트로 가게 한다.
  	secure == 0, 곧바로 read.do?num
  	secure == 1, window.open("");
  		- 비밀번호 일치, read.do?num
  		- 비밀번호 불일치, alert + close();
  	
  	부모창, 자식창, 객체값 어떻게?	
   -->
   
   
 <!-- 
	** 검색 조건 : 1) 카테고리 2) 상품명 3) 가격대
	SELECT * FROM product WHERE ? like '%?%' ORDER BY ? DESC
												cate						indate DESC
												mini_cate				total_pcs ASC
												name						
												price						price DESC
																			price ASC
	최신순 		: SELECT * FROM product WHERE 검색 조건 ORDER BY indate DESC
	인기순		: SELECT * FROM product WHERE 검색 조건 ORDER BY 판매량 DESC
	리뷰순		: SELECT * FROM product WHERE 검색 조건 ORDER BY 리뷰수 DESC
	높은 가격 	: SELECT * FROM product WHERE 검색 조건 ORDER BY price DESC
	낮은 가격 	: SELECT * FROM product WHERE 검색 조건 ORDER BY price ASC
	
Q1) 리뷰 많은 순으로 정렬하고 싶은데, 상품->주문->리뷰 DB 구조라 어떻게 해야할지 모르겠다!
	- product Num을 기준으로 paid에 가서 해당 프로덕트 넘으로 셀렉트하고,
	- 프로덕트 넘버를 기준으로 리뷰에 가서 카운트를 해
	- 이게 무슨 말임?ㅎㅎㅎㅎㅎㅎㅎ!
Q2) WHERE price like 안에 ~이상 ~이하 조건 주는 게 가능한지? where절에 and쓰기

 -->
 
 
