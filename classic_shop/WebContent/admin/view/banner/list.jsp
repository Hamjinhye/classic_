<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</head>
<body>
<!-- 전체 container 태그 이름 변경X-->
<div class="container-fluid common-body-container">
	<div class="row">
		<!-- 좌측 네비게이션 -->
		<nav class="col-sm-3 col-md-2 d-none d-sm-block bg-light sidebar common-left-nav">
			<p class="left-nav-outer-title">팝업(광고)</p>
				<ul class="nav nav-pills flex-column left-nav-inner-title">
					<li class="nav-item"><a class="nav-link" href="#">팝업 관리</a></li>
					<li class="nav-item"><a class="nav-link" href="#">팝업 등록</a></li>
				</ul>
		</nav>
		<!-- 우측 바디 -->
		<div class="col-sm-9 ml-sm-auto col-md-10 pt-3 common-right-body">
			<div class="row">
				<div class="col-8 common-right-title">
					<p class="h3">팝업 관리</p>
				</div>
				<div class="col banner-register-btn">
					<button class="btn btn-outline-danger">등록</button>
				</div>
			</div>
			<div class="common-inner-body">
				<div class="banner-search-box" align="center" style="margin: 1%; border-bottom: 1px solid #000">
					<div class="btn-group banner-btn-term-box" role="group" style="padding-bottom: 15px; padding-left: 7px;">
						<button type="button" class="btn btn-outline-dark btn-sm">오늘</button>
						<button type="button" class="btn btn-outline-dark btn-sm">일주일</button>
						<button type="button" class="btn btn-outline-dark btn-sm">1개월</button>
						<button type="button" class="btn btn-outline-dark btn-sm">3개월</button>
						<button type="button" class="btn btn-outline-dark btn-sm">6개월</button>
					</div>
					<form class="offset-3 banner-search-input-box">
						<div class="form-group row">
							<label for="bannerSearchValue" class="col-2 col-form-label">검색어</label>
							<div class="col-5">
								<input type="text" id="bannerSearchValue" class="form-control" placeholder="배너 이름을 입력해주세요">
							</div>
						</div>
						<div class="form-group row">
							<label for="bannerSearchTerm" class="col-2 col-form-label">기간</label>
							<div class="col-6">
								<div class="row">
									<div class="col-5">
										<input type="text" id="bannerSearchTerm" class="form-control" placeholder="게시 시작일">
										<i class="fa fa-calendar"></i>
									</div>
									<div class="col-5">
										<input type="text" id="bannerSearchTerm" class="form-control" placeholder="게시 종료일">
										<i class="fa fa-calendar"></i>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<button type="button" class="offset-4 btn btn-outline-dark btn-lg">검색</button>
						</div>
					</form>
				</div>
				<div class="table-responsive banner-list-box">
					<table class="table table-hover table-sm">
						<thead class="thead-dark">
							<tr>
								<th scope="col"><input type="checkbox" class="form-control"></th>
								<th scope="col">No.</th>
								<th scope="col">TITLE</th>
								<th scope="col">START DATE</th>
								<th scope="col">END DATE</th>
								<th scope="col">STATE</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row"><input type="checkbox" class="form-control"></th>
								<td>번호</td>
								<td>제목</td>
								<td>시작일</td>
								<td>종료일</td>
								<td>상태</td>
							</tr>
						</tbody>
					</table>				
				</div>
				<div class="banner-remove-btn">
					<button class="btn btn-dark">전체 삭제</button>
					<button class="btn btn-outline-dark">선택 삭제</button>
				</div>
			</div>
		</div>
	</div>
</div>