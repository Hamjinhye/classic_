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
			<div class="common-right-title">
				<p class="h3">팝업 등록</p>
			</div>
			<div class="common-inner-body">
				<form>
					<div class="table-responsive">
						<table class="table table-hover">
							<tbody>
								<tr>
									<th>TITLE</th>
									<td><input type="text" class="form-control"></td>
								</tr>
								<tr>
									<th>DATE</th>
									<td>
										<div class="form-inline">
											<input type="text" class="form-control"><span>&nbsp;<i class="fa fa-calendar"></i></span>
											&nbsp;&nbsp;~&nbsp;&nbsp;
											<input type="text" class="form-control"><span>&nbsp;<i class="fa fa-calendar"></i></span>
										</div>
									</td>
								</tr>
								<tr>
									<th>CONTENT</th>
									<td><textarea rows="20" class="form-control"></textarea></td>
								</tr>
							</tbody>
							<tbody>
								<tr>
									<th>FILE</th>
									<td>
										<input type="file" style="display: inline-block;">
									</td>
								</tr>
							</tbody>
						</table>
						<div class="banner-btn-group">
							<button type="button" class="btn btn-outline-dark">등록</button>
							<button type="button" class="btn btn-dark">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
