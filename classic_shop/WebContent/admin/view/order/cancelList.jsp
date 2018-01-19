<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<div class="common-right-title">
				<p class="h3">취소 리스트</p>
			</div>
			
		</div>
	</div>
</div>