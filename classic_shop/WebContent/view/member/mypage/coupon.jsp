<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" href="<c:url value='/public/css/member.css' />">
<script src="<c:url value='/public/js/member.js'/>"></script>
</head>
<body>   
<div class="member_body">
	${couponList }
	<div class="container">
		<div class="coupon_wrap">
			<h2 id="couponTitle">COUPON</h2>
			<table class="table coupon_table">
				<thead>
					<tr>
						<th class="col-sm-1">No.</th>
						<th class="col-sm-2">쿠폰명</th>
						<th class="col-sm-3">내용</th>
						<th class="col-sm-1">사용가능기간</th>
						<th class="col-sm-1">사용여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="coupon" items="${couponList}">
						<tr>
							<td>${coupon.c_num}</td>
							<td>${coupon.name}</td>
							<td>${coupon.content}</td>
							<td>${conpon.end_date}</td>
							<td>${coupon.c_state}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="row">
				<div class="col-xs-12">
					<div class="coupon_paging">
					  <ul class="pagination pagination-sm">
					    <li><a href="#"><span aria-hidden="true">«</span><span class="sr-only">Previous</span></a></li>
					    <li><a href="#">1</a></li>
					    <li><a href="#">2</a></li>
					    <li><a href="#">3</a></li>
					    <li><a href="#">4</a></li>
					    <li><a href="#">5</a></li>
					    <li><a href="#"><span aria-hidden="true">»</span><span class="sr-only">Next</span></a></li>
					  </ul>
					</div>
         		</div>
			</div>
		</div>
		<div class="couponForm_wrap">
			<div class="couponFormTitle">쿠폰 등록하기</div>
			<form class="couponForm">
				<div class="couponFormGroup">
					<div class="col-sm-9">
						<input type="text" class="form-control" id="inputCouponName" placeholder="쿠폰명을 입력해 주세요.">
					</div>
					<button class="btn btn-default" type="button">쿠폰 등록</button>
				</div>
			</form>
			<div class="couponFormTitle">쿠폰 등록하기2</div>
			<form class="couponForm">
				<div class="couponFormGroup">
					<select class="form-control">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
					<button class="btn btn-default" type="button">쿠폰 등록</button>
				</div>
			</form>
			<div class="couponGuide_wrap">
				<p>쿠폰 이용안내</p>
				<div class="couponGuide">
					<div>
						<ol>
							<li class="item1">쿠폰인증번호 등록하기에서 쇼핑몰에서 발행한 종이쿠폰/시리얼쿠폰/모바일쿠폰 등의 인증번호를 등록하시면 온라인쿠폰으로 발급되어 사용이 가능합니다.</li>
							<li class="item2">쿠폰은 주문 시 1회에 한해 적용되며, 1회 사용 시 재 사용이 불가능합니다.</li>
							<li class="item3">쿠폰은 적용 가능한 상품이 따로 적용되어 있는 경우 해당 상품 구매 시에만 사용이 가능합니다.</li>
							<li class="item4">특정한 종이쿠폰/시리얼쿠폰/모바일쿠폰의 경우 단 1회만 사용이 가능할 수 있습니다.</li>
						</ol>
					</div>
				</div>
			</div>
		</div>			
	</div>
</div>