<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
</head>
<body>
	<!-- 전체 container 태그 이름 변경X-->
	<div class="container-fluid common-body-container">
		<div class="row">
			<!-- 좌측 네비게이션 -->
			<nav
				class="col-sm-3 col-md-2 d-none d-sm-block bg-light sidebar common-left-nav">
				<p class="left-nav-outer-title">네비게이션 항목 title1</p>
				<ul class="nav nav-pills flex-column left-nav-inner-title">
					<li class="nav-item"><a class="nav-link active" href="#">세부
							항목 title1</a></li>
					<li class="nav-item"><a class="nav-link" href="#">세부 항목
							title2</a></li>
					<li class="nav-item"><a class="nav-link" href="#">세부 항목
							title3</a></li>
				</ul>
				<p class="left-nav-outer-title">네비게이션 항목 title2</p>
				<ul class="nav nav-pills flex-column left-nav-inner-title">
					<li class="nav-item"><a class="nav-link" href="#">세부 항목
							title1</a></li>
					<li class="nav-item"><a class="nav-link" href="#">세부 항목
							title2</a></li>
					<li class="nav-item"><a class="nav-link" href="#">세부 항목
							title3</a></li>
				</ul>
				<p class="left-nav-outer-title">네비게이션 항목 title3</p>
				<ul class="nav nav-pills flex-column left-nav-inner-title">
					<li class="nav-item"><a class="nav-link" href="#">세부 항목
							title1</a></li>
					<li class="nav-item"><a class="nav-link" href="#">세부 항목
							title2</a></li>
					<li class="nav-item"><a class="nav-link" href="#">세부 항목
							title3</a></li>
				</ul>
			</nav>
			<!-- 우측 바디 -->
			<div class="col-sm-9 ml-sm-auto col-md-10 pt-3 common-right-body">
				<div class="common-right-title">
					<p class="h3">네비게이션에서 추출한 세부 항목 title</p>
				</div>
				<div class="common-inner-body">
					<ol>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<div class="comu_body">
		<div class="panel-group" id="accordion" role="tablist"
			aria-multiselectable="true">
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="headingOne"></div>
				<div id="faqTitleOne" class="panel-collapse collapse in"
					role="tabpanel" aria-labelledby="headingOne">
					<div class="panel-body">FAQ contents</div>
				</div>
				<div id="contact" class="container">
					<div class="row">
						<div id="contact" class="container">
							<div class="row">
								<div class="col-md-8"></div>
								<textarea class="form-control" id="contactComments"
									placeholder="글내용 출력" rows="10" form="100" style="width: 100%;"></textarea>
								<!-- contact modal button -->
								<div class="type1_nav">
									<a href="list.jsp">
										<button class="btn pull-left" data-toggle="modal"
											data-target="#contactModal">목록</button>
									</a>
								</div>
								<!-- contact modal button -->
								<a href="faq_register.jsp">
									<button class="btn pull-right" data-toggle="modal"
										data-target="#contactModal">수정</button>
								</a>
								<!-- contact modal button -->
								<a href="faq_register.jsp">
									<button class="btn pull-right" data-toggle="modal"
										data-target="#contactModal">글 등록</button>
								</a>
								<!-- Contact Modal -->
								<div class="modal fade" id="contactModal" role="dialog"
									data-backdrop="false">
									<div class="modal-dialog"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<body id="home" data-spy="scroll" data-target=".navbar"
				data-offset="50">
				<!-- board -->
				<div id="board" class="row">
					<div class="container">
						<!-- table -->
						<!-- contact -->
