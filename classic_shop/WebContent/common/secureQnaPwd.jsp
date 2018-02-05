<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/public/css/comu.css' />">
<script src="<c:url value='/public/js/comu.js'/>"></script>
</head>
<body>
	<div class="container">
		<form name="qnaSecurePw" action="/community/qna/secure.do" method="post">
			<div class="pwd_popup_form">
				<h3 align="center">QNA - 비밀번호 확인</h3>
					<div class="pwd_input">
						<input type="hidden" name="qnaNum" id="qnaNum" value="${qna.num}">
						<input type="password" name="qnaPwd" placeholder="비밀번호를 입력해주세요" value="${qna.pwd}">
					</div>
					<div class="pwd_btn">
						<button type="submit" onclick="qnaSecureCheck(this.form)">확인</button>
						<button type="reset" onclick="window.close();">취소</button>
					</div>
			</div>
		</form>
	</div>
	
<script>
	
</script>

