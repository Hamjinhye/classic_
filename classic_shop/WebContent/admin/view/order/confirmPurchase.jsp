<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</head>
<style>
/* .miniNav{
	padding: 0px;
	border-bottom: solid 1px #ccc;
	color: #ccc;	
}
 */
 .selectTab {
 	margin-top: 30px;
 }
 .selectTab p:first-child {
 	padding: 0px;
 }
 .selectTab table{
 	margin-bottom: 0px;
 }
 .selectTab th{
	background-color: #ccc;
	text-align: center;
	vertical-align: middle;
 }
 .selectTab th, .selectTab td{
 	vertical-align: middle;
 }
 .selectTabBtn {
 	width: 100%;
 	height: 100%;
 }
 .orderListSelectNav{
 	text-align: right;
 }
 .orderListContents div:last-child{
 	padding: 0px;
 }
 .batchProcessingDiv {
 	background-color: #ccc;
 }
 .batchProcessingDiv p {
	margin-top: 10px;
	margin-bottom: 0px;
	height: 40px;
	padding-left: 8px;
 }
 .batchProcessingDiv p button {
 	height: 30px;
 	vertical-align: middle;
 }
.orderListContents i{
	color: red;
 }
 .orderTab{
 	text-align: center;
 }
 .orderTabEnd{
 	height: 35px;
 	
 }
</style>
<body>
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
		</nav>
		<!-- 우측 바디 -->
		<div class="col-sm-9 ml-sm-auto col-md-10 pt-3 common-right-body">
			<!-- <div>
				<p class="h6 col-12 miniNav">주문 > 주문관리 > 입금 대기 리스트</p>
			</div> -->
			<div class="common-right-title">
			<p class="h3">구매확정 리스트</p>
			</div>
			<div class="selectTab">
				<p class="col-12 h5">주문검색</p>
				<table class="col-12 table table-default">
					<tr>
						<th>검색어</th>
						<td>
							<select>
								<option>통합검색</option>
								<option>주문번호</option>
								<option>주문자명</option>
								<option>주문자 휴대전화</option>
								<option>수령인</option>
								<option>입금자명</option>
								<option>송장번호</option>
							</select>
							<input type="text">
						</td>
						<td rowspan="2"><a class="btn btn-light selectTabBtn" href="#">확인</a></td>
					</tr>
					<tr>
						<th>기간검색</th>
						<td>
							<select>
								<option>통합검색</option>
								<option>주문일</option>
								<option>배송시작일</option>
								<option>배송종료일</option>
							</select>
							<input type="text" class="startDate">
							<i class="fa fa-calendar"></i> ~
							<input type="text" class="endDate">
							<i class="fa fa-calendar"></i>
						</td>
					</tr>
				</table>
			</div>
			<div class="orderListContents">
				<hr>
				<div class="orderListSelectNav">
					<select>
						<option>통합검색</option>
						<option>주문번호별↑</option>
						<option>주문번호별↓ </option>
						<option>주문자명↑</option>
						<option>주문자명↓</option>
						<option>금액별↑</option>
						<option>금액별↓</option>
						<option>수령자명별↑</option>
						<option>수령자명별↓</option>
						<option>결제일별↑</option>
						<option>결제일별↓</option>
					</select>
				</div>
				<div class="col-12">
					<div class="batchProcessingDiv">
						<p><i class="fa fa-check"></i>선택한 주문
							<select>
								<option>=주문상태=</option>
								<option>결제완료</option>
								<option>배송중</option>
								<option>구매확정</option>
							</select>
							<button type="button" class="btn btn-light">일괄처리</button>				
						</p>
					</div>
					<table class="col-12 table table-sm orderTab">
						<thead>
							<tr class="table-active">
								<th><input type="checkbox"></th><!-- value값 paid_num -->
								<th>번호</th><!-- row_num -->
								<th>주문일시</th>
								<th>주문번호</th>
								<th>주문자</th>
								<th>주문상품</th>
								<th>총금액</th>
								<th>주문상태</th>
								<th style="width:20%;">배송번호</th>
								<th>수령자</th>
								<th>결제방법</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkbox"></td>
								<td>1</td>
								<td>2017-11-24</td>
								<td><a href="#">123456</a></td>
								<td>공유</td>
								<td>가디건</td>
								<td>1000000</td>
								<td>입금대기</td>
								<td>231343242</td>
								<td>공유</td>
								<td>무통장입금</td>
							</tr>
							<tr class="table-active">
								<td colspan="11" class="orderTabEnd"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	//$("#startDate").datepicker(); 
	//$("#endDate").datepicker();
</script>