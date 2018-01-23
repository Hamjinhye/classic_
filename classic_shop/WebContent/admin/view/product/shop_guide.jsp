<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</head>
<body>
<!-- 전체 container 태그 이름 변경X-->
<div class="container-fluid common-body-container">
	<div class="row">
		<!-- 좌측 네비게이션 -->
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
		<!-- 우측 바디 -->
		<div class="col-sm-9 ml-sm-auto col-md-10 pt-3 common-right-body">
			<div class="common-right-title">
					<div class="row">
						<div class="col-md-10">
							<p class="h3">
								상품 상세 이용안내 관리
							</p>
						</div>
						<div class="col-md-2">
							<button class="btn btn-outline-danger">+ 이용안내 저장</button>
						</div>
					</div>
			</div>
			<div class="common-inner-body">
				<div class="container">
					<div class="row">
							<p class="h4">상품 상세 이용안내 내용 설정</p>
					</div>
					<div class="row container">
						<table class="table col-md-12">
							<tr class="row">
								<th class="table-active col-md-2">구분</th>
								<td class="col-md-10 container">
									<div class="form-check form-check-inline">
									  <input checked class="form-check-input" type="radio" name="inlineRadioOptions2" id="inlineRadio1" value="option1">
									  <label class="form-check-label" for="inlineRadio1">기본설정</label>
									</div>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="radio" name="inlineRadioOptions2" id="inlineRadio2" value="option2">
									  <label class="form-check-label" for="inlineRadio2">직접입력</label>
									</div>
								</td>
							</tr>
							<tr class="row">
								<th class="table-active col-md-2">배송 안내</th>
								<td class="col-md-10 container">
									<textarea class="col-md-12" rows="4" name="deliv_info"></textarea>
								</td>
							</tr>
							<tr class="row">
								<th class="table-active col-md-2">환불 안내</th>
								<td class="col-md-10 container">
									<textarea class="col-md-12" rows="4" name="refund_info"></textarea>
								</td>
							</tr>
							<tr class="row">
								<th class="table-active col-md-2">교환 안내</th>
								<td class="col-md-10 container">
									<textarea class="col-md-12" rows="4" name="trade_info"></textarea>
								</td>
							</tr>
							<tr class="row">
								<th class="table-active col-md-2">AS 안내</th>
								<td class="col-md-10 container">
									<textarea class="col-md-12" rows="4" name="as_info"></textarea>
								</td>
							</tr>
							<tr class="row border border-top-0 border-left-0 border-right-0">
								<th class="table-active col-md-2">탈퇴 안내</th>
								<td class="col-md-10 container">
									<textarea class="col-md-12" rows="4" name="unregi_info"></textarea>
								</td>
							</tr>
							
						</table>
					</div>
				</div>
				<h3>아무런 상의없이 제가 만들어놓은 폴더(패키지)와 같은 선상의 폴더(패키지) 만들지마세요</h3>
				<h3>상의되지 않은 폴더(패키지)는 무통보 삭제 후 머지하겠습니다.</h3>
				<ol>
					<li>이 형식 그대로 복사해가세요</li>
					<li><strong>좌측엔 네비, 우측엔 바디</strong> 만드시면 됩니다.</li>
					<li>부트스트랩 v4.0 사용 외에 유저와 달라진 라이브러리 없어요.</li>
					<li>관리자의 어떤 기능이든 주소 맵핑하실때 맨 앞에 /admin 붙이세요</li>
					<li>유저도 그렇고 관리자도 그렇고 모든 파일을 실행할 때 도메인에 찍히는 주소 형식은 ~.do 여야합니다.</li>
					<li>현재 보이는 border와 bg-color은 div 구분을 위해 임시로 넣은 설정, 나중에 지울 예정</li>
					<li>좌측 Nav는 처음부터 펼쳐진 상태로 구현, 클릭한 nav에 active 설정</li>
					<li>여백 설정 다 했으니 전체적인 여백은 따로 설정 안하셔도 됩니다. 문제가 되지 않는 한 하지마세요.</li>
				</ol>
			</div>
		</div>
	</div>
</div>
