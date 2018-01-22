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
					<p class="h3">FAQ</p>
				</div>
				<div class="common-inner-body">
					<ol>
					
					
	<div class="comu_body">
		<div class="panel-group" id="accordion" role="tablist"
			aria-multiselectable="true">
			<div class="panel panel-default"></div>
				<div class="panel-body">FAQ contents</div>
			<div id="contact" class="container">
				<div class="row">
					<div id="contact" class="container">
						<div class="row">
							<div class="col-md-8"></div>
							<textarea class="form-control" id="contactComments"
								placeholder="내용을 입력해주세요" rows="10" form="100"
								style="width: 100%;"></textarea>
							<!-- contact modal button -->
							<div class="type1_nav"></div>
							<div class="form-group">
								<div class="col-sm-10">
									<div class="input-group">
										<label class="input-group-btn"> <span
											class="btn btn-default btn-file"> <input type="file"
												name="attach_file" data-display-target="attachFile"></span>
										</label>
									</div>
									</di>
								</div>
								<!-- contact modal button -->
								<button class="btn pull-right" data-toggle="modal"
									data-target="#contactModal">취소</button>
								<!-- 등록버튼이 와이어프레임에 2개 인거 같은데 일단 하나만 넣엇어요~ -->
								<!-- contact modal button -->
								<button class="btn pull-right" data-toggle="modal"
									data-target="#contactModal">등록</button>
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
					
					</ol>
				</div>
			</div>
		</div>
	</div>
