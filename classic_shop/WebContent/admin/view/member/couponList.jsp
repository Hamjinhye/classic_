<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>
.fa-calendar:hover{
	color: black;

}
.coupon_table input[type="radio"]{
position: static;
    margin: 0 5px 0 0;
}

</style>

</head>
<body>

<!-- 해야될 것
리스트에서 등급 select 기능 lv1 lv2 lv3
등급 수정한 게 없을 때 수정버튼 disable
등급 수정한 게 있을 때 수정버튼 활성화
체크박스 위치.. 

 -->


<!-- 전체 container 태그 이름 변경X-->
<div class="container-fluid common-body-container">
	<div class="row">
		<!-- 좌측 네비게이션 -->
		<nav class="col-sm-3 col-md-2 d-none d-sm-block bg-light sidebar common-left-nav">
			<p class="left-nav-outer-title">회원관리</p>
				<ul class="nav nav-pills flex-column left-nav-inner-title">
					<li class="nav-item"><a class="nav-link active" href="<c:url value='/admin/view/member/memberList.jsp'/>">회원(운영자)리스트</a></li>
				</ul>
			<p class="left-nav-outer-title">쿠폰 정책</p>
				<ul class="nav nav-pills flex-column left-nav-inner-title">
					<li class="nav-item"><a class="nav-link" href="<c:url value='/admin/view/member/couponInsert.jsp'/>">쿠폰 등록</a></li>
					<li class="nav-item"><a class="nav-link" href="<c:url value='/admin/view/member/couponList.jsp'/>">쿠폰리스트</a></li>
					<li class="nav-item"><a class="nav-link" href="<c:url value='/admin/view/member/couponModify.jsp'/>">쿠폰수정</a></li>
				</ul>
		</nav>
		<!-- 우측 바디 -->
		<div class="col-sm-9 ml-sm-auto col-md-10 pt-3 common-right-body">
			<div class="common-inner-body">
				<form>
					<div style="overflow: hidden;" class="common-right-title">
						<p style="float: left;" class="h3">쿠폰리스트</p>
						<button style="float: right; margin: 1px 10px 3px 0px;" type="button" class="btn btn-outline-danger" onclick="location.href='<c:url value='/admin/view/member/couponInsert.jsp'/>'">쿠폰 등록</button>
					</div>
					<div style="margin-top: 20px; border-bottom: 1px solid #000;" class="member-right-title">
						<p class="h5">쿠폰검색</p>
					</div>
					<div>
						<table style="border-bottom: 1px solid;" class="table coupon_table">
							<colgroup>
								<col style="width:15%;">
								<col style="width:35%;">
								<col style="width:15%;">
								<col style="width:35%;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" style="background: #eee">검색어</th>
									<td colspan="3">
										<div>
										<input style="display: inline-block; width: auto;" type="text" class="form-control" id="inputCity">
										   <i class="fa fa-exclamation-circle" aria-hidden="true"></i>
										    <small id="passwordHelpInline" class="text-muted">
										     	쿠폰 이름을 입력하시면 상세한 검색이 가능합니다.
										    </small>
										<button style="float: right;" type="button" class="btn btn-secondary">검색</button>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row" style="background: #eee">쿠폰유형</th>
									<td>
										<label class="form-check-label" for="exampleRadios1">
											<input class="form-check-input" type="radio" name="exampleRadios1" id="exampleRadios" value="option" checked>
											전체
										</label>
										<label class="form-check-label" for="exampleRadios1">
											<input class="form-check-input" type="radio" name="exampleRadios1" id="exampleRadios" value="option">
											주문적용
										</label>
										<label class="form-check-label" for="exampleRadios1">
											<input class="form-check-input" type="radio" name="exampleRadios1" id="exampleRadios" value="option">
											배송비할인
										</label>
									</td>
									<th scope="row" style="background: #eee">발급방식</th>							
									<td>
										<label class="form-check-label" for="exampleRadios1">
											<input class="form-check-input" type="radio" name="exampleRadios2" id="exampleRadios" value="option" checked>
											전체
										</label>
										<label class="form-check-label" for="exampleRadios1">
											<input class="form-check-input" type="radio" name="exampleRadios2" id="exampleRadios" value="option">
											자동발급
										</label>
										<label class="form-check-label" for="exampleRadios1">
											<input class="form-check-input" type="radio" name="exampleRadios2" id="exampleRadios" value="option">
											회원발급
										</label>
									</td>
									
								</tr>
								<tr>
									<th scope="row" style="background: #eee">사용 가능 기간</th>
									<td colspan="3">
										<input style="display: inline-block; width: auto;" type="text" class="form-control" id="inputCity">
										<span style="display: inline-block; width: auto; cursor: pointer; color: gray;">
											<i style="font-size: 30px;" class="fa fa-calendar" aria-hidden="true"></i>
										</span>
										<div style="display: inline-block;">
											<h3>~</h3>
										</div>
										<input style="display: inline-block; width: auto;" type="text" class="form-control" id="inputCity">
										<span style="display: inline-block; width: auto; cursor: pointer; color: gray;">
											<i style="font-size: 30px;"class="fa fa-calendar" aria-hidden="true"></i>
										</span>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
				<div>
					<table class="table">
						<tbody>
							<tr>
								<th scope="col"><input style="margin: 0; vertical-align: middle;" class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1"></th>
								<th scope="col">번호</th>
								<th scope="col">쿠폰명</th>
								<th scope="col">사용기간</th>
								<th scope="col">내용</th>
								<th scope="col">쿠폰등급</th>
								<th scope="col">발급현황</th>
								<th scope="col">쿠폰유형</th>
								<th scope="col">발급방식</th>
								<th scope="col">수정</th>
								
							</tr>
						</tbody>
						<tbody>
							<tr>
								<td><input style="margin: 0; vertical-align: middle;"class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1"></td>
								<td>1</td>
								<td>배송비할인 쿠폰</td>
								<td>2017-01-28~2017-03-29</td>
								<td>신규회원 웰컴쿠폰</td>
								<td>전체</td>
								<td>∞</td>
								<td>배송비할인</td>
								<td>회원다운로드</td>
								<td><button type="button" class="btn btn-secondary btn-sm" onclick="location.href='<c:url value='/admin/view/member/couponModify.jsp'/>'">수정</button></td>
							</tr>
						</tbody>
					</table>
					<div>
						<button type="button" class="btn btn-secondary btn-sm">선택 삭제</button>
					</div>
				</div>
				<div>
					<ul class="pagination justify-content-center">
						<li class="page-item disabled">
							<a class="page-link" href="#" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
								<span class="sr-only">Previous</span>
							</a>
						</li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item">
							<a class="page-link" href="#" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
								<span class="sr-only">Next</span>
							</a>
						</li>
					</ul>						
				</div>	
			</div>
		</div>
	</div>
</div>