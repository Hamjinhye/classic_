<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/public/css/order.css' />">
</head>
<body>
<!-- div 추가 (orderDetail.css 삭제하고 order.css에 추가)-->
<div class="order_detail_body">
	<div id="mainTitle">    
		<h2 id="orderdetailTitle">ORDER DETAIL</h2>
	</div>
	<div id="orderNum">
		<h4><strong>주문번호 :${detail.order_num} </strong></h4>
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
				</tr>
				<tr>
					<td>${detail.order_money} 원</td>
					<td>${detail.coupon_sale} 원</td>
					<td>2,500원(임시)</td>
					<td>
						<c:if test="${detail.pay_with==0}">무통장입금</c:if>
						<c:if test="${detail.pay_with==1}">신용카드</c:if>
					</td>				
				</tr>
			</table>
		</div>
		<h4 id="totalPayment">총 결제금액: ${detail.payment} 원</h4>
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
					<th>송장번호</th>
				</tr>
				<tr>
					<td>
						<!-- 상품명 누르면 상품상세정보로 -->
						<label><a href="<c:url value='/product/detail.do?num=${detail.product_num}' />">상품명: ${detail.g_name}</a></label><br>
						<strong>[옵션]</strong> 색상: ${detail.g_color}, 사이즈: ${detail.g_size}
					</td>
					<td>1</td>
					<td>${detail.order_money} 원</td>
					<td>
						<c:if test="${detail.deliv_state==0}"><strong>배송준비</strong></c:if>
						<c:if test="${detail.deliv_state==1}"><strong>배송중</strong></c:if>
						<c:if test="${detail.deliv_state==2}"><strong>배송완료</strong></c:if>
						<c:if test="${detail.deliv_state==3}"><strong>구매확정</strong></c:if>
					</td>
					<td><strong>${detail.deliv_com}</strong> : ${detail.deliv_num}</td>
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
					<td>${detail.name}</td>
					<td>${detail.phone}</td>
					<td>${detail.zip_code}</td>
					<td>${detail.base_addr}</td>
					<td>${detail.detail_addr}</td>
					<td>${detail.memo}</td>
				</tr>
			</table>
		</div>
	</div>
</div>

