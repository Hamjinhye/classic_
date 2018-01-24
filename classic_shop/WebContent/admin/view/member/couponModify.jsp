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
.coupon_table td, .coupon_table th{
	vertical-align: middle;
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
						<p style="float: left;" class="h3">쿠폰수정</p>
						<button style="float: right; margin: 1px 10px 3px 0px;" type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#exampleModal">
							저장
						</button>
						
						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">정보</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">저장하였습니다.</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
						<button style="float: right; margin: 1px 10px 3px 0px;" type="button" class="btn btn-outline-danger" onclick="location.href='<c:url value='/admin/view/member/couponList.jsp'/>'">목록</button>
					</div>
					<div style="margin-top: 20px; border-bottom: 1px solid #000;" class="member-right-title">
						<p class="h5">쿠폰수정 설정</p>
					</div>
					<div>
						<table style="border-bottom: 1px solid;" class="table coupon_table">
							<colgroup>
								<col style="width:15%;">
								<col style="width:85%;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" style="background: #eee">쿠폰유형</th>
									<td>
										<label class="form-check-label" for="exampleRadios1">
											<input class="form-check-input" type="radio" name="exampleRadios1" id="exampleRadios" value="option" checked>
											주문적용쿠폰
										</label>
										<label class="form-check-label" for="exampleRadios1">
											<input class="form-check-input" type="radio" name="exampleRadios1" id="exampleRadios" value="option">
											배송비할인쿠폰
										</label>
										
									</td>
								</tr>
								<tr>
									<th scope="row" style="background: #eee">발급방식</th>
									<td>
										<label class="form-check-label" for="exampleRadios1">
											<input class="form-check-input" type="radio" name="exampleRadios2" id="exampleRadios" value="option" checked>
											자동발급
										</label>
										<label class="form-check-label" for="exampleRadios1">
											<input class="form-check-input" type="radio" name="exampleRadios2" id="exampleRadios" value="option">
											회원발급
										</label>
									</td>
								</tr>
								<tr>
									<th scope="row" style="background: #eee">쿠폰명</th>
									<td>
										<input style="display: inline-block; width: auto;" type="text" class="form-control" id="inputCity">
									</td>
								</tr>
								<tr>
									<th scope="row" style="background: #eee">사용기간</th>
									<td>
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
								<tr>
									<th scope="row" style="background: #eee">혜택금액설정</th>
									<td>
									
										<input style="display: inline-block; width: auto;" type="text" class="form-control" id="inputCity">
										<select style="display: inline-block; width: auto;" id="inputState" class="form-control">
								        	<option selected>원</option>
								        	<option>%</option> <!-- 배송비 할인이면 혜택금액설정창이 비활성화 된다. -->
										</select>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div>
						<div style="margin-top: 20px; border-bottom: 1px solid #000;" class="member-right-title">
							<p class="h5">제한조건 설정</p>
						</div>
						<table style="border-bottom: 1px solid;" class="table coupon_table">
							<colgroup>
								<col style="width:15%;">
								<col style="width:85%;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" style="background: #eee">쿠폰등급</th>
									<td>
										<select style="display: inline-block; width: auto;" id="inputState" class="form-control">
									        	<option selected>=회원등급전체=</option>
									        	<option>일반회원Lv1</option>
									        	<option>일반회원Lv2</option>
									        	<option>일반회원Lv3</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row" style="background: #eee">총발급수량</th>
									<td>
										<input style="display: inline-block; width: auto;" type="text" class="form-control" id="inputCity">
									</td>
								</tr>
								<tr>
									<th scope="row" style="background: #eee">내용</th>
									<td>
										<textarea class="form-control" id="exampleFormControlTextarea1" rows="3">내용</textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>