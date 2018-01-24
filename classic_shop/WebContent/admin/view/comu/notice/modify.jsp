<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<c:url value='/public/css/comu.css' />">
<script src="<c:url value='/public/js/comu.js'/>"></script>

<div class="container-fluid common-body-container">
	<div class="row">
	<nav class="col-sm-3 col-md-2 d-none d-sm-block bg-light sidebar common-left-nav">
			<p class="left-nav-outer-title">네비게이션 항목 title1</p>
				<ul class="nav nav-pills flex-column left-nav-inner-title">
					<li class="nav-item"><a class="nav-link active" href="#">세부 항목 title1</a></li>
					<li class="nav-item"><a class="nav-link" href="#">세부 항목 title2</a></li>
					<li class="nav-item"><a class="nav-link" href="#">세부 항목 title3</a></li>
				</ul>
			<p class="left-nav-outer-title">네비게이션 항목 title2</p>
				<ul class="nav nav-pills flex-column left-nav-inner-title">
					<li class="nav-item"><a class="nav-link" href="#">세부 항목 title1</a></li>
					<li class="nav-item"><a class="nav-link" href="#">세부 항목 title2</a></li>
					<li class="nav-item"><a class="nav-link" href="#">세부 항목 title3</a></li>
				</ul>
			<p class="left-nav-outer-title">네비게이션 항목 title3</p>
				<ul class="nav nav-pills flex-column left-nav-inner-title">
					<li class="nav-item"><a class="nav-link" href="#">세부 항목 title1</a></li>
					<li class="nav-item"><a class="nav-link" href="#">세부 항목 title2</a></li>
					<li class="nav-item"><a class="nav-link" href="#">세부 항목 title3</a></li>
				</ul>
		</nav>
		
		<div class="col-sm-9 ml-sm-auto col-md-10 pt-3 common-right-body">
			<div class="common-right-title">
				<p class="h3">NOTICE</p>
			</div>
			<div class="common-inner-body">
			
				<!--글 등록 -->
		<form name="noticeRegisterForm method=post action="">
			<!-- SUBJECT 선택 -->
			<div class="form-group">
				<label id="subjectField">TITLE</label>
				<td><input name="title" size="220"></td>
			</div>
			<!--글 내용 -->
			<div class="form-group">
				<textarea class="form-control" rows="20" name="noticeContents"></textarea>
			</div>
			<!--첨부파일 및 옵션 -->
			<div class="notice_option">
			    <label for="noticeFile">File Upload</label>
			    <input type="file" class="form-control-file" id="noticeFile">
			  </div>
			<div class="notice_option">
				<label class="col-xs-2">공개</label>
					<div class="checkbox">
						<input type="radio" name="secure" id="noticeOpen" value="0" checked> 공개
						<input type="radio" name="secure" id="noticeSecure" value="1"> 비공개
					</div>
			</div>
			<div class="notice_option">
				<label class="col-xs-2">Password</label>
				<input type="password" name="pwd" placeholder="비밀번호 설정" disabled>
			</div>
			<!--  버튼 -->
			<div class="notice_btn_group">
				<a class="btn btn-dark" href="view.jsp" role="button">수정</a>
				<a class="btn btn-dark" href="list.jsp" role="button">삭제</a>
			</div>
			
			</div>
		</div>
	</div>
</div>

