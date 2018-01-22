<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<c:url value='/public/css/comu.css' />">
<script src="<c:url value='/public/js/comu.js'/>"></script>
    
<div class="container-fluid common-body-container">
	<div class="row">
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
		
		<div class="col-sm-9 ml-sm-auto col-md-10 pt-3 common-right-body">
			<div class="common-right-title">
				<p class="h3">NOTICE</p>
			</div>
			<div class="common-inner-body">
				<div class="table-responsive" id="notice_read">
			<table class="table table-sm">
				<thead>
   					 <tr>
				   	  <th scope="col"><input type="checkbox" aria-label="Checkbox for following text input"/></th>
				      <th scope="col">No.</th>
				      <th scope="col" style="text-align: left;">TITLE</th>
				      <th scope="col">NAME</th>
				      <th scope="col">DATE</th>
				      <th scope="col">VIEW</th>
				    </tr>
				 </thead>
			
		
				<tbody class="notice_contents">
					<c:forEach var="notice" items="${noticeList}">
						<tr>
							<td>${notice.num}</td>
							<td style="text-align: left;"><a href="javascript:readNotice('${notice.num}')">${notice.title}</a></td>
							<td>${notice.name}</td>
							<td>${notice.indate}</td>
							<td>${notice.count}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
					<!-- 글 등록-->
		<div class="insert_btn" align="left">
			<button type="button" class="btn btn-outline-danger" onclick="location.href='<c:url value='/comu/notice/adminlist.jsp'/>'">목록</button>
		</div>
		</div>
		<div class="insert_btn" align="right">
			<button type="button" class="btn btn-outline-danger" onclick="location.href='<c:url value='/comu/notice/adminmodify.jsp'/>'">수정</button>
			<button type="button" class="btn btn-outline-danger" onclick="location.href='<c:url value='/comu/notice/adminlist.jsp'/>'">삭제</button>
		</div>
		</div>
<!-- PAGING -->
		
			</div>
		</div>
	</div>
</div>
		

