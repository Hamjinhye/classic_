<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>
.fa-calendar:hover{
	color: black;

}
/* .memberList{
	vertical-origin: middle;
	background: black;
} */



</style>

</head>
<body>

<!-- 해야될 것
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
				<form name="memberList">
					<div class="common-right-title">
						<p class="h3">회원리스트</p>
					</div>
					<div style="margin-top: 20px; border-bottom: 1px solid #000;" class="member-right-title">
						<p class="h5">회원검색</p>
					</div>
					<div>
						<table style="border-bottom: 1px solid;" class="table">
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
											<select style="display: inline-block; width: auto;" id="inputState" class="form-control">
									        	<option selected>=통합검색=</option>
									        	<option>아이디</option>
									        	<option>이메일</option>
									        	<option>휴대폰번호</option>
											</select>
										
										<input style="display: inline-block; width: auto;" type="text" class="form-control" id="inputCity">
										<button style="float: right;" type="button" class="btn btn-secondary">검색</button>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row" style="background: #eee">회원등급</th>
									<td>
											<select style=" width: auto;" id="inputState" class="form-control">
									        	<option selected>일반회원전체</option>
									        	<option>일반회원Lv1</option>
									        	<option>일반회원Lv2</option>
									        	<option>일반회원Lv3</option>
									        	<option>탈퇴회원전체</option>
									        	<option>관리자</option>
											</select>
									</td>
									<th scope="row" style="background: #eee">회원가입일</th>
									<td>
										<input style="display: inline-block; width: auto;" type="text" class="form-control col-sm-4" id="inputCity">
										<span style="display: inline-block; width: auto; cursor: pointer; color: gray;">
											<i style="font-size: 30px;" class="fa fa-calendar" aria-hidden="true"></i>
										</span>
										<div style="display: inline-block;">
											<h3>~</h3>
										</div>
										<input style="display: inline-block; width: auto;" type="text" class="form-control col-sm-4" id="inputCity">
										<span style="display: inline-block; width: auto; cursor: pointer; color: gray;">
											<i style="font-size: 30px;"class="fa fa-calendar" aria-hidden="true"></i>
										</span>
			
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
				<form>
	
					<table style="border-top: 1px solid #000; border-bottom: 1px solid #000;" class="table">
						<tbody>
							<tr>
								<th scope="col"><input style="margin: 0; vertical-align: middle;" class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1"></th>
								<th scope="col">번호</th>
								<th scope="col">등급</th>
								<th scope="col">아이디</th>
								<th scope="col">휴대폰</th>
								<th scope="col">이메일</th>
								<th scope="col">주소</th>
								<th scope="col">가입일</th>
								<th scope="col">수정</th>
							</tr>
						</tbody>
						<tbody>
							<tr>
								<td><input style="margin: 0; vertical-align: middle;"class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1"></td>
								<td>1</td>
								<td>
									<select style=" width: auto;" id="inputState" class="form-control">
							        	<option selected>Lv1</option>
							        	<option>Lv2</option>
							        	<option>Lv3</option>
									</select>
								</td>
								<td>classictestid1</td>
								<td>010-1234-5678</td>
								<td>testemail1@classic.com</td>
								<td>서울 종로구 청와대로1</td>
								<td>2017-01-02</td>
								<td><button type="button" class="btn btn-secondary btn-sm">수정</button></td>
							</tr>
						</tbody>
					</table>
					<div>
						<!-- 모달 띄우는 버튼 -->
						<button style="margin: 1px 10px 3px 0px;" type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#exampleModal">
							선택 강퇴처리
						</button>
						
						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">확인</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">선택한 회원을 탈퇴처리하시겠습니까? 해당 회원은 즉시 탈퇴처리되며, 탈퇴완료 시 취소할 수 없습니다.</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
										<button type="button" class="btn btn-primary">확인</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
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
