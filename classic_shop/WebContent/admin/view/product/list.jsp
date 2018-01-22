<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</head>
<script type="text/javascript">
	/* 스프링으로 옮기면 js 만들기! */
$(function(){
	$(".checkbox").change(function(){
		
		console.log($(".checkbox").prop("checked"));
		
	});
	
	
	
	$("#expose").click(function(){
		
		if($(".checkbox").prop("checked")){
			var bodyHTML;
			var footerHTML;
			bodyHTML='<div class="ml-2 mr-2">';
				bodyHTML+='<div class="row border border-dark border-top-0 border-left-0 border-right-0">';
					bodyHTML+='노출 및 판매상태 설정'
				bodyHTML+='</div>';
				bodyHTML+='<div class="row">';
					bodyHTML+='<table class="col-12 table-bordered text-center">';
						bodyHTML+='<tr class="table-active">';
							bodyHTML+='<th>';
							bodyHTML+='노출상태';
							bodyHTML+='</th>';
							bodyHTML+='<th>';
							bodyHTML+='판매상태';
							bodyHTML+='</th>';
						bodyHTML+='</tr>';
						bodyHTML+='<tr>';
							bodyHTML+='<td>';
								bodyHTML+='<label type="text">PC쇼핑몰</label>';
								bodyHTML+='<div class="form-check form-check-inline">';
									bodyHTML+='<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">';
									bodyHTML+='<label class="form-check-label" for="inlineRadio1">노출함</label>';
								bodyHTML+='</div>';
								bodyHTML+='<div class="form-check form-check-inline">';
									bodyHTML+='<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">';
									bodyHTML+='<label class="form-check-label" for="inlineRadio2">노출안함</label>';
								bodyHTML+='</div>';
							bodyHTML+='</td>';
							bodyHTML+='<td>';
								bodyHTML+='<label type="text">PC쇼핑몰</label>';
								bodyHTML+='<div class="form-check form-check-inline">';
									bodyHTML+='<input class="form-check-input" type="radio" name="inlineRadioOptions2" id="inlineRadio1" value="option1">';
									bodyHTML+='<label class="form-check-label" for="inlineRadio1">판매함</label>';
								bodyHTML+='</div>';
								bodyHTML+='<div class="form-check form-check-inline">';
									bodyHTML+='<input class="form-check-input" type="radio" name="inlineRadioOptions2" id="inlineRadio2" value="option2">';
									bodyHTML+='<label class="form-check-label" for="inlineRadio2">판매안함</label>';
								bodyHTML+='</div>';
							bodyHTML+='</td>';
						bodyHTML+='</tr>';
					bodyHTML+='</table>';
				bodyHTML+='<div>';
			bodyHTML+='</div>';			
			$(".modal-body").html(bodyHTML);
			
			/*
			footerHTML='<div align="center">';
				footerHTML+='<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>';
				footerHTML+='<button id="exposeConfirm" type="button" data-dismiss="modal" class="btn btn-secondary">수정</button>';
			footerHTML+='</div>';
			$(".modal-footer").html(footerHTML); */
		}
		
	});
	
	
});
</script>
<!-- Here is the BOTTOM of SCRIPT -->
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
				<div class="container row mb-1">
						<div class="col-md-11">
							<p class="h3">
								상품리스트
							</p>
						</div>
						<div class="col-md-1">
							<button class="btn btn-outline-danger btn-lg mb-1">+상품등록</button>
						</div>
				</div>
					
			</div>
			<div class="common-inner-body">
				<div class="search">
					<div class="container">
						<div class="row">
							<p class="h4">상품검색</p>
						</div>
						<div class="row container">
							<table class="table col-md-12">
								<tr class="row">
									<th class="table-active col-md-2">검색어</th>
									<td class="col-md-10 container"><input class="col-md-6" type="text"></td>
								</tr>
								<tr class="row">
									<th class="table-active col-md-2">기간 검색</th>
									<td class="col-md-10 container">
										<input type="text"><i class="fa fa-calendar-o fa-2x ml-2"></i>
										<label>~</label>
										<input type="text"><i class="fa fa-calendar-o fa-2x ml-2"></i>
										<div class="btn-group ml-4">
										  <button type="button" class="btn btn-secondary">전체</button>
										  <button type="button" class="btn btn-secondary">오늘</button>
										  <button type="button" class="btn btn-secondary">7일</button>
										  <button type="button" class="btn btn-secondary">1개월</button>
										  <button type="button" class="btn btn-secondary">3개월</button>
										</div>
									</td>
								</tr>
								<tr class="row">
									<th class="table-active col-md-2">카테고리</th>
									<td class="col-md-10 container">
										<div class="row container">
										<select class="form-control col-md-3 mr-3">
											<option>::대분류선택::</option>
											<option>OUTER</option>
											<option>BOTTOM</option>
										</select>
										<select class="form-control col-md-3">
											<option>::소분류선택::</option>
											<option>JACKET</option>
											<option>CARDIGAN</option>
										</select>
										</div>
									</td>
								</tr>
								<tr class="row">
									<th class="table-active col-md-2">판매가</th>
									<td class="col-md-10 container">
										<input type="text">
										<label> 이상 ~</label>
										<input type="text">
										<label> 이하</label>
									</td>
								</tr>
								<tr class="row border border-top-0 border-left-0 border-right-0">
									<th class="table-active col-md-2">상품재고</th>
									<td class="col-md-10 container">
										<input type="text">
										<label> 개 이상 ~</label>
										<input type="text">
										<label> 개 이하</label>
									</td>
								</tr>
							</table>
							<br>
							<div class="row container">
								<div class="col-md-6">
								</div>
								<button class="col-md-1 btn btn-dark">검색</button>
								<div class="col-md-5">
								</div>
							</div>
						</div>
					</div>
				</div>
				<hr>
				<!-- 상품 리스트 -->
				<div class="productArray row">
					<div class="container">
						<div class="row">
							<label class="text">검색</label>
							<label class="text-danger">2</label>
							<label class="text">개</label>
							<label class="text">/</label>
							<label class="text">전체</label>
							<label class="text-danger">10</label>
							<label class="text">개</label>
						</div>
						<div class="row mb-2">
							<div class="col-md-10">
								<button id="expose" class="btn btn-default" data-toggle="modal" data-target="#myModal">상품 노출/판매 수정</button> <!-- 사파리에서는 회색이고 크롬에서는 왜 투명이지? -->
								<button class="btn">상품 품절 처리</button>
								<button class="btn">선택 삭제</button>
							</div>
							<div class="col-md-2 selectpicker" data-style="btn-secondary" >
								<select class="form-control">
									<option>등록순</option>
									<option>높은가격순</option>
									<option>낮은가격순</option>
								</select>
							</div>
						</div>
						<div class="row">
							<table class="table table-hover col-md-12" data-toggle="table" data-click-to-select="true">
								<tr class="table-active text-center">
									<th class="bs-checkbox" data-field="state" data-checkbox="true"><input name="btSelectAll" class="checkbox" type="checkbox"></th>
									<th>번호</th>
									<th>이미지</th>
									<th>상품코드</th>
									<th>상품명</th>
									<th>판매가</th>
									<th>공급사</th>
									<th>노출상태</th>
									<th>판매상태</th>
									<th>재고</th>
									<th>등록일</th>
									<th>수정</th>
								</tr>
								<tr data-index="0" class="text-center">
									<td class="bs-checkbox"><input name="btSelectItem" class="checkbox" type="checkbox"></td>
									<td>2</td>
									<td><i class="fa fa-picture-o fa-3x"></i></td>
									<td>1000000002</td>
									<td>나 테스트</td>
									<td>10,000원</td>
									<td>종로주단</td>
									<td>노출안함</td>
									<td>판매함</td>
									<td>999</td>
									<td>2017/12/16</td>
									<td><button class="btn btn-default">수정</button></td>
								</tr>
								<tr data-index="1" class="text-center">
									<td class="bs-checkbox"><input name="btSelectItem" class="checkbox" type="checkbox"></td>
									<td>1</td>
									<td><i class="fa fa-picture-o fa-3x"></i></td>
									<td>1000000001</td>
									<td>가 테스트</td>
									<td>100,000원</td>
									<td>비트어패럴</td>
									<td>노출안함</td>
									<td>판매안함</td>
									<td>-</td>
									<td>2017-11-16</td>
									<td><button class="btn btn-default">수정</button></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<!-- 페이징  -->
				<div>
					<nav aria-label="Page navigation example">
					  <ul class="pagination justify-content-center">
					    <li class="page-item">
					      <a class="page-link text-dark btn" href="#" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					        <span class="sr-only">Previous</span>
					      </a>
					    </li>
					    <li class="page-item"><a class="btn ml-1 page-link text-white bg-secondary" href="#">1</a></li>
					    <li class="page-item"><a class="btn ml-1 page-link text-white bg-secondary" href="#">2</a></li>
					    <li class="page-item"><a class="btn ml-1 page-link text-white bg-secondary" href="#">3</a></li>
					    <li class="page-item">
					      <a class="page-link text-dark btn ml-1" href="#" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					        <span class="sr-only">Next</span>
					      </a>
					    </li>
					  </ul>
					</nav>
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
				        선택된 상품이 없습니다.
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

