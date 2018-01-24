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
	<p class="comu_title">FAQ</p>
		<div id="faqAccordion">
			<c:forEach var="faq" items="${faqList}">
				<h3 id="faq_title">${faq.q_title}</h3>
				<div>
					<p id="faq_contents">${faq.a_content}</p>
				</div>
			</c:forEach>
		</div>
</div>