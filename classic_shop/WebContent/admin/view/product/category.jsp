<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</head>
<script type="text/javascript">
$(function(){
	
});
</script>
<body>
<!-- 전체 container 태그 이름 변경X-->
<div class="container-fluid common-body-container">
	<div class="row">
		<!-- 좌측 네비게이션 -->
		<nav class="col-sm-3 col-md-2 d-none d-sm-block bg-light sidebar common-left-nav">
			<p class="left-nav-outer-title">네비게이션 항목 title1</p>
				<ul class="nav nav-pills flex-column left-nav-inner-title">
					<li class="nav-item"><a class="nav-link active" href="#">세부 항목 title1</a></li>
					<li class="nav-item"><a class="nav-link" href="#">세부 항목 title2</a></li>
					<li class="nav-item"><a class="nav-link" href="#">세부 항목 title3</a></li>
				</ul>
			<p class="left-nav-outer-title">네비게이션 항목 title2</p>
				<ul class="nav nav-pills flex-column left-nav-inner-title">
					<li class="nav-item"><a class="nav-link" href="#">세부 항목 title1</a></li>
					<li class="nav-item"><a class="nav-link" href="#">세부 항목 title2</a></li>
					<li class="nav-item"><a class="nav-link" href="#">세부 항목 title3</a></li>
				</ul>
			<p class="left-nav-outer-title">네비게이션 항목 title3</p>
				<ul class="nav nav-pills flex-column left-nav-inner-title">
					<li class="nav-item"><a class="nav-link" href="#">세부 항목 title1</a></li>
					<li class="nav-item"><a class="nav-link" href="#">세부 항목 title2</a></li>
					<li class="nav-item"><a class="nav-link" href="#">세부 항목 title3</a></li>
				</ul>
		</nav>
		<!-- 우측 바디 -->
		<div class="col-sm-9 ml-sm-auto col-md-10 pt-3 common-right-body">
			<div class="common-right-title">
				<div class="row container">
					<div class="col-md-11">
						<p class="h3">
							카테고리 관리
						</p>
					</div>
					<div class="col-md-1 container mb-1">
						<!-- <button class="btn btn-outline-danger btn-lg mb-1">+아이콘 등록</button> -->
					</div>
				</div>
					
			</div>
			<div class="common-inner-body">
				<div class="search">
					<div class="container">
						<div class="row container">
							<div class="col-md-2">
								
								<div class="row">
									<div class="col-md-10 border border-dark">
										> 카테고리정렬
									</div>
								</div>
							</div>
							<div class="col-md-10">
								<div class="row">
									<p class="h4">대분류</p>
								</div>
								<div class="row">
								<table class="table col-md-12">
									<tr class="row">
										<th class="table-active col-md-2">카테고리명</th>
										<td class="col-md-10 container"><input class="col-md-6" type="text" placeholder="OUTER"></td>
									</tr>
									<tr class="row">
										<th class="table-active col-md-2">노출상태</th>
										<td class="col-md-10 container">
											<div class="row container">
												<div class="form-check form-check-inline">
												  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
												  <label class="form-check-label" for="inlineRadio1">노출함</label>
												</div>
												<div class="form-check form-check-inline">
												  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
												  <label class="form-check-label" for="inlineRadio2">노출안함</label>
												</div>
												
											 </div> 
										</td>
									</tr>
									<tr class="row border border-top-0 b border-left-0 border-right-0">
										<th class="table-active col-md-2">상품진열타입</th>
										<td class="col-md-10 container">
											<div class="form-check form-check-inline">
											  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
											  <label class="form-check-label" for="inlineRadio1">수동진열</label>
											</div>
											<div class="form-check form-check-inline">
											  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
											  <label class="form-check-label" for="inlineRadio2">자동진열</label>
											</div>
											<div class="col-md-3 form-check form-check-inline">
													<select class="form-control">
														<option>인기순</option>
													</select>
											</div>
										</td>
									</tr>
								</table>
								</div>
								<div class="row">
									<div class="col-md-4"></div>
									<div class="col-md-1"><button class="btn btn-dark">등록</button></div>
									<div class="col-md-1"><button class="btn btn-dark">수정</button></div>
									<div class="col-md-1"><button class="btn btn-dark">삭제</button></div>
									<div class="col-md-5"></div>
								</div>
								<br><br>
								
								<div class="row">
									<p class="h4">소분류</p>
								</div>
								<div class="row">
								<table class="table col-md-12">
									<tr class="row">
										<th class="table-active col-md-2">대분류선택</th>
										<td class="col-md-10 container">
											<select class="form-control col-md-4">
												<option>::대분류선택::</option>
											</select>
										</td>
									</tr>
									<tr class="row">
										<th class="table-active col-md-2">카테고리명</th>
										<td class="col-md-10 container"><input class="col-md-6" type="text" placeholder="COAT"></td>
									</tr>
									<tr class="row">
										<th class="table-active col-md-2">노출상태</th>
										<td class="col-md-10 container">
												<div class="row container">
												<div class="form-check form-check-inline">
												  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
												  <label class="form-check-label" for="inlineRadio1">노출함</label>
												</div>
												<div class="form-check form-check-inline">
												  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
												  <label class="form-check-label" for="inlineRadio2">노출안함</label>
												</div>
											 </div> 
										</td>
									</tr>
									<tr class="row border border-top-0 b border-left-0 border-right-0">
										<th class="table-active col-md-2">상품진열타입</th>
										<td class="col-md-10 container">
											<div class="form-check form-check-inline">
											  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
											  <label class="form-check-label" for="inlineRadio1">수동진열</label>
											</div>
											<div class="form-check form-check-inline">
											  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
											  <label class="form-check-label" for="inlineRadio2">자동진열</label>
											</div>
											<div class="col-md-3 form-check form-check-inline">
													<select class="form-control">
														<option>인기순</option>
													</select>
											</div>
										</td>
									</tr>
								</table>
								</div>
								<div class="row">
									<div class="col-md-4"></div>
									<div class="col-md-1"><button class="btn btn-dark">등록</button></div>
									<div class="col-md-1"><button class="btn btn-dark">수정</button></div>
									<div class="col-md-1"><button class="btn btn-dark">삭제</button></div>
									<div class="col-md-5"></div>
								</div>
								
							</div>
						</div>
					</div>
				
				<hr>
				</div>
				
				<!-- Modal~~~!  -->
				<!-- The Modal -->
				<div class="modal fade" id="myModal">
				  <div class="modal-dialog modal-md">
				    <div class="modal-content">
				    
				      <!-- Modal Header -->
				      <div class="modal-header">
				        <h4 class="modal-title">경고</h4>
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				      </div>
				      
				      <!-- Modal body -->
				      <div class="modal-body">
				        선택된 아이콘이 없습니다.
				      </div>
				      
				      <!-- Modal footer -->
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
				      </div>
				      
				    </div>
				  </div>
				</div>
			
			
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

