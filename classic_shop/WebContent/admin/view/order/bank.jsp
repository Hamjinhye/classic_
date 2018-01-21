<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</head>
<style>
.bankInsert{
	margin-top: 30px;
}
.bankInsertTab th {
	background-color: #ccc;
	text-align: center;
	vertical-align: middle;
	width : 20%;
}
.bankInsertTab td {
	width: 60%;
}
.orderUpdateTab tbody{
	border-top:hidden;
}
</style>
<body>
<!-- 전체 container 태그 이름 변경X-->
<div class="container-fluid common-body-container">
	<div class="row">
		<!-- 좌측 네비게이션 -->
		<nav class="col-sm-3 col-md-2 d-none d-sm-block bg-light sidebar common-left-nav">
			<p class="left-nav-outer-title">주문관리</p>
				<ul class="nav nav-pills flex-column left-nav-inner-title">
					<li class="nav-item"><a class="nav-link" href="#">주문통합리스트</a></li>
					<li class="nav-item"><a class="nav-link" href='<c:url value = "/admin/view/order/depositWaiting.jsp"/>'>입금대기 리스트</a></li>
					<li class="nav-item"><a class="nav-link" href='<c:url value = "/admin/view/order/completePayment.jsp"/>'>결제완료 리스트</a></li>
					<li class="nav-item"><a class="nav-link" href='<c:url value = "/admin/view/order/preparingProduct.jsp"/>'>상품준비중 리스트</a></li>
					<li class="nav-item"><a class="nav-link" href='<c:url value = "/admin/view/order/shipping.jsp"/>'>배송중 리스트</a></li>
					<li class="nav-item"><a class="nav-link" href='<c:url value = "/admin/view/order/delivCompleted.jsp"/>'>배송완료 리스트</a></li>
					<li class="nav-item"><a class="nav-link" href='<c:url value = "/admin/view/order/confirmPurchase.jsp"/>'>구매확정 리스트</a></li>					
				</ul>
			<p class="left-nav-outer-title">취소/교환/반품/환불 관리</p>
				<ul class="nav nav-pills flex-column left-nav-inner-title">
					<li class="nav-item"><a class="nav-link" href="<c:url value='/admin/view/order/cancelList.jsp'/>">취소 리스트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">교환 리스트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">반품 리스트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">환불 리스트</a></li>				
				</ul>
			<p class="left-nav-outer-title">무통장 입금 관리</p>
				<ul class="nav nav-pills flex-column left-nav-inner-title">
					<li class="nav-item"><a class="nav-link" href="#">무통장 입금 관리</a></li>
				</ul>
		</nav>
		<!-- 우측 바디 -->
		<div class="col-sm-9 ml-sm-auto col-md-10 pt-3 common-right-body">
			<div class="common-right-title">
				<p class="h3">무통장 입금은행 관리</p>
			</div>
			<div class="common-inner-body">
				<div class="bankInsert">
					<p class="h5">무통장 입금은행 등록</p>
				</div>
				<div>
					<table class="col-12 table table-default bankInsertTab">
						<tr>
							<th class="table-active">등록은행명</th>
							<td ><input type="text"></td>
							<td rowspan="3" class="text-center align-middle"><button type="button" class="btn btn-light">확인</button></td>
						</tr>
						<tr>
							<th >계좌번호</th>
							<td ><input type="text"></td>
						</tr>
						<tr>
							<th >에금주</th>
							<td ><input type="text"></td>
						</tr>
					</table>
					<hr>
					<table class="col-12 table table-sm">
						<thead>
							<tr class="table-active text-center">
								<th><input type="checkbox"></th>
								<th>번호</th>
								<th>은행명</th>
								<th>계좌번호</th>
								<th>예금주</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody>
							<tr class="text-center">
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>국민</td>
								<td>139018493209</td>
								<td>(주)클래식</td>
								<td>
									<button type="button" class="btn btn-light" data-toggle="modal" data-target="#orderUpdateModal">수정</button>
									<!-- modal -->
									<div class="modal fade" id="orderUpdateModal" tabindex="-1" role="dialog" aria-labelledby="orderUpdateModalLabel" aria-hidden="true">
  										<div class="modal-dialog" role="document">
    										<div class="modal-content">
      											<div class="modal-header">
        											<h5 class="modal-title" id="orderUpdateModalLabel">무통장입금은행 수정</h5>
       												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          												<span aria-hidden="true">&times;</span>
        											</button>
     											 </div>
      											<div class="modal-body">
       												<table class="table table-default" id="orderUpdateTab">
       													<tr>
       														<th>등록은행명</th>
       														<td><input type="text"></td>
       													</tr>
       													<tr>
       														<th>계좌번호</th>
       														<td><input type="text"></td>
       													</tr>
       													<tr>
       														<th>예금주</th>
       														<td><input type="text"></td>
       													</tr>
       												</table>
      											</div>
      											<div class="modal-footer">
        											<button type="button" class="btn btn-light">등록</button>
      											</div>
    										</div>	
  										</div>
									</div>	
								</td>
							</tr>
							<tr>
								<td colspan="6"><button type="button" class="btn btn-light">선택삭제</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
