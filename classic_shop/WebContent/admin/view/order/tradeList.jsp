<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
$(function(){
	$('.datepicker').datepicker({
	    uiLibrary: 'bootstrap4'
	});	
});

</script>
    
<style>

.searchCal{
	text-align: center;
}
.searchCal table{
	display: inline-block;
	margin: 0 auto;
	border: 1px solid gray;
	
}
.searchCal th,.searchCal td {
	padding: 10px 10px;
	text-align: left;
}
.searchTh {
	width: 100px;
	background: lightgray;
}
.searchTr{
	border-bottom: 1px dotted gray;
}
.searchSelect{
padding:2px 2px;
}

.searchBtn{
	text-align: center;
	padding-top: 10px;
}

.alignSelect{
	text-align: right;
	padding: 10px 0;
}
</style>

</head>

<body>

<div class="container-fluid common-body-container">
	<div class="row">
		<!-- 좌측 네비게이션 -->
		<nav class="col-sm-3 col-md-2 d-none d-sm-block bg-light sidebar common-left-nav">
			<p class="left-nav-outer-title"><strong>주문관리</strong></p>
				<ul class="nav nav-pills flex-column left-nav-inner-title">
					<li class="nav-item"><a class="nav-link" href="#">주문통합리스트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">입금대기 리스트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">결제완료 리스트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">상품준비중 리스트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">배송중 리스트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">배송완료 리스트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">구매확정 리스트</a></li>					
				</ul>
			<p class="left-nav-outer-title"><strong>취소/교환/반품/환불 관리</strong></p>
				<ul class="nav nav-pills flex-column left-nav-inner-title">
					<li class="nav-item"><a class="nav-link" href="#">취소 리스트</a></li>
					<li class="nav-item"><a class="nav-link active" href="#">교환 리스트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">반품 리스트</a></li>
					<li class="nav-item"><a class="nav-link" href="#">환불 리스트</a></li>				
				</ul>
		</nav>
		<!-- 우측 바디 -->
		<div class="col-sm-9 ml-sm-auto col-md-10 pt-3 common-right-body">
			<!-- 타이틀 -->
			<div class="common-right-title">
				<p class="h3">교환 리스트</p>
			</div>
			<!-- 검색 -->
			<div class="common-inner-body">
				
				<!-- DatePicker 날짜선택 -->
				<div class="searchCal">
					<table>
						<tr class="searchTr">
							<th class="searchTh">검색어</th>
							<td>
								<select class="searchSelect">
									<option>통합검색</option>
									<option>주문번호</option>
									<option>주문자명</option>
									<option>수령자명</option>
									<option>입금자명</option>
									<option>아이디</option>
									<option>상품코드</option>
									<option>상품명</option>
									
								</select>
								<input type="text" size="45">
							</td>
						</tr>
						<tr>
							<th class="searchTh">기간검색</th>
							<td>
								<select class="searchSelect">
									<option>교환완료일</option>
									<option>교환신청일</option>
									<option>주문일</option>
									<option>배송완료일</option>
									<option>송장등록일</option>
									
								</select>
								<input type="text" id="search_start_date" class="datepicker">
								<i class="fa fa-calendar"></i>
								 ~ 
								<input type="text" id="search_end_date" class="datepicker">
								<i class="fa fa-calendar"></i>
							</td>
						</tr>
					</table>
				</div>
				<div class="searchBtn">
					<button type="button" class="btn btn-outline-primary">검색</button>
				</div>
				
				<!-- 리스트 출력 -->
				<div class="alignSelect">
					<!-- 최신순 -->
					<select>
						<option>주문번호</option>
						<option>상품명</option>
						<option>상품코드</option>
						<option>주문자</option>
						<option>수령인</option>
					</select>
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
					      <th scope="col">교환상태</th>
					      <th scope="col">교환접수일</th>
					      <th scope="col">교환완료일</th>
					      <th scope="col">교환수량</th>
					      <th scope="col">사유</th>
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
					      <td>cancel_start</td>
					      <td>cancel_end</td>
					      <td>1</td>
					      <td>reason</td>
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
					      <td>cancel_start</td>
					      <td>cancel_end</td>
					      <td>1</td>
					      <td>reason</td>
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
					      <td>cancel_start</td>
					      <td>cancel_end</td>
					      <td>1</td>
					      <td>reason</td>
					      <td>pay_with</td>
					    </tr>
					  </tbody>
					</table>
					<button type="button" class="btn btn-outline-primary">선택한 주문 삭제</button>
				</div>	
			</div>

		</div>
	</div>
</div>