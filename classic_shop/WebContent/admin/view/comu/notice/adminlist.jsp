<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="<c:url value='/public/css/comu.css' />">
<script src="<c:url value='/public/js/comu.js'/>"></script>
    
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
	<p class="comu_title">NOTICE</p>
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
				
				<!-- 글 등록-->
		<div class="insert_btn" align="right">
			<button type="button" class="btn btn-outline-danger" onclick="location.href='<c:url value='/comu/notice/adminregister.jsp'/>'">글 등록</button>	
		</div>

				<tbody class="notice_contents">
					<c:forEach var="notice" items="${noticeList}">
						<tr>
							<td><input﻿ name="RowCheck" type="checkbox" value="${notice.user_id}"/></td>
							<td>${notice.num}</td>
							<td style="text-align: left;"><a href="javascript:readNotice('${notice.num}')">${notice.title}</a></td>
							<td>${notice.name}</td>
							<td>${notice.indate}</td>
							<td>${notice.count}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="insert_btn" align="left">
			<button type="button" class="btn btn-outline-danger" onclick="location.href='<c:url value='/comu/notice/register.jsp'/>'">선택한 글 삭제</button>
		</div>
		
					
<!-- PAGING -->

  <ul class="pagination justify-content-center">
    <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1">Previous</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#">Next</a>
    </li>
  </ul>


