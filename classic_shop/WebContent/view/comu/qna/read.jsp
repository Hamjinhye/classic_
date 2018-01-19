<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/public/css/comu.css' />">
<script src="<c:url value='/public/js/comu.js'/>"></script>
</head>
<body>
<!-- COMMUNITY MENU -->
	<div class="comu_menu">
		<div class="container">
			<h2>COMMUNITY</h2>
				<ul class="nav nav-tabs">
					<li><a href="<c:url value='/community/notice.do' />">NOTICE</a></li>
					<li><a href="<c:url value='/community/qna.do' />">QNA</a></li>
					<li><a href="<c:url value='/community/faq.do' />">FAQ</a></li>
				</ul>
		</div>
	</div>
	<div class="comu_body">
		<div class="container">
			<p class="comu_title">QNA</p>
			<div class="table-responsive">
				<table class="table table-condensed">
					<tr>
						<th class='col-2'>SUBJECT</th>
						<td class='col-6'>
							<c:choose>
								<c:when test="${qnaDTO.subject==0}">상품 문의</c:when>
								<c:when test="${qnaDTO.subject==1}">배송 문의</c:when>
								<c:when test="${qnaDTO.subject==2}">배송 전 변경</c:when>
								<c:when test="${qnaDTO.subject==3}">입금 문의</c:when>
								<c:when test="${qnaDTO.subject==4}">교환/환불 문의</c:when>
								<c:when test="${qnaDTO.subject==5}">기타 문의</c:when>
							</c:choose>
						</td>
						<th class='col-2'>NAME</th>
						<td class='col-6'>${qnaDTO.name}</td>
					</tr>
					<tr>
						<th class='col-sm-1'>DATE</th>
						<td class='col-sm-6'>${qnaDTO.indate}</td>
						<th class='col-sm-1'>VIEW</th>
						<td class='col-sm-6'>${qnaDTO.count}</td>
					</tr>
				</table>
				<table class="table table-bordered">
					<tr class='qna_contents'>
						<td>${qnaDTO.content}</td>
					</tr>
				</table>
			</div>
			<div class="qna_list_btn" align="left">
				<button type="button" class="btn btn-default" onclick="qnaListBtn()">목록</button>
			</div>
			<div class="qna_btn_group" align="right">
				<button type="button" class="btn btn-default" onclick="modifyQnaForm('${qnaDTO.num}')">수정</button>
				<button type="button" class="btn btn-default" onclick="removeQna('${qnaDTO.num}')">삭제</button>
			</div>
			<!-- 댓글 폼 -->
			<div class="qna_reply_form">
				<table class="table table-bordered">
					<tr>
						<th class="col-sm-2" id="qnaReplyId">작성자</th>
						<td>댓글 내용</td>
					</tr>
				</table>
			</div>
		</div>
	</div> 