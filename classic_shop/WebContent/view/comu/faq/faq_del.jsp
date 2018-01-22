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
				<p class="h3">FAQ </p>
			</div>
			<div class="common-inner-body">
				<ol>
					<!-- contact -->
<div id="contact" class="container">
	<div class="row">
		<!-- wrap -->
		<div id="wrap">
			<!-- 관리자용wf에 select만 더 추가해서 구현할 예정이에욥 -->
			<!-- 글씨색상은 a태그 걸린것은 파랑으로 햇어요 -->
			<!-- 580px 이하에서 메뉴바 생성 -->
			<script type="text/javascript">
				$(".handle").on("click", function() {
					$("nav ul").toggleClass("showing");
				});
			</script>
			<div class="comu_body">
			
				<div class="panel-group" id="accordion" role="tablist"
					aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingOne">
							<h2 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#faqTitleOne" aria-expanded="true"
									aria-controls="faqTitleOne"> FAQ title </a>
							</h2>
						</div>
						<div id="faqTitleOne" class="panel-collapse collapse in"
							role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body">FAQ contents</div>
							<div class="type1_nav">
								<button type="button" class="btn btn-default pull-right"
									onclick="location.href='/classic_shop/comu/faq/user(register).jsp'">
									등록</button>
								<!-- container -->
								<!-- section -->
								<div class="section">
									<div class="panel panel-default">
										<!-- Table -->
										<table class="type1">
											<tr>
												<td>
													<div class="row">
														<div class="col-lg-6">
															<div class="input-group"></div>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<div class="panel panel-default">
													<table class="faq_title">
														<tr>
															<th>No.</th>
															<th>SUBJECT</th>
															<th>NAME</th>
															<th>DATE</th>
															<th>VIEW</th>
														</tr>
														<tr>
															<td><label><input type="checkbox"
																	aria-label="  "> <a href="#">상품명:product_name</a></input></label><br>
																<!-- 상품명 누르면 상품상세정보로 --></td>
															<td>1</td>
															<td>order_money</td>
															<td>YYYY-MM-DD</td>
															<td>now_mileage</td>
														</tr>
														<tr>
															<td><label><input type="checkbox"
																	aria-label="  "> <a href="#">상품명:product_name</a></input></label><br>
																<!-- 상품명 누르면 상품상세정보로 --></td>
															<td>3</td>
															<td>order_money</td>
															<td>YYYY-MM-DD</td>
															<td>now_mileage</td>
														</tr>
														<tr>
															<td><label><input type="checkbox"
																	aria-label="  "> <a href="#">상품명:product_name</a></input></label><br>
																<!-- 상품명 누르면 상품상세정보로 --></td>
															<td>3</td>
															<td>order_money</td>
															<td>YYYY-MM-DD</td>
															<td>now_mileage</td>
														</tr>
														<tr>
															<td><label><input type="checkbox"
																	aria-label="  "> <a href="#">상품명:product_name</a></input></label><br>
																<!-- 상품명 누르면 상품상세정보로 --></td>
															<td>3</td>
															<td>order_money</td>
															<td>YYYY-MM-DD</td>
															<td>now_mileage</td>
														</tr>
														<tr>
															<td><label><input type="checkbox"
																	aria-label="  "> <a href="#">상품명:product_name</a></input></label><br>
																<!-- 상품명 누르면 상품상세정보로 --></td>
															<td>3</td>
															<td>order_money</td>
															<td>YYYY-MM-DD</td>
															<td>now_mileage</td>
														</tr>
														<tr>
															<td><label><input type="checkbox"
																	aria-label="  "> <a href="#">상품명:product_name</a></input></label><br>
																<!-- 상품명 누르면 상품상세정보로 --></td>
															<td>3</td>
															<td>order_money</td>
															<td>YYYY-MM-DD</td>
															<td>now_mileage</td>
														</tr>
														<tr>
															<td><label><input type="checkbox"
																	aria-label="  "> <a href="#">상품명:product_name</a></input></label><br>
																<!-- 상품명 누르면 상품상세정보로 --></td>
															<td>3</td>
															<td>order_money</td>
															<td>YYYY-MM-DD</td>
															<td>now_mileage</td>
														</tr>
														<tr>
															<td><label><input type="checkbox"
																	aria-label="  "> <a href="#">상품명:product_name</a></input></label><br>
																<!-- 상품명 누르면 상품상세정보로 --></td>
															<td>3</td>
															<td>order_money</td>
															<td>YYYY-MM-DD</td>
															<td>now_mileage</td>
														</tr>
														<tr>
															<td><label><input type="checkbox"
																	aria-label="  "> <a href="#">상품명:product_name</a></input></label><br>
																<!-- 상품명 누르면 상품상세정보로 --></td>
															<td>3</td>
															<td>order_money</td>
															<td>YYYY-MM-DD</td>
															<td>now_mileage</td>
														</tr>
												</div>
												</div>
										</table>
									</div>
									<div class="type1_nav">
										<button type="button" class="btn btn-default pull-right" 
									onclick="location.href='/classic_shop/comu/faq/user(register).jsp'">
								선택한 글 삭제</button>
									</div>
								</div>
							</div>
						</div>
				</ol>
			</div>
		</div>
	</div>
</div>
