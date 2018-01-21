<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/public/css/admin/template.css' />">
</head>
<body>
	<div class="container-fluid main-container">
		<div class="row main-first-row">
			<div class="col-6 order-box">
				<label class="main-box-title">주문 관리</label>
				<div class="row order-card-box">
					<div class="card">
						<div class="card-body">
							<p class="card-title text-left">입금 대기</p>
							<p class="card-text text-right">0</p>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<p class="card-title text-left">결제 완료</p>
							<p class="card-text text-right">0</p>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<p class="card-title text-left">상품 준비</p>
							<p class="card-text text-right">0</p>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<p class="card-title text-left">배송 중</p>
							<p class="card-text text-right">0</p>
						</div>
					</div>
				</div><!-- order card box END -->
				<div class="row order-card-box">
					<div class="card">
						<div class="card-body">
							<p class="card-title text-left">배송 완료</p>
							<p class="card-text text-right">0</p>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<p class="card-title text-left">구매 확정</p>
							<p class="card-text text-right">0</p>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<p class="card-title text-left">환불 접수</p>
							<p class="card-text text-right">0</p>
						</div>
					</div>
					<div class="card">
						<div class="card-body">
							<p class="card-title text-left">교환 접수</p>
							<p class="card-text text-right">0</p>
						</div>
					</div>
				</div><!-- order card box END -->
			</div><!-- order box END -->
			<div class="col-2 comu-box">
				<label class="main-box-title">문의/답변 관리</label>
				<div class="table-responsive">
					<table class="table table-hover">
						<tr>
							<th>상품 후기</th>
							<td class="text-right">0건</td>
						</tr>
						<tr>
							<th>상품 문의</th>
							<td class="text-right">0/0건</td>
						</tr>
						<tr>
							<th>환불 문의</th>
							<td class="text-right">0/0건</td>
						</tr>
						<tr>
							<th>교환 문의</th>
							<td class="text-right">0/0건</td>
						</tr>
					</table>
				</div>
			</div><!-- comu box END -->
			<div class="col memo-box">
				<label class="main-box-title">관리 메모</label>
				<select>
					<option>공유 메모</option>
					<option>개인 메모</option>
				</select>
				<div class="table-responsive">
					<form>
						<table class="table">
							<tr>
								<td colspan="2">
									<textarea class="form-control" rows="5" placeholder="메모를 작성해주세요"></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<small>최종 수정 : YYYY/MM/DD HH:mm:ss</small>
								</td>
								<td>
									<button type="button" class="btn btn-outline-danger btn-sm">저장</button>
									<button type="button" class="btn btn-outline-dark btn-sm">전체 삭제</button>
								</td>
							</tr>
						</table>
					</form><!-- memo form END -->
				</div>
			</div><!-- memo box END -->
		</div><!-- main first row END -->
		<div class="row main-second-row">
			<div class="col coupon-box">
				<label class="main-box-title">쿠폰</label>
				<span class="main-plus-read"><a href="#"><small>더보기</small></a></span>
				<div align="right" class="main-alert-label">
					<label>진행 중인 쿠폰</label>
					<span>0개</span>
				</div>
				<div class="table-responsive">
					<table class="table table-hover table-sm">
						<tr>
							<td><small>쿠폰</small></td>
							<td><small>종료일</small></td>
						</tr>
						<tr>
							<td><small>쿠폰</small></td>
							<td><small>종료일</small></td>
						</tr>
						<tr>
							<td><small>쿠폰</small></td>
							<td><small>종료일</small></td>
						</tr>
					</table>
				</div>
			</div><!-- coupon box END -->
			<div class="col banner-box">
				<label class="main-box-title">배너</label>
				<span class="main-plus-read"><a href="#"><small>더보기</small></a></span>
				<div align="right" class="main-alert-label">
					<label>진행 중인 이벤트</label>
					<span>0건</span>
				</div>
				<div class="table-responsive">
					<table class="table table-hover table-sm">
						<tr>
							<td><small>배너</small></td>
							<td><small>종료일</small></td>
						</tr>
						<tr>
							<td><small>배너</small></td>
							<td><small>종료일</small></td>
						</tr>
					</table>
				</div>
			</div><!-- banner box END -->
			<div class="col notice-box">
				<label class="main-box-title">공지사항</label>
				<span class="main-plus-read"><a href="#"><small>더보기</small></a></span>
				<div class="table-responsive">
					<table class="table table-hover table-sm">
						<tr>
							<td><small>제목</small></td>
							<td><small>날짜</small></td>
						</tr>
						<tr>
							<td><small>제목</small></td>
							<td><small>날짜</small></td>
						</tr>
						<tr>
							<td><small>제목</small></td>
							<td><small>날짜</small></td>
						</tr>
						<tr>
							<td><small>제목</small></td>
							<td><small>날짜</small></td>
						</tr>
						<tr>
							<td><small>제목</small></td>
							<td><small>날짜</small></td>
						</tr>
					</table>
				</div>
			</div><!-- notice box END -->
		</div><!-- main second row END -->
		<div class="row main-third-row">
			<div class="col-8 chart-box">
				<label class="main-box-title">통계</label>
			</div><!-- chart box END -->
			<div class="col calendar-box">
				<label class="main-box-title">달력</label>
			</div><!-- calendar box END -->
		</div><!-- main third row END -->
	</div><!-- main container END -->
