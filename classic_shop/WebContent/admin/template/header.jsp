<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩4 설정 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href='<c:url value="/public/bootstrap-4.0.0/css/bootstrap.min.css"/>' >
<link rel="stylesheet" href='<c:url value="/public/js/jquery-ui/jquery-ui.min.css"/>' >
<!-- awesome Icon -->
<link rel="stylesheet" href='<c:url value="/public/css/font-awesome-4.7.0/css/font-awesome.min.css"/>' >
<!-- 개인 lib -->
<link rel="stylesheet" href="<c:url value='/public/css/admin/template.css' />">
<!-- jQuery-ui 설정 -->
<script src='<c:url value="/public/js/jquery-ui/jquery-ui.min.js"/>' ></script>
<!--jQuery 설정 -->
<script src='<c:url value="/public/js/jquery/jquery-3.2.1.min.js"/>' ></script>
<script src='<c:url value="/public/bootstrap-4.0.0/js/bootstrap.min.js"/>' ></script>
<title>CLASSIC ADMIN</title>

<div class=" fixed-top">
	<nav class="navbar navbar-expand navbar-dark bg-dark">
		<h2><a href="#">CLASSIC ADMIN</a></h2>
	</nav>
	<nav class="navbar navbar-expand navbar-dark bg-dark">
	<!--  관리자 기능 관련 메뉴  -->
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="<c:url value='/admin/view/member/basic.jsp'/>">기본 설정</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value='/admin/view/member/memberAdmin.jsp'/>">회원</a></li>
				<li class="nav-item"><a class="nav-link" href="#">상품</a></li>
				<li class="nav-item"><a class="nav-link" href="#">주문</a></li>
				<li class="nav-item"><a class="nav-link" href="#">게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="#">배너</a></li>
				<li class="nav-item"><a class="nav-link" href="#">통계</a></li>
			</ul>
		</div>
	<!-- 관리자 관련 메뉴 -->
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav ml-auto">
				<!-- 관리자 로그인 -->
				<c:choose>
					<c:when test="${loginMem ne null}">
						<li class="nav-item"><a class="nav-link" href="#">${loginMem.id}님 접속(관리자)</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value='/logout.do'/>">LOGOUT</a></li>
						<li class="nav-item"><button type="button" class="btn btn-outline-light btn-sm" onclick="location.href='/classic_shop/main.do'">MY SHOP</button></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item">
							<form>
								<div class="form-row align-items-right">
									<div class="col-sm-4 my-1">
										<input type="text" class="form-control" name="memId" placeholder="ID">
									</div>
									<div class="col-sm-4 my-1">
										<input type="password" class="form-control" name="memPw" placeholder="PASSWORD">
									</div>
									<div class="col-sm-2 my-1">
										<button type="submit" class="btn btn-outline-light">LOGIN</button>
									</div>
								</div>
							</form>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</nav>
</div>


