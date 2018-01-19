<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	window.location.href="/classic_shop/main.do";
</script>

<!-- 
	안 한 거
		-. 이메일 인증 api
		-. 구글 로그인
		-. product search
		-. 첨부파일 기능 아예 안함 == 나중에 할 것
		-. 마이페이지-마이포스팅-'작성된 글이 없습니다' 설정
		-. qna 유효성 검사 및 자잘한 것들
			- 내 글만 확인하기
			- 비공개글 클릭 시 비밀번호 입력창
			- 비공개글 삭제 시 비밀번호 입력창
			- 글 수정 후 해당 글로 이동하기(넘버값 어떻게?)
			- 글 등록 후 해당 글로 이동하기(넘버값 어떻게?)
			- qna reply 기능 아예 안함
		-. CSS 총정리(로그인, 회원가입, 게시판)
			- 네비게이션 三
			- 반응형
			- 버튼 위치
			- 게시판 아이콘(카메라, +,-)
			- 테이블 효과 제거
			- 테이블 위치 및 여백, 출력 라인
			- 아코디언
			- 비밀번호 입력창 / 로그인 id/pw 찾기창
			- footer Map CSS
 -->
<!-- 
	한 거
		1. 세션 로그인
		2. 회원가입
		3. 게시판 유효성 검사/첨부파일/reply 제외한 기본적인 CRUD
		4. header/footer(회원/비회원 필터 & 지도 제외)
		5. banner cookie 구현
		7. footer map
			- 지도에 아이콘 띄우기(==> modal로 구현할 것)
		9. mypage, memUpdate == num으로 받아서 고치기
		10. 마이페이지 - 회원정보/QNA 리스트 출력
		11. 내가 쓴 글 - QNA 리스트 출력 페이징O
		12. QNA 글 등록 - 비공개 클릭 시 비번 인풋 활성화
		-. 글 등록 시 첨부파일 폼 구현
		9. 게시판 조회수 구현 -- 리스트 조회수는 되는데, detail 조회수는 안됨
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

 