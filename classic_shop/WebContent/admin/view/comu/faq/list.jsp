<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</head>
<body>
<!-- 전체 container 태그 이름 변경X-->
<div class="container-fluid common-body-container">
	<div class="row">
		<!-- 좌측 네비게이션 -->
		<nav class="col-sm-3 col-md-2 d-none d-sm-block bg-light sidebar common-left-nav">
			<p class="left-nav-outer-title">NOTICE</p>
				<ul class="nav nav-pills flex-column left-nav-inner-title">
					<li class="nav-item"><a class="nav-link" href="#">NOTICE 관리</a></li>
					<li class="nav-item"><a class="nav-link" href="#">NOTICE 등록</a></li>
				</ul>
			<p class="left-nav-outer-title">QNA</p>
				<ul class="nav nav-pills flex-column left-nav-inner-title">
					<li class="nav-item"><a class="nav-link" href="#">QNA 관리</a></li>
					<li class="nav-item"><a class="nav-link" href="#">QNA REPLY 등록</a></li>
				</ul>
			<p class="left-nav-outer-title">FAQ</p>
				<ul class="nav nav-pills flex-column left-nav-inner-title">
					<li class="nav-item"><a class="nav-link" href="#">FAQ 관리</a></li>
				</ul>
		</nav>
		<!-- 우측 바디 -->
		<div class="col-sm-9 ml-sm-auto col-md-10 pt-3 common-right-body">
			<div class="common-right-title">
				<div class="container row mb-1">
					<div class="col-md-11">
						<p class="h3">FAQ 관리</p>
					</div>
					<div class="col-md-1">
						<button class="btn btn-outline-danger" id="faqAddForm">+등록</button>
					</div>
				</div>
			</div>
			<div class="common-inner-body">
				<div id="accordion" class="faq-acco">
					<div class="card">
						<div class="card-header" id="headingOne">
							<h5 class="mb-0">
								<button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									FAQ 질문
								</button>
							</h5>
							<span class="faq-option-btn">
								<a href="#"><i class="fa fa-edit fa-2x" id="faqEditForm"></i></a>
								<a href="#"><i class="fa fa-trash fa-2x" id="faqRemoveForm"></i></a>
							</span>
						</div>
						<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
							<div class="card-body">
								FAQ 내용
							</div>
						</div>
					</div>
				</div>
				<!-- 페이징 자리 -->
				<div class="faq-register-form mt-5 mb-3" style="border-top: 1px solid #000">
					<form>
						<input type="text" class="mt-2 form-control faq-register-title" placeholder="FAQ 제목을 입력해주세요">
						<textarea class="mt-2 form-control faq-register-content" rows="3" placeholder="FAQ 내용을 입력해주세요"></textarea>
					</form>
					<div class="mt-2 faq-btn-group">
						<button type="submit" class="btn btn-outline-dark faq-register-btn">등록</button>
						<button type="button" class="btn btn-dark faq-register-cancel">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
$(function(){
	$("#faqAddForm").click(function(){
		$(".faq-acco>div:last").clone(true).insertAfter(".faq-acco>div:last");
		return false;
	});
	$("#faqRemoveForm").click(function(){
		$(".faq-acco>div:last").remove();
		return false;
	});
});

$(function(){
	$(".faq-register-cancel").click(function(){
		$(".faq-register-title").val("");
		$(".faq-register-content").val("");
	});
});
</script>
<!-- 
아코디언 헤드에서 수정 버튼 누르면 아코디언 헤드/바디 둘 다 수정 할 수 있게.
아코디언 헤드에서 삭제 버튼 누르면 아코디언 헤드/바디 둘 다 삭제.
리스트에 등록폼 만들어두고, 등록 버튼 누르면 해당 폼 위치로 스크롤 내리기
등록 후 새로고침해서 faq 등록된 거 보여주기
data-toggle 이름 변경..
 -->





