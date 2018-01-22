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
	<div class= >
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
					<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
 						<li class="nav-item">
   							<a class="nav-link active text-dark" id="pills-cancel-tab" data-toggle="pill" href="#pills-cancel" role="tab" aria-controls="pills-cencel" aria-selected="true">취소</a>
  						</li>
  						<li class="nav-item">
							<a class="nav-link text-dark" id="pills-exchang-tab" data-toggle="pill" href="#pills-exchange" role="tab" aria-controls="pills-exchange" aria-selected="false">교환</a>
  						</li>
  						<li class="nav-item">
  							<a class="nav-link text-dark" id="pills-return-tab" data-toggle="pill" href="#pills-return" role="tab" aria-controls="pills-return" aria-selected="false">반품</a>
  						</li>
  						<li class="nav-item">
  							<a class="nav-link text-dark" id="pills-refund-tab" data-toggle="pill" href="#pills-refund" role="tab" aria-controls="pills-refund" aria-selected="false">환불</a>
  						</li>
  						
					</ul>
					<div class="tab-content" id="pills-tabContent">
						<div class="tab-pane fade show active" id="pills-cancel" role="tabpanel" aria-labelledby="pills-cancel-tab">
							<table class="table table-sm text-center">
								<thead>
									<tr class="table-active">
										<th>번호</th>
										<th>처리상테</th>
										<th>상품</th>
										<th>취소수량</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="4">취소 정보가 없습니다.</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="tab-pane fade" id="pills-exchange" role="tabpanel" aria-labelledby="pills-exchange-tab">
						<table class="table table-sm text-center">
								<thead>
									<tr class="table-active">
										<th>번호</th>
										<th>처리상테</th>
										<th>상품</th>
										<th>교환수량</th>
										<th>교환사유</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td colspan="5">교환 정보가 없습니다.</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="tab-pane fade" id="pills-return" role="tabpanel" aria-labelledby="pills-return-tab">
						<table class="table table-sm text-center">
								<thead>
									<tr class="table-active row">
										<th class="">번호</th>
										<th>처리상테</th>
										<th>상품</th>
										<th>반품사유</th>
										<th>환불계좌</th>
										<th>수정</th>
									</tr>
								</thead>
								<tbody>
									<tr class="row">
										<td>1</td>
										<td>반품처리중</td>
										<td>고객변심</td>
										<td class="row">
											<input type="text" readonly="readonly" value="하나" style="border: hidden;" id ="bankName">
											<input type="text" readonly="readonly" value="254616-54-5123" style="border: hidden;" id="">
											<input type="text" readonly="readonly" value="김미나" style="border: hidden;">
										</td>
										<td>12215213-2451-154</td>
										<td><a href="#" class="btn btn-light">수정</a></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="tab-pane fade" id="pills-refund" role="tabpanel" aria-labelledby="pills-refund-tab">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

