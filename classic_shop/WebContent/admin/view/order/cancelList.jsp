<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style></style>
</head>
<body>

<div class="container-fluid common-body-container">
	<div class="row">
		<!-- 좌측 네비게이션 -->
		<nav class="col-sm-3 col-md-2 d-none d-sm-block bg-light sidebar common-left-nav">
			<p class="left-nav-outer-title">주문관리</p>
				<ul class="nav nav-pills flex-column left-nav-inner-title">
					<li class="nav-item"><a class="nav-link" href="#">주문통합리스트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">입금대기 리스트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">결제완료 리스트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">상품준비중 리스트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">배송중 리스트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">배송완료 리스트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">구매확정 리스트</a></li>					
				</ul>
			<p class="left-nav-outer-title">취소/교환/반품/환불 관리</p>
				<ul class="nav nav-pills flex-column left-nav-inner-title">
					<li class="nav-item"><a class="nav-link active" href="<c:url value='/admin/view/order/cancelList.jsp'/>">취소 리스트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">교환 리스트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">반품 리스트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">환불 리스트</a></li>				
				</ul>
		</nav>
		<!-- 우측 바디 -->
		<div class="col-sm-9 ml-sm-auto col-md-10 pt-3 common-right-body">
			<!-- 타이틀 -->
			<div class="common-right-title">
				<p class="h3">취소 리스트</p>
			</div>
			<!-- 검색 -->
			<div class="container">
				<div class="row">
				    <div class="col">Column</div>
				    <div class="col">Column</div>
				    <div class="w-100"></div>
				    <div class="col">Column</div>
				    <div class="col">Column</div>
				</div>
			</div>
			<div id="searchBtn">
				<button type="button" class="btn btn-secondary">검색</button>
			</div>
			
			<div>
				<table class="table">
				  <thead class="thead-dark">
				    <tr>
				      <th scope="col" width="5%"><input type="checkbox" id="allCheck"></th>
				      
				      <th scope="col">번호</th>
				      <th scope="col">주문번호</th>
				      <th scope="col">주문자</th>
				      <th scope="col">수취인</th>
				      <th scope="col">상품번호</th>
				      <th scope="col">상품명</th>
				      <th scope="col">수량</th>
				      <th scope="col">총 결제금액</th>
				      <th scope="col">처리상태</th>
				      <th scope="col">배송상태</th>
				      <th scope="col">취소신청일</th>
				      <th scope="col">취소완료일</th>
				      <th scope="col">취소수량</th>
				      <th scope="col">결제방법</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row"><input type="checkbox" id="allCheck"></th>
				      <td>row_num</td>
				      <td>order_num</td>
				      <td>mem_name</td>
				      <td>p.name</td>
				      <td>g.num</td>
				      <td>g.name</td>
				      <td>1</td>
				      <td>payment</td>
				      <td>order_state</td>
				      <td>deliv_state</td>
				      <td>cancel_start</td>
				      <td>cancel_end</td>
				      <td>1</td>
				      <td>pay_with</td>
				    </tr>
				    <tr>
				      <th scope="row"><input type="checkbox" id="allCheck"></th>
				      <td>row_num</td>
				      <td>order_num</td>
				      <td>mem_name</td>
				      <td>p.name</td>
				      <td>g.num</td>
				      <td>g.name</td>
				      <td>1</td>
				      <td>payment</td>
				      <td>order_state</td>
				      <td>deliv_state</td>
				      <td>cancel_start</td>
				      <td>cancel_end</td>
				      <td>1</td>
				      <td>pay_with</td>
				    </tr>
				    <tr>
				      <th scope="row"><input type="checkbox" id="allCheck"></th>
				      <td>row_num</td>
				      <td>order_num</td>
				      <td>mem_name</td>
				      <td>p.name</td>
				      <td>g.num</td>
				      <td>g.name</td>
				      <td>1</td>
				      <td>payment</td>
				      <td>order_state</td>
				      <td>deliv_state</td>
				      <td>cancel_start</td>
				      <td>cancel_end</td>
				      <td>1</td>
				      <td>pay_with</td>
				    </tr>
				  </tbody>
				</table>
			</div>
		</div>
	</div>
</div>