<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/public/css/order.css' />">
</head>
<body>

<div class="order_detail_body">
	<div id="mainTitle">    
		<h2 id="orderdetailTitle">ORDER DETAIL</h2>
	</div>
	<div id="orderNum">
		<h4><strong>주문번호 : ${detail.order_num} </strong></h4>
	</div>
	<div id="paidInfo">
		<div class="panel panel-default">
			<div class="panel-heading">결제정보</div>
			<table class="table">
				<tr>
					<th>주문금액</th>
					<th>할인금액</th>
					<th>배송비</th>
					<th>결제수단</th>
					<th>총 예상 적립금</th>
				</tr>
				<tr>
					<td>${detail.order_money} 원</td>
					<td>${detail.order_money-detail.payment} 원</td>
					<td>
						<!-- 배송비가 10만원 이상일 때 무료, 아니면 2500원 -->
						<c:choose>
							<c:when test="${detail.order_money>99999}">
								무료
							</c:when>
							<c:otherwise>2,500원</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:if test="${detail.pay_with==0}">무통장입금</c:if>
						<c:if test="${detail.pay_with==1}">신용카드</c:if>
					</td>				
				</tr>
			</table>
		</div>
		<h4 id="totalPayment"><strong>총 결제금액:</strong> ${detail.payment}원 <small>(주문금액-할인금액+배송비)</small></h4>
	</div>
	<div id="productInfo">
		<div class="panel panel-default">
			<div class="panel-heading">주문상품</div>
			<table class="table">
				<tr>
					<th>상품정보</th>
					<th>수량</th>
					<th>주문금액</th>
					<th>배송상태</th>
					<th>예상 적립금</th>	
				</tr>
				<tr>
					<td>
						<label><a href="<c:url value='/product/detail.do?num=${detail.product_num}' />">상품명: ${detail.g_name}</a></label><br>
						<strong>[옵션]</strong> 색상: ${detail.g_color}, 사이즈: ${detail.g_size}
					</td>
					<td>1</td>
					<td>order_money</td>
					<td>delivery_state:0배송준비</td>
					<td>now_mileage</td>
				</tr>
				<tr>
					<td>
						<img alt="images" src=""  align="left" hspace="10">
						<label><a href="#">상품명:product_name</a></label><br><!-- 상품명 누르면 상품상세정보로 -->
						[옵션]색상:color_name, 사이즈:product_sizu
					</td>
					<td>3</td>
					<td>order_money</td>
					<td>delivery_state:0배송준비</td>
					<td>now_mileage</td>
				</tr>
			</table>
		</div>
	</div>
	<div id="addrInfo">
		<div class="panel panel-default">
			<div class="panel-heading">수령인정보</div>
			<table class="table">
				<tr>
					<th>이름</th>
					<th>전화번호</th>
					<th>우편번호</th>
					<th>기본주소</th>
					<th>상세주소</th>
					<th>배송메모</th>
				</tr>
				<tr>
					<td>name</td> <!--  input으로 받은 값?? -->
					<td>phonNumber</td>
					<td>zip_code</td>
					<td>base_addr</td>
					<td>detail_addr</td>
					<td>paid_memo</td>
				</tr>
			</table>
		</div>
	</div>
	
	
</div>

