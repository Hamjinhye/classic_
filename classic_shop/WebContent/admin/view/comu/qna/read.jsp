<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</head>
<body>
<!-- 전체 container 태그 이름 변경X-->
<div class="container-fluid common-body-container">
	<div class="row">
		<!-- 좌측 네비게이션 -->
		<nav class="col-sm-3 col-md-2 d-none d-sm-block bg-light sidebar common-left-nav">
			<p class="left-nav-outer-title">NOTICE 관리</p>
				<ul class="nav nav-pills flex-column left-nav-inner-title">
					<li class="nav-item"><a class="nav-link" href="#">NOTICE</a></li>
					<li class="nav-item"><a class="nav-link" href="#">NOTICE 등록</a></li>
				</ul>
			<p class="left-nav-outer-title">QNA 관리</p>
				<ul class="nav nav-pills flex-column left-nav-inner-title">
					<li class="nav-item"><a class="nav-link" href="#">QNA</a></li>
					<li class="nav-item"><a class="nav-link" href="#">QNA REPLY 등록</a></li>
				</ul>
			<p class="left-nav-outer-title">FAQ 관리</p>
				<ul class="nav nav-pills flex-column left-nav-inner-title">
					<li class="nav-item"><a class="nav-link" href="#">FAQ</a></li>
				</ul>
		</nav>
		<!-- 우측 바디 -->
		<div class="col-sm-9 ml-sm-auto col-md-10 pt-3 common-right-body">
			<div class="row">
				<div class="col-8 common-right-title">
					<p class="h3">QNA</p>
				</div>
				<div class="col comu-register-btn">
					<button class="btn btn-outline-danger">목록</button>
				</div>
			</div>
			<div class="common-inner-body">
				<div class="table-responsive">
					<table class="table table-hover">
						<thead class="thead-dark">
							<tr>
								<th scope="col">SUBJECT</th>
								<td scope="col">제목</td>
								<th scope="col">NAME</th>
								<td scope="col">이름</td>
							</tr>
							<tr>
								<th scope="col">DATE</th>
								<td scope="col">날짜</td>
								<th scope="col">VIEW</th>
								<td scope="col">조회수</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="4">내용</td>
							</tr>
						</tbody>
						<tbody>
							<tr>
								<th>작성자</th>
								<td colspan="3">내용</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="table-responsive">
					<form>
						<table class="table">
							<tbody>
								<tr>
									<td colspan="4">
										<textarea class="form-control" rows="3" placeholder="댓글을 입력해주세요."></textarea>
									</td>
								</tr>
								<tr>
									<td>
										<button class="btn btn-outline-dark">등록</button>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
