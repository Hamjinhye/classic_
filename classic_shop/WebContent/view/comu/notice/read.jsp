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
					<li><a href="<c:url value='/community/notice.do' />">notice</a></li>
					<li><a href="<c:url value='/community/faq.do' />">FAQ</a></li>
				</ul>
		</div>
	</div>
	<div class="comu_body">
		<div class="container">
			<p class="comu_title">NOTICE</p>
			<div class="table-responsive">
				<table class="table table-condensed">
					<tr>
						<th class='col-2'>TITLE</th>
						<td class='col-6'>${noticeDTO.title}</td>
						<th class='col-2'>NAME</th>
						<td class='col-6'>${noticeDTO.name}</td>
					</tr>
					<tr>
						<th class='col-sm-1'>DATE</th>
						<td class='col-sm-6'>${noticeDTO.indate}</td>
						<th class='col-sm-1'>VIEW</th>
						<td class='col-sm-6'>${noticeDTO.count}</td>
					</tr>
				</table>
				<table class="table table-bordered">
					<tr class='notice_contents'>
						<td>${noticeDTO.content}</td>
					</tr>
				</table>
			</div>
			<div class="notice_list_btn" align="left">
				<button type="button" class="btn btn-default" onclick="noticeListBtn()">목록</button>
			</div>
			<div class="notice_btn_group" align="right">
				<button type="button" class="btn btn-default" onclick="modifyNoticeForm('${noticeDTO.num}')">수정</button>
				<button type="button" class="btn btn-default" onclick="removeNotice('${noticeDTO.num}')">삭제</button>
			</div>
			
		</div>
	</div> 