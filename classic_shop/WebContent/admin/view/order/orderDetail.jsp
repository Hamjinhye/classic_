<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</head>
<style>
#orderNumInfo{
	border: solid 1px;
	padding-left: 8px;
}
#orderNumInfo p{
	margin: 3px;
}
#paymentTab {
	margin-top: 25px;
}
#paymentTab td div{	
	display: inline-block;
}
</style>
<body>
<!--  새 칭으로 open -->
<div class="container-fluid common-body-container">
	<div class="row">
		<div class="col-sm-9 ml-sm-auto col-md-12 pt-3 common-right-body">
			<div class="common-right-title">
				<p class="h3">주문상세정보</p>
			</div>
			<div class="common-inner-body">
				<div id="orderNumInfo">
					<p>주문번호: 123456 	주문일시 : 2017-11-14 HH:mm:ss</p>
				</div>
				<div>
					<table class="table table-sm text-center" id ="paymentTab">
						<tr class="table-active">
							<th>총 결제금액</th>
							<th>총 취소금액</th>
							<th>총 환불금액</th>
						</tr>
						<tr>
							<td>100000</td>
							<td>0</td>
							<td>0</td>
						</tr>
						<tr>
							<td class="clearfix">
								<div class="col-6 float-left">결제예정금액</div>
								<div class="col-6 float-left"> - </div>
							</td>
							<td class="clearfix">
								<div class="col-6 float-left">취소예정금액</div>
								<div class="col-6 float-left"> - </div>
							</td>
							<td class="clearfix">
								<div class="col-6 float-left">환불예정금액</div>
								<div class="col-6 float-left"> - </div>
							</td>
						</tr>
					</table>
					<p class="h4 border-bottom">상품정보 </p>
					<table class="table table-sm">
						<thead>
							<tr class="table-active">
								<th><input type="checkbox"></th>
								<th>번호</th>
								<th>상품주문번호</th>
								<th>주문상품</th>
								<th>수량</th>
								<th>상품금액</th>
								<th>총할인금액</th>
								<th>배송비</th>
								<th>총주문금액</th>
								<th>운송장번호</th>
								<th>주문상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>54523</td>
								<td>상품1</td>
								<td>1</td>
								<td>100000</td>
								<td>0</td>
								<td>0</td>
								<td>100000</td>
								<td>54612154</td>
								<td>구매확정</td>
							</tr>
							<tr class="table-active">
								<td colspan="11">
									<i class="fa fa-check text-danger"></i> 
									선택한 주문 
									<select>
										<option>=주문상태=</option>
										<option>결제완료</option>
										<option>상품준비중</option>
										<option>배송완료</option>
										<option>구매확정</option>
									</select>
									<button type="button" class="btn btn-light btn-sm">일괄처리</button>	
								</td>
							</tr>
						</tbody>
					</table>
					<p class="h4">취소/교환/반품/환불 정보</p>
					<ul class="nav nav-tabs nav-pills nav-justified">
					  <li class="nav-item">
					    <a class="nav-link active" href="#">취소</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="#">교환</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="#">반품</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link" href="#">환불</a>
					  </li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
