<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/public/css/member.css' />">
<script src="<c:url value='/public/js/member.js'/>"></script>
</head>
<body>
<div class="member_body">
	<div class="container">
		<h2 id="memberModifyTitle">MEMBER SIGN UP</h2>
		<small style="color: red; float: right;">*필수</small>
		<!-- 회원정보 수정 폼  -->
		<form action="/mypage/modify.do" method="post" name="memModifyForm" class="form-horizontal modify_Form">
			<div class="form-group">
				<label class="col-sm-2 control-label">아이디</label>
				<div class="col-sm-6">
					<p class="form-control-static">${modifyMem.id}</p>
					<input type="hidden" name="num" value="${modifyMem.num}">
				</div>
			</div>
			<div class="form-group">
				<label for="InputPassword" class="col-sm-2 control-label">비밀번호<small style="color: red;">*</small></label>
				<div class="col-sm-3">
					<input type="password" class="form-control " id="inputPassword" placeholder="PASSWORD">
				</div>
			</div>
			<div class="form-group">
				<label for="InputPasswordCheck" class="col-sm-2 control-label">비밀번호 확인<small style="color: red;">*</small></label>
				<div class="col-sm-3">
					<input type="password" class="form-control " id="InputPasswordCheck" name="pw" placeholder="PASSWORD">
				</div>
					<span id="modifyPasswordRule">비밀번호는 영문, 숫자, 특수문자만 사용 가능합니다(4~12자).</span>
			</div>
			<div class="form-group">
				<label for="inputPhoneNumber" class="col-sm-2 control-label">연락처</label>
				<div class="col-sm-3">
					<input type="tel" class="form-control" id="inputPhoneNumber" placeholder="PHONE" name="phone">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">이메일</label>
				<div class="col-sm-6">
					<p class="form-control-static">${modifyMem.mail}</p>
				</div>
			</div>
			<div class="modify_btn_group">
				<button class="btn btn-default" type="button" onclick="memModify(this.form)">수정</button>
				<button class="btn btn-default" type="button" onclick="returnMypage(this.form)">취소</button>
			</div>		
		</form>
	</div>
</div>

