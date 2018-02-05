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
<!-- COMMUNITY BODY -->
<div class="comu_body">
	<p class="comu_title">NOTICE</p>
		<div class="table-responsive notice_div">
			<table class="table table-hover">
				<tbody class="notice_list_title">
					<tr>
						<th class='col-sm-1'>No.</th>
						<th class='col-sm-6' style="text-align: left;">TITLE</th>
						<th class='col-sm-1'>NAME</th>
						<th class='col-sm-1'>DATE</th>
						<th class='col-sm-1'>VIEW</th>
					</tr>
				</tbody> <!-- switch를 선언하는 절은 choose, when은 case, otherwise는 default -->

				<tbody class="notice_list_contents">
					<c:forEach var="notice" items="${noticeList}">
						<tr>
							<td>${notice.num}</td>
							<td style="text-align: left;">
								<a href="javascript:readNotice('${notice.num}')">${notice.title}</a>
									<%-- <a href="<c:url value='/community/notice/read.do?num=${notice.num}'/>">
								</a> --%>
								<span class="glyphicon glyphicon-camera" aria-hidden="true"></span>
							</td>
							<td>${notice.name}</td>
							<td>${notice.indate}</td>
							<td>${notice.count}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
<!-- PAGING -->
<div id="noticePagingContainer">
	<jsp:include page="/common/paging.jsp"/>
</div>
</div>
