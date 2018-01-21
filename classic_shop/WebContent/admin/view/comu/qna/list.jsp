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
					<button class="btn btn-outline-danger">댓글 미작성 모아보기</button>
				</div>
			</div>
			<div class="common-inner-body">
				<div class="table-responsive">
					<table class="table table-hover">
						<thead class="thead-dark">
							<tr>
								<th scope="col"><input type="checkbox" class="form-control"></th>
								<th scope="col">No.</th>
								<th scope="col">SUBJECT</th>
								<th scope="col">NAME</th>
								<th scope="col">DATE</th>
								<th scope="col">VIEW</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row"><input type="checkbox" class="form-control"></th>
								<td>번호</td>
								<td>제목</td>
								<td>이름</td>
								<td>날짜</td>
								<td>조회수</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- 페이징 -->
				<!-- 옵션창 -->
				<div class="form-row">
					<div class="form-group col-md-2">
						<select class="form-control">
							<option selected>글 정렬 선택</option>
							<option>최신순</option>
							<option>댓글 미작성</option>
						</select>
					</div>
					<div class="form-group col-md-2">
						<select class="form-control">
							<option selected>SEARCH</option>
							<option>SUBJECT</option>
							<option>NAME</option>
						</select>
					</div>
					<div class="form-group col-md-4">
						<input type="text" class="form-control">
					</div>
					<div class="form-group">
						<button type="button" class="btn btn-outline-dark">&#128269;</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
