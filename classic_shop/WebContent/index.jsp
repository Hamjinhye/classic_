<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	window.location.href="/classic_shop/main.do";
</script>

<!-- 
	안 한 거
		2. 이메일 인증 api
		3. 구글 로그인
		5. qna 유효성 검사 및 자잘한 것들
			- 내 글만 확인하기
			- 비공개글 클릭 시 비밀번호 입력창
			- 비공개글 삭제 시 비밀번호 입력창
			- 글 수정 후 해당 글로 이동하기(넘버값 어떻게?)
			- 글 등록 후 해당 글로 이동하기(넘버값 어떻게?)
			- 글 등록 시 subject, content, secure, pwdInput ajax 구현
			- 첨부파일 기능 아예 안함
			- qna reply 기능 아예 안함
		6. product search
		7. footer map
			- 지도에 아이콘 띄우기(==> modal로 구현할 것)
		8. CSS 총정리(로그인, 회원가입, 게시판)
			- 네비게이션 三
			- 반응형
			- 버튼 위치
			- 게시판 아이콘(카메라, +,-)
			- 테이블 효과 제거
			- 테이블 위치 및 여백, 출력 라인
			- 아코디언
			- 비밀번호 입력창 / 로그인 id/pw 찾기창
 -->
<!-- 
	한 거
		1. 세션 로그인
		2. 회원가입
		3. 게시판 유효성 검사/첨부파일/reply 제외한 기본적인 CRUD
		4. header/footer(회원/비회원 필터 & 지도 제외)
		5. banner cookie 구현
 -->
<!-- 
	이메일 인증 참고자료
	http://altongmon.tistory.com/308
	http://sick33.tistory.com/30
	http://hunit.tistory.com/306
	http://compunication.tistory.com/15
	https://prezi.com/ggcv6bezgvmr/mvc/
	
	로그인 SSL 인증
	RSA 암호화
	
	http://cofs.tistory.com/297
	http://vip00112.tistory.com/40
	
	http://bamtol.woweb.net/bbs/skin/ggambo7002_board/print.php?id=a260&no=147
	http://rios.tistory.com/42
	https://blog.erulabo.com/web-development/javascript-popup-window/
 -->

 