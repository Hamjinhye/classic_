<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/public/css/admin/template.css' />">
</head>
<style>
	.main-alert-label{
		font-size: 10pt;
	}
	.main-container a{
		text-decoration: none;
		color: #000;
	}
	.main-plus-read small{
		color: #777;
	}
	.main-box-title, .main-plus-read{
		padding-bottom: 15px;
		border-bottom: 1px solid #000;
	}
	
</style>
<body>
	<div class="container-fluid main-container">
		<div class="row main-first-row">
			<div class="col-6 order-box">
				<label class="col-11 h4 main-box-title">주문 관리</label>
				<span class="main-plus-read" style="padding-left: 30px;"><a href="#"><small>더보기</small></a></span>
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
				<label class="col-9 h4 main-box-title">문의/답변 관리</label>
				<span class="main-plus-read" style="padding-left: 10px;"><a href="#"><small>더보기</small></a></span>
				<div class="table-responsive">
					<table class="table table-hover">
						<tr>
							<th><a href="#">상품 후기</a></th>
							<td class="text-right"><a href="#">0건</a></td>
						</tr>
						<tr>
							<th><a href="#">상품 문의</a></th>
							<td class="text-right"><a href="#">0/0건</a></td>
						</tr>
						<tr>
							<th><a href="#">환불 문의</a></th>
							<td class="text-right"><a href="#">0/0건</a></td>
						</tr>
						<tr>
							<th><a href="#">교환 문의</a></th>
							<td class="text-right"><a href="#">0/0건</a></td>
						</tr>
					</table>
				</div>
			</div><!-- comu box END -->
			<div class="col memo-box">
				<label class="col-8 h4 main-box-title">관리 메모</label>
				<select class="col-3 custom-select main-select-box">
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
								<td style="padding-left: 200px;">
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
				<label class="col-11 h4 main-box-title">쿠폰</label>
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
				<label class="col-11 h4 main-box-title">배너</label>
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
				<label class="col-11 h4 main-box-title">공지사항</label>
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
				<label class="col-11 h4 main-box-title">통계</label>
				<span class="main-plus-read"><a href="#"><small>더보기</small></a></span>
				<div class="main-chart-nav">
					<ul class="nav nav-pills" id="pills-tab" role="tablist">
						<li class="nav-item">
							<a class="nav-link active" id="pills-sales-tab" data-toggle="pill" href="#pills-sales" role="tab" aria-controls="pills-sales" aria-selected="true">
								매출
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" id="pills-order-tab" data-toggle="pill" href="#pills-order" role="tab" aria-controls="pills-order" aria-selected="false">
								주문
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" id="pills-newMem-tab" data-toggle="pill" href="#pills-newMem" role="tab" aria-controls="pills-newMem" aria-selected="false">
								신규회원
							</a>
						</li>
					</ul>
				</div>
				<div class="tab-content" id="pills-tabContent">
					<div class="tab-pane fade show active" id="pills-sales" role="tabpanel" aria-labelledby="pills-sales-tab">
						<div class="row">
							<div class="col-6 main-chart-table">
								<table class="table table-hover table-sm" style="text-align: center;">
									<thead>
										<tr>
											<th>날짜</th>
											<th>매출금액</th>
											<th>판매금액</th>
											<th>환불금액</th>
										</tr>
									</thead>
									<tbody class="main-sales-date">
										<tr>
											<td>01/21</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>01/22</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>01/23</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>01/24</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>01/25</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>01/26</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>01/27</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
									</tbody>
									<tbody class="main-sales-week">
										<tr>
											<td>7일 합계</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
									</tbody>
									<tbody class="main-sales-fifteen">
										<tr>
											<td>15일 합계</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
									</tbody>
									<tbody class="main-sales-month">
										<tr>
											<td>30일 합계</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="col-3 main-chart-graph">
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="pills-order" role="tabpanel" aria-labelledby="pills-order-tab">
						<div class="row">
							<div class="col-6 main-chart-table">
								<table class="table table-hover table-sm" style="text-align: center;">
									<thead>
										<tr>
											<th>날짜</th>
											<th>판매금액</th>
											<th>구매건수</th>
											<th>구매개수</th>
										</tr>
									</thead>
									<tbody class="main-sales-date">
										<tr>
											<td>01/21</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>01/22</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>01/23</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>01/24</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>01/25</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>01/26</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>01/27</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
									</tbody>
									<tbody class="main-sales-week">
										<tr>
											<td>7일 합계</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
									</tbody>
									<tbody class="main-sales-fifteen">
										<tr>
											<td>15일 합계</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
									</tbody>
									<tbody class="main-sales-month">
										<tr>
											<td>30일 합계</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="col-3 main-chart-graph">
							<!-- 통계 그래프  -->
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="pills-newMem" role="tabpanel" aria-labelledby="pills-newMem-tab">
						<div class="row">
							<div class="col-6 main-chart-table">
								<table class="table table-hover table-sm" style="text-align: center;">
									<thead>
										<tr>
											<th>날짜</th>
											<th>신규회원</th>
											<th>탈퇴회원</th>
											<th>전체회원</th>
										</tr>
									</thead>
									<tbody class="main-sales-date">
										<tr>
											<td>01/21</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>01/22</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>01/23</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>01/24</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>01/25</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>01/26</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
										<tr>
											<td>01/27</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
									</tbody>
									<tbody class="main-sales-week">
										<tr>
											<td>7일 합계</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
									</tbody>
									<tbody class="main-sales-fifteen">
										<tr>
											<td>15일 합계</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
									</tbody>
									<tbody class="main-sales-month">
										<tr>
											<td>30일 합계</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="col-3 main-chart-graph">
								통계 그래프1
							</div>
						</div>
					</div>
				</div>
			</div><!-- chart box END -->
			<div class="col calendar-box">
				<label class="h4 main-box-title">달력</label>
			</div><!-- calendar box END -->
		</div><!-- main third row END -->
	</div><!-- main container END -->
