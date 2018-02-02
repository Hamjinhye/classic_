<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Google Login -->
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="785211237752-m7ipg6nvj45vdhjoc3i2di29u5g4m4qj.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="<c:url value='/public/js/naveridlogin_js_sdk_2.0.0.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/public/css/member.css' />">
<script src="<c:url value='/public/js/member.js'/>"></script>
</head>
<body>
<div class="member_body">
	<div class="container">
		<form name="loginForm" action="<c:url value='/login.do'/>" method="post">
			<div class="login_border">
				<h2>MEMBER LOGIN</h2>
				<div class="login_form">
					<input type="text" name="memId" placeholder="Member ID">
					<input type="password" name="memPw" placeholder="Password">
				</div>
				<p class="login_option">
					<span id="searchIdPwd"><small><a href="javascript:searchIdPwd()">ID/PW 찾기</a></small></span>
				</p>
				<div class="login_btn">
					<button id="loginBtn" class="btn btn-default" type="submit">LOGIN</button>
					<button id="joinBtn" class="btn btn-default" type="button">JOIN US</button>
				</div>
				<div class="login_outside">
					<button id="naverIdLogin_loginButton" class="btn btn-success" style=" padding: 0px 0px;"><img class="btn-img" style="width: 100%; height: 100%;" src="<c:url value='/public/img/naverLoginIcon_Green2.PNG'/>"></button>
				
					<!-- <button id="naver_login" class="btn btn-success">NAVER LOGIN</button> -->
					<button id="google_login" class="btn btn-danger" data-onsuccess="onSignIn"><span class="fa fa-google-plus">GOOGLE LOGIN</span></button>
					<!-- <button id="google_login" class="btn btn-danger" data-onsuccess="onSignIn"> -->
					<!-- <div class="g-signin2" data-onsuccess="onSignIn"></div> -->
					<!-- </button> -->
				</div>
			</div>
		</form>
	</div>
</div>
