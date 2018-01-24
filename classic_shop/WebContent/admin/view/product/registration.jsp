<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</head>
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
					<div class="row">
						<div class="col-md-11">
							<p class="h3">
								상품관리
							</p>
						</div>
						<div class="col-md-1">
							<button class="btn btn-outline-danger">저장</button>
						</div>
					</div>
			</div>
			<div class="common-inner-body">
				
				<form class="container">
					<div class="row">
							<p class="h4">상품 등록</p>
						</div>
					<div class="row container">
						<table class="table col-md-12">
							<tr class="row form-group mb-0">
								<th class="col-md-2 form-label table-active">카테고리연결</th>
								<td class="col-md-3 container">
									<select class="form-control form-select col-md-12" name="cate_num">
										<option>JUMPER</option>
										<option>JACKET</option>
										<option>CARDIGAN</option>
									</select>
								</td>
								<td class="col-md-7 container">
									<p class="text-left m-0 col-md-6" style="font-size: x-small;">
										*카테고리가 먼저 등록 되어 있어야 연결 가능합니다.<br>
									</p>
									<p class="text-left text-danger m-0 col-md-6" style="font-size: x-small;">
										<u>카테고리 등록하기</u>
									</p>
								</td>
							</tr>
							<tr class="row form-group mb-0">
								<th class="col-md-2 form-label table-active">노출설정</th>
								<td class="col-md-4 container">
									<div class="row">
										<div class="col-md-6">
											<div class="form-check">
												<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
												<label class="form-check-label" for="gridRadios1">
													노출함
												</label>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-check">
												<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
												<label class="form-check-label" for="gridRadios2">
													노출안함
												</label>
											</div>
										</div>
									</div>
								</td>
								<th class="col-md-2 form-label table-active">판매설정</th>
								<td class="col-md-4 container">
									<div class="row">
										<div class="col-md-6">
											<div class="form-check">
												<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
												<label class="form-check-label" for="gridRadios1">
													판매함
												</label>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-check">
												<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
												<label class="form-check-label" for="gridRadios2">
													판매안함
												</label>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr class="row form-group mb-0">
								<th class="col-md-2 form-label table-active">상품명</th>
								<td class="col-md-4 container">
									<input class="form-control" type="text" placeholder="내용을 입력하세요.">
								</td>
								<th class="col-md-2 form-label table-active">자체상품코드</th>
								<td class="col-md-4 container">
									<input class="form-control" type="text" placeholder="내용을 입력하세요.">
								</td>
							</tr>
							<tr class="row form-group mb-0">
								<th class="col-md-2 form-label table-active">상품노출시점</th>
								<td class="col-md-4 container">
									<div class="row container">
										<input class="form-control col-md-10" type="text" id="datepicker" placeholder="jqueryui datepicker be here">
										<i class="fa fa-calendar fa-2x col-md-2" aria-hidden="true"></i>
									</div>
								</td>
								<td class="col-md-6 container">
									<p class="text" style="font-size: x-small;">
										<br>*노출 시간을 설정하지 않을 경우, 상품 등록 후 바로 쇼핑몰에 노출됩니다.
									</p>
								</td>
							</tr>
							<tr class="row form-group mb-0">
								<th class="col-md-2 form-label table-active">상품색상</th>
								<td class="col-md-4 container">
									<div class="row container">
										<span class="form-control" style="background-color: red; height: 37px; width: 37px;"></span>
										<input class="form-control col-md-7 ml-1" type="text" id="datepicker" placeholder="색상명입력">
										<i class="fa fa-plus fa-2x col-md-2" aria-hidden="true"></i>
										<i class="fa fa-minus fa-2x col-md-1" aria-hidden="true"></i>
									</div>
								
								</td>
								<th class="col-md-2 form-label table-active">상품사이즈</th>
								<td class="col-md-4 container">
									<div class="row container">
										<input class="form-control col-md-8" type="text" id="datepicker" placeholder="FREE">
										<i class="fa fa-plus fa-2x col-md-2" aria-hidden="true"></i>
										<i class="fa fa-minus fa-2x col-md-2" aria-hidden="true"></i>
									</div>
								</td>
							</tr>
							<tr class="row form-group mb-0">
								<th class="col-md-2 form-label table-active">판매가</th>
								<td class="col-md-4 container">
									<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
								</td>
								<th class="col-md-2 form-label table-active">매입가</th>
								<td class="col-md-4 container">
									<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
								</td>
							</tr>
							<tr class="row form-group mb-0">
								<th class="col-md-2 form-label table-active">상품명</th>
								<td class="col-md-4 container">
									<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
								</td>
								<th class="col-md-2 form-label table-active">상품소개</th>
								<td class="col-md-4 container">
									<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
								</td>
							</tr>
							<tr class="row form-group mb-0">
								<th class="col-md-2 form-label table-active">소재</th>
								<td class="col-md-4 container">
									<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
								</td>
								<th class="col-md-2 form-label table-active">사이즈</th>
								<td class="col-md-4 container">
									<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
								</td>
							</tr>
							<tr class="row form-group mb-0">
								<th class="col-md-2 form-label table-active">색상</th>
								<td class="col-md-4 container">
									<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
								</td>
								<th class="col-md-2 form-label table-active">무게</th>
								<td class="col-md-4 container">
									<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
								</td>
							</tr>
							<tr class="row form-group mb-0">
								<th class="col-md-2 form-label table-active">제조사</th>
								<td class="col-md-4 container">
									<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
								</td>
								<th class="col-md-2 form-label table-active">A/S책임자</th>
								<td class="col-md-4 container">
									<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
								</td>
							</tr>
							<tr class="row form-group mb-0">
								<th class="col-md-2 form-label table-active">제조일</th>
								<td class="col-md-4 container">
									<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
								</td>
								<th class="col-md-2 form-label table-active">A/S번호</th>
								<td class="col-md-4 container">
									<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
								</td>
							</tr>
							<tr class="row form-group mb-0">
								<th class="col-md-2 form-label table-active">제조국</th>
								<td class="col-md-4 container">
									<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
								</td>
								<th class="col-md-2 form-label table-active">세탁법</th>
								<td class="col-md-4 container">
									파일 업로드
								</td>
							</tr>
							<tr class="row form-group mb-0">
								<th class="col-md-2 form-label table-active">공급사</th>
								<td class="col-md-4 container">
									<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
								</td>
								<th class="col-md-2 form-label table-active">품질보증기준</th>
								<td class="col-md-4 container">
									파일업로드 붙이기
								</td>
							</tr>
							<tr class="row form-group mb-0">
								<th class="col-md-2 form-label table-active">재고</th>
								<td class="col-md-3 container">
									<div class="row container">
										<input class="form-control col-md-10" type="text" id="datepicker" placeholder="갯수입력">
										<span class="text col-md-1 mt-2">개</span>
									</div>
								</td>
								<td class="col-md-7 container">
									<p class="text" style="font-size: x-small;">
										<br>*상품의 재고는 쇼핑몰에 노출 되지 않습니다.	
									</p>
								</td>
							</tr>							
							<tr class="row form-group mb-0">
								<th class="col-md-2 form-label table-active">상품할인설정</th>
								<td class="col-md-4 container">
									<div class="row">
										<div class="col-md-6">
											<div class="form-check">
												<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
												<label class="form-check-label" for="gridRadios1">
													할인안함
												</label>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-check">
												<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
												<label class="form-check-label" for="gridRadios2">
													할인함
												</label>
											</div>
										</div>
									</div>
								</td>
								<th class="col-md-2 form-label table-active">상품할인율</th>
								<td class="col-md-4 container">
									<div class="row">
										<span class="text col-md-4 mt-1">상품금액의</span>
										<input class="form-control col-md-3 ml-1 mr-1" type="text" id="datepicker" placeholder="할인율">
										<span class="text col-md-1 mt-1">%</span>
									</div>
								</td>
							</tr>
							<tr class="row form-group mb-0">
								<th class="col-md-2 form-label table-active">상품 아이콘 선택</th>
								<td class="col-md-4 container">
									<div class="row">
										<div class="col-md-6">
											<div class="form-check">
												<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
												<label class="form-check-label" for="gridRadios1">
													사용함
												</label>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-check">
												<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
												<label class="form-check-label" for="gridRadios2">
													사용안함
												</label>
											</div>
										</div>
									</div>
								</td>
								<td class="col-md-6 container">
									<div class="row">
										<div class="col-md-3">
											<div class="form-check">
												<input class="form-check-input" type="checkbox" name="gridRadios" id="gridRadios2" value="option2">
												<label class="form-check-label" for="gridRadios2">
													ICON1
												</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check">
												<input class="form-check-input" type="checkbox" name="gridRadios" id="gridRadios2" value="option2">
												<label class="form-check-label" for="gridRadios2">
													ICON2
												</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check">
												<input class="form-check-input" type="checkbox" name="gridRadios" id="gridRadios2" value="option2">
												<label class="form-check-label" for="gridRadios2">
													ICON3
												</label>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-check">
												<input class="form-check-input" type="checkbox" name="gridRadios" id="gridRadios2" value="option2">
												<label class="form-check-label" for="gridRadios2">
													ICON4
												</label>
											</div>
										</div>
									
									</div>
								</td>
							</tr>
							<tr class="row form-group mb-0">
								<th class="col-md-2 form-label table-active">아이콘 노출기간</th>
								<td class="col-md-4 container">
									<div class="row">
										<div class="col-md-6">
											<div class="form-check">
												<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
												<label class="form-check-label" for="gridRadios1">
													무기한
												</label>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-check">
												<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
												<label class="form-check-label" for="gridRadios2">
													기간제한
												</label>
											</div>
										</div>
									</div>
								</td>
								<td class="col-md-6 container">
									<div class="row">
										<input class="form-control col-md-4" type="text" id="datepicker" placeholder="datepicker">
										<i class="fa fa-calendar fa-2x col-md-1" aria-hidden="true"></i>
										<span class="text text-center col-md-1">~</span>
										<input class="form-control col-md-4" type="text" id="datepicker" placeholder="datepicker">
										<i class="fa fa-calendar fa-2x col-md-1" aria-hidden="true"></i>
									</div>
								</td>
							</tr>
							<tr class="row form-group mb-0">
								<th class="col-md-2 form-label table-active">메인 노출 이미지</th>
								<td class="col-md-10 container">
									<div class="row container">
										<input class="form-control col-md-3" type="text" id="datepicker" placeholder="no_img.jpg">
										<button class="btn btn-dark col-md-2 ml-2">찾아보기</button>
										<p class="text col-md-3" style="font-size: xx-small;"><br>*상품 상세 이용 안내에서 설정 가능합니다.</p>
									</div>
								</td>
							</tr>
							<tr class="row form-group mb-0">
								<th class="col-md-2 form-label table-active">상품 정보 이미지</th>
								<td class="col-md-10 container">
									<div class="row container">
										<input class="form-control col-md-3 mr-2" type="text" id="datepicker" placeholder="no_img.jpg">
										<button class="btn btn-dark col-md-2">찾아보기</button>
										<i class="fa fa-plus fa-2x col-md-1" aria-hidden="true"></i>
										<i class="fa fa-minus fa-2x" aria-hidden="true"></i>
									</div>
								</td>
							</tr>
							<tr class="row form-group mb-0">
								<th class="col-md-2 form-label table-active">상품 짧은 설명</th>
								<td class="col-md-10 container">
									<input class="form-control col-md-11" type="text" id="datepicker" placeholder="*상품 짧은 설명은 메인 리스트에 노출됩니다.">
								</td>
							</tr>
							<tr class="row form-group mb-0 border border-left-0 border-right-0 border-top-0">
								<th class="col-md-2 form-label table-active">상품 상세 설명</th>
								<td class="col-md-10 container">
									<textarea class="form-control col-md-11" id="exampleFormControlTextarea1" rows="5" placeholder="내용을 입력해주세요."></textarea>
								</td>
							</tr>
							
						</table>
					</div>
					<hr>
					<!-- 1. 카테고리 -->
					<div class="form-group row border border-left-0 border-bottom-0 border-right-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">카테고리연결</label>
						<div class="col-md-7">
						<select class="form-control" id="exampleFormControlSelect1">
							<option>JUMPER</option>
							<option>JACKET</option>
							<option>CARDIGAN</option>
						</select>
						</div>
						<div class="col-md-3">
							<!-- <label class="col-form-label-sm text-sm-right">
								*카테고리가 먼저 등록 되어 있어야 연결 가능합니다.
							</label> -->
							<p class="text-right m-0" style="font-size: x-small;">
								*카테고리가 먼저 등록 되어 있어야 연결 가능합니다.<br>
							</p>
							<p class="text-right text-danger m-0" style="font-size: x-small;">
								<u>카테고리 등록하기</u>
							</p>
						
						</div>
					</div>
					<!-- 2. 노출설정 , 판매설정 -->
					<div class="form-group row border border-left-0 border-bottom-0 border-right-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">노출설정</label>
						<div class="col-sm-2">
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
								<label class="form-check-label" for="gridRadios1">
									노출함
								</label>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
								<label class="form-check-label" for="gridRadios2">
									노출안함
								</label>
							</div>
						</div>
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">판매설정</label>
						<div class="col-sm-2">
								<div class="form-check">
									<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
									<label class="form-check-label" for="gridRadios1">
										판매함
									</label>
								</div>
						</div>
						<div class="col-sm-2">
								<div class="form-check">
									<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
									<label class="form-check-label" for="gridRadios2">
										판매안함
									</label>
								</div>
						</div>
						
					</div>
					<!-- 3.상품명, 자체상품코드  -->
					<div class="form-group row border border-left-0 border-bottom-0 border-right-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">상품명</label>
						<input class="form-control col-md-4" type="text" placeholder="내용을 입력하세요.">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">자체상품코드</label>
						<input class="form-control col-md-4" type="text" placeholder="내용을 입력하세요.">
					</div>
					
					
					<!-- 4. 상품 노출 시점 -->
					<div class="form-group row border border-left-0 border-bottom-0 border-right-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">상품노출시점</label>
						<input class="form-control col-md-4" type="text" id="datepicker" placeholder="jqueryui datepicker gonna be here">
						<i class="fa fa-calendar fa-2x col-md-1" aria-hidden="true"></i>
						<div class="col-md-5">
							<!-- <label class="col-form-label-sm text-sm-right">
								*카테고리가 먼저 등록 되어 있어야 연결 가능합니다.
							</label> -->
							<p class="text" style="font-size: x-small;">
								<br>*노출 시간을 설정하지 않을 경우, 상품 등록 후 바로 쇼핑몰에 노출됩니다.
							</p>
						
						</div>
					</div>
					
					<!-- 5. 상품색상  -->
					<div class="form-group row border border-left-0 border-bottom-0 border-right-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">상품색상</label>
						<span class="form-control" style="background-color: red; height: 37px; width: 37px;"></span>
						<input class="form-control col-md-3 ml-1" type="text" id="datepicker" placeholder="색상명입력">
						
						<i class="fa fa-plus fa-2x ml-1 mr-1" aria-hidden="true"></i>
						<i class="fa fa-minus fa-2x mr-1" aria-hidden="true"></i>
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">상품 사이즈</label>
						<input class="form-control col-md-3 ml-3" type="text" id="datepicker" placeholder="FREE">
						<i class="fa fa-plus fa-2x ml-1 mr-1" aria-hidden="true"></i>
						<i class="fa fa-minus fa-2x mr-1" aria-hidden="true"></i>
						
					</div>
					
					<!-- 6. 판매가 매입가 -->
					<div class="form-group row border border-left-0 border-bottom-0 border-right-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">판매가</label>
						<div class="col-md-4">
							<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
						</div>
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">매입가 </label>
						<div class="col-md-4">
							<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
						</div>
						
					</div>
					<!-- 7. -->
					<div class="form-group row border border-left-0 border-bottom-0 border-right-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">상품명</label>
						<div class="col-md-4">
							<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
						</div>
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">상품소개</label>
						<div class="col-md-4">
							<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
						</div>
					</div>
					<!-- 8. -->
					<div class="form-group row border border-left-0 border-bottom-0 border-right-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">소재</label>
						<div class="col-md-4">
							<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
						</div>
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">사이즈</label>
						<div class="col-md-4">
							<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
						</div>
					</div>
					<!-- 9. -->
					<div class="form-group row border border-left-0 border-bottom-0 border-right-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">색상</label>
						<div class="col-md-4">
							<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
						</div>
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">무게</label>
						<div class="col-md-4">
							<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
						</div>
					</div>
					<!-- 10. -->
					<div class="form-group row border border-left-0 border-bottom-0 border-right-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">제조사</label>
						<div class="col-md-4">
							<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
						</div>
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">A/S책임자</label>
						<div class="col-md-4">
							<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
						</div>
					</div>
					<!-- 11. -->
					<div class="form-group row border border-left-0 border-bottom-0 border-right-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">제조일</label>
						<div class="col-md-4">
							<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
						</div>
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">A/S번호</label>
						<div class="col-md-4">
							<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
						</div>
					</div>
					<!-- 12. -->
					<div class="form-group row border border-left-0 border-bottom-0 border-right-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">제조국</label>
						<div class="col-md-4">
							<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
						</div>
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">세탁법</label>
						<div class="col-md-4">
							 <input type="file" class="form-control-file" id="exampleFormControlFile1">
						</div>
					</div>
					<div class="form-group row border border-left-0 border-bottom-0 border-right-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">공급사</label>
						<div class="col-md-4">
							<input class="form-control col-md-11" type="text" id="datepicker" placeholder="내용을 입력해주세요.">
						</div>
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">품질보증기준</label>
						<div class="col-md-4">
							 <input type="file" class="form-control-file" id="exampleFormControlFile1">
						</div>
					</div>
					<!-- 13. -->
					<div class="form-group row border border-left-0 border-bottom-0 border-right-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">상품할인설정</label>
						<div class="col-sm-2">
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
								<label class="form-check-label" for="gridRadios1">
									할인안함
								</label>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
								<label class="form-check-label" for="gridRadios2">
									할인함
								</label>
							</div>
						</div>
						
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">상품할인율</label>
						<p class="text col-md-1" style="font-size: small;">상품금액의</p>
						<input class="form-control col-md-2" type="text" placeholder="내용입력">
						<p class="text col-md-1">%</p>
						
					</div>
					
					<!-- 14. -->
					<div class="form-group row border border-left-0 border-bottom-0 border-right-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">상품아이콘선택</label>
						<div class="col-sm-2">
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
								<label class="form-check-label" for="gridRadios1">
									사용함
								</label>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
								<label class="form-check-label" for="gridRadios2">
									사용안함
								</label>
							</div>
						</div>
						<div class="col-sm-1">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" name="gridRadios" id="gridRadios2" value="option2">
								<label class="form-check-label" for="gridRadios2">
									ICON1
								</label>
							</div>
						</div>
						<div class="col-sm-1">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" name="gridRadios" id="gridRadios2" value="option2">
								<label class="form-check-label" for="gridRadios2">
									ICON3
								</label>
							</div>
						</div>
						<div class="col-sm-1">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" name="gridRadios" id="gridRadios2" value="option2">
								<label class="form-check-label" for="gridRadios2">
									ICON3
								</label>
							</div>
						</div>
						<div class="col-sm-1">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" name="gridRadios" id="gridRadios2" value="option2">
								<label class="form-check-label" for="gridRadios2">
									ICON3
								</label>
							</div>
						</div>
					</div>
					
					<!-- 15. -->
					<div class="form-group row border border-left-0 border-bottom-0 border-right-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">아이콘노출기간</label>
						<div class="col-sm-2">
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
								<label class="form-check-label" for="gridRadios1">
									무기한
								</label>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
								<label class="form-check-label" for="gridRadios2">
									시작/종료
								</label>
							</div>
						</div>
						<input class="form-control col-md-1" type="text" id="datepicker" placeholder="jqueryui datepicker">
						<i class="fa fa-calendar fa-2x col-md-1" aria-hidden="true"></i>
						<p class="text col-md-1">~</p>
						<input class="form-control col-md-1" type="text" id="datepicker" placeholder="jqueryui datepicker">
						<i class="fa fa-calendar fa-2x col-md-1" aria-hidden="true"></i>
					</div>
					
					<!-- 16. -->
					<div class="form-group row border border-left-0 border-bottom-0 border-right-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">상품 짧은 설명</label>
						<input class="form-control col-md-10" type="text" id="datepicker" placeholder="*상품 짧은 설명은 메인 리스트에 노출됩니다.">
						
					</div>
					
					<!-- 17. -->
					
					<div class="form-group row border border-left-0 border-bottom-0 border-right-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">메인노출이미지</label>
						<input class="form-control col-md-3" type="text" id="datepicker" placeholder="no_img.jpg">
						<button class="btn btn-dark col-md-1">찾아보기</button>
						<p class="text col-md-3" style="font-size: xx-small;"><br>*상품 상세 이용 안내에서 설정 가능합니다.</p>
					</div>
					
					<!-- 18. -->
					<div class="form-group row border border-left-0 border-bottom-0 border-right-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">상품정보이미지</label>
						<input class="form-control col-md-2" type="text" id="datepicker" placeholder="no_img.jpg">
						<button class="btn btn-dark col-md-1">찾아보기</button>
						<i class="fa fa-plus fa-2x ml-1 mr-1" aria-hidden="true"></i>
						<i class="fa fa-minus fa-2x mr-1" aria-hidden="true"></i>
					</div>
					<!-- 19. -->
					<div class="form-group row border border-left-0 border-bottom-0 border-right-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">상품상세설명</label>
						 <textarea class="form-control col-md-10 mt-1" id="exampleFormControlTextarea1" rows="5">
							내용을 입력해주세요.
						 </textarea>
					</div>
					
					<!-- 20. -->
					<div class="form-group row border border-left-0 border-bottom-0  border-right-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">배송안내</label>
						<div class="col-sm-2">
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
								<label class="form-check-label" for="gridRadios1">
									직접입력
								</label>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
								<label class="form-check-label" for="gridRadios2">
									선택입력
								</label>
							</div>
						</div>
						<button class="btn btn-dark col-md-1">선택</button>
						<p class="text col-md-3" style="font-size: xx-small;"><br>*상품 상세 이용 안내에서 설정 가능합니다.</p>
						<p class="text-danger col-md-1" style="font-size: xx-small;"><br><u>이용설정하기</u></p>
					</div>
					<div class="form-group row border border-top-0 border-left-0 border-right-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary"></label>
						 <textarea class="form-control col-md-10 mt-1" id="exampleFormControlTextarea1" rows="5">
							내용을 입력해주세요.
						 </textarea>
					</div>
					<!-- 21. -->
					<div class="form-group row border border-left-0 border-right-0 border-bottom-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">교환안내</label>
						<div class="col-sm-2">
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
								<label class="form-check-label" for="gridRadios1">
									직접입력
								</label>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
								<label class="form-check-label" for="gridRadios2">
									선택입력
								</label>
							</div>
						</div>
						<button class="btn btn-dark col-md-1">선택</button>
						<p class="text col-md-3" style="font-size: xx-small;"><br>*상품 상세 이용 안내에서 설정 가능합니다.</p>
						<p class="text-danger col-md-1" style="font-size: xx-small;"><br><u>이용설정하기</u></p>
					</div>
					<div class="form-group row border border-top-0 border-left-0 border-right-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary"></label>
						 <textarea class="form-control col-md-10 mt-1" id="exampleFormControlTextarea1" rows="5">
							내용을 입력해주세요.
						 </textarea>
					</div>
					<!-- 22. -->
					<div class="form-group row border border-left-0 border-bottom-0 border-right-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">환불안내</label>
						<div class="col-sm-2">
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
								<label class="form-check-label" for="gridRadios1">
									직접입력
								</label>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
								<label class="form-check-label" for="gridRadios2">
									선택입력
								</label>
							</div>
						</div>
						<button class="btn btn-dark col-md-1">선택</button>
						<p class="text col-md-3" style="font-size: xx-small;"><br>*상품 상세 이용 안내에서 설정 가능합니다.</p>
						<p class="text-danger col-md-1" style="font-size: xx-small;"><br><u>이용설정하기</u></p>
					</div>
					<div class="form-group row border border-top-0 border-left-0 border-right-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary"></label>
						 <textarea class="form-control col-md-10 mt-1" id="exampleFormControlTextarea1" rows="5">
							내용을 입력해주세요.
						 </textarea>
					</div>
					<!-- 23. -->
					<div class="form-group row border border-left-0 border-bottom-0 border-right-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary">A/S안내</label>
						<div class="col-sm-2">
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
								<label class="form-check-label" for="gridRadios1">
									직접입력
								</label>
							</div>
						</div>
						<div class="col-sm-2">
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
								<label class="form-check-label" for="gridRadios2">
									선택입력
								</label>
							</div>
						</div>
						<button class="btn btn-dark col-md-1">선택</button>
						<p class="text col-md-3" style="font-size: xx-small;"><br>*상품 상세 이용 안내에서 설정 가능합니다.</p>
						<p class="text-danger col-md-1" style="font-size: xx-small;"><br><u>이용설정하기</u></p>
					</div>
					<div class="form-group row border border-top-0 border-0 m-0">
						<label for="inputPassword3" class="col-md-2 col-form-label bg-secondary"></label>
						 <textarea class="form-control col-md-10 mt-1" id="exampleFormControlTextarea1" rows="5">
							내용을 입력해주세요.
						 </textarea>
					</div>
					
					<div class="form-group row">
					</div>
					
					<div class="form-group row">
					</div>
					
					<div class="form-group row">
						<div class="col-sm-4">
						</div>
						<div class="col-sm-1">
							<button type="submit" class="btn btn-dark">상품등록</button>
						</div>
						<div class="col-sm-2">
						</div>
						<div class="col-sm-1">
							<button type="reset" class="btn btn-dark">취소</button>
						</div>
						<div class="col-sm-4">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
