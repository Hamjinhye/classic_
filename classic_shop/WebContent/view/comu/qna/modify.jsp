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
	<div class="container-fluid">
		<p class="comu_title">QNA</p>
		<!-- QNA 글 수정 -->
		<form name="qnaModifyForm" action="<c:url value='/community/qna/modify.do'/>" method="post">
			<div class="rable-responsive">
				<table class="table table-hover">
					<tbody>
						<!-- SUBJECT 선택 -->
						<tr class="qna-subject-row">
							<th class="col-xs-2 qna-subject-head">SUBJECT</th>
							<td class="col-8 qna-subject-data">
								<select id="qnaSubject" name="subject" class="form-control">
									<option value="${qnaModify.subject}">
										<c:choose>
											<c:when test="${qnaModify.subject==0}">상품 문의</c:when>
											<c:when test="${qnaModify.subject==1}">배송 문의</c:when>
											<c:when test="${qnaModify.subject==2}">배송 전 변경</c:when>
											<c:when test="${qnaModify.subject==3}">입금 문의</c:when>
											<c:when test="${qnaModify.subject==4}">교환/환불 문의</c:when>
											<c:when test="${qnaModify.subject==5}">기타 문의</c:when>
										</c:choose>
									</option>
									<option value="0">상품 문의</option>
									<option value="1">배송 문의</option>
									<option value="2">배송 전 변경</option>
									<option value="3">입금 문의</option>
									<option value="4">교환/환불 문의</option>
									<option value="5">기타 문의</option>
								</select>
								<input type="hidden" name="memNum" value="${loginMem.num}">
								<input type="hidden" name="qnaNum" value="${qnaModify.num}">
							</td>
						</tr>
						<!-- QNA 글 내용 -->
						<tr class="qna-content-row">
							<th class="col-2 qna-content-head">CONTENT</th>
							<td>
								<textarea class="col-8 form-control qna-content-data" rows="20" name="qnaContent">
									${qnaModify.content}
								</textarea>
							</td>
						</tr>
					</tbody>
					<!-- QNA 첨부파일 및 옵션 -->
					<tbody id="qnaFileTbody">
						<tr class="qna-file-row">
							<th class="col-2 qna-file-head">FILE</th>
							<td class="qna-file-data" style="text-align: left;">
								<input type="file" name="qna-file-name" id="fileName" style="display: inline-block;">
								<span class="qna-file-option" style="display: inline-block;">
									<a id="addFileForm" class="form-control"><i class="fa fa-plus"></i></a>
								</span>
								<span id="removeSpan" class="qna-file-option" style="display: none;">
									<a id="removeFileForm" class="form-control"><i class="fa fa-minus"></i></a>
								</span>
							</td>
						</tr>
					</tbody>
					<tbody>
						<tr class="qna-secure-row">
							<th class="col-2 qna-secure-head">SECRET</th>
							<td class="qna-secure-data" style="text-align: left;">
								<input type="radio" name="qnaSecure" id="qnaSecure0" value="0" checked>
								<label for="qnaSecure0">공개</label>
								<input type="radio" name="qnaSecure" id="qnaSecure1" value="1">
								<label for="qnaSecure1">비공개</label>
							</td>
						</tr>
						<tr class="qna-pwd-row">
							<th class="col-2 qna-pwd-head">PASSWORD</th>
							<td class="qna-pwd-data" style="text-align: left;">
								<input type="password" name="qnaPwd" placeholder="비밀번호 설정" class="form-control" id="qnaPwSet" disabled>
							</td>
						</tr>
					</tbody>
				</table>
				<!-- QNA 버튼 -->
				<div>
					<button type="button" class="btn btn-default btn-lg" onclick="modifyQna(this.form)">수정</button>
					<button type="button" class="btn btn-default btn-lg" onclick="qnaListBtn()">취소</button>
				</div>
			</div>
		</form>
	</div>
</div>