<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>
.fa-calendar:hover{
	color: black;

}


</style>

</head>
<body>

<!-- 해야될 것
<h3>기본정보설정<h3> 옆에 저장버튼(빨강), 밑에 작은 글씨로 '회사정보'
사업자등록번호 input - input - input 일자로 맞추기
대표이메일 직접입력에서 선택하면 선택된 값이 input에 와야 함
우편번호 찾기 모달 다음주소
 -->


<!-- 전체 container 태그 이름 변경X-->
<div class="container-fluid common-body-container">
	<div class="row">
		<!-- 좌측 네비게이션 -->
		<nav class="col-sm-3 col-md-2 d-none d-sm-block bg-light sidebar common-left-nav">
			<p class="left-nav-outer-title">기본정책</p>
				<ul class="nav nav-pills flex-column left-nav-inner-title">
					<li class="nav-item"><a class="nav-link active" href="<c:url value='/admin/view/member/basic.jsp'/>">탈퇴안내</a></li>
				</ul>
		</nav>
		<!-- 우측 바디 -->
		<div class="col-sm-9 ml-sm-auto col-md-10 pt-3 common-right-body">
			<form>
				<div style="overflow: hidden;" class="common-right-title">
					<p style="float: left;" class="h3">탈퇴안내</p>
					<!-- 모달 띄우는 버튼 -->
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
				</div>
				<div>
					<table style="border-bottom: 1px solid;" class="table">
						<colgroup>
							<col style="width:15%;">
							<col style="width:85%;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row" style="background: #eee">내용입력</th>
								<td>
									<textarea style="width:100%; height:100%;" cols="40" rows="10" onkeyup="resize(this)" id="exampleFormControlTextarea1" rows="3">{rc_mallNm} 탈퇴안내&#10;&#10;회원님께서 회원 탈퇴를 원하신다니 저희 쇼핑몰의 서비스가 많이 부족하고 미흡했나 봅니다.&#10; 불편하셨던 점이나 불만 사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록 노력하겠습니다.&#10;&#10;■ 아울러 회원 탈퇴시의 아래 사항을 숙지하시기 바랍니다.&#10;1. 회원 탈퇴시 회원님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한&#10;고객 정보 보호정책에 따라 관리됩니다.&#10;2. 탈퇴 시 회원님께서 보유하셨던 마일리지는 삭제됩니다.
									</textarea>
									<i class="fa fa-exclamation-circle" aria-hidden="true"></i>
									<small id="passwordHelpInline" class="text-muted">
										쇼핑몰명은 치환코드{rc_mallNm}로 제공되며, 입력시 기본정보 설정에 등록된 "상호(회사명)"이 자동으로 표시됩니다.
									</small>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
			<div class="common-inner-body">
				
			
			
			
			
			
			
			
			
			
				<h3>아무런 상의없이 제가 만들어놓은 폴더(패키지)와 같은 선상의 폴더(패키지) 만들지마세요</h3>
				<h3>상의되지 않은 폴더(패키지)는 무통보 삭제 후 머지하겠습니다.</h3>
				<ol>
					<li>이 형식 그대로 복사해가세요</li>
					<li><strong>좌측엔 네비, 우측엔 바디</strong> 만드시면 됩니다.</li>
					<li>부트스트랩 v4.0 사용 외에 유저와 달라진 라이브러리 없어요.</li>
					<li>관리자의 어떤 기능이든 주소 맵핑하실때 맨 앞에 /admin 붙이세요</li>
					<li>유저도 그렇고 관리자도 그렇고 모든 파일을 실행할 때 도메인에 찍히는 주소 형식은 ~.do 여야합니다.</li>
					<li>현재 보이는 border와 bg-color은 div 구분을 위해 임시로 넣은 설정, 나중에 지울 예정</li>
					<li>좌측 Nav는 처음부터 펼쳐진 상태로 구현, 클릭한 nav에 active 설정</li>
					<li>여백 설정 다 했으니 전체적인 여백은 따로 설정 안하셔도 됩니다. 문제가 되지 않는 한 하지마세요.</li>
				</ol>
			</div>
		</div>
	</div>
</div>