<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<table class="table table-hover">
				<tbody class="notice_title">
					<tr>
						<th class='col-sm-1'><input id="allCheck" type="checkbox" onclick="allChk(this);"/></th>
						<th class='col-sm-1'>No.</th>
						<th class='col-sm-6' style="text-align: left;">TITLE</th>
						<th class='col-sm-1'>NAME</th>
						<th class='col-sm-1'>DATE</th>
						<th class='col-sm-1'>VIEW</th>
					</tr>
				</tbody>
				<!-- 글 등록-->
		<div class="insert_btn" align="right">
			<button type="button" class="btn btn-default" onclick="location.href='<c:url value='/comu/notice/adminregister.jsp'/>'">글 등록</button>
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
			<button type="button" class="btn btn-default" onclick="location.href='<c:url value='/comu/notice/register.jsp'/>'">선택한 글 삭제</button>
		</div>
		
					<!--체크박스..
						<script>
							function allChk(obj){
							      var chkObj = document.getElementsByName("RowCheck");
							      var rowCnt = chkObj.length - 1;
							      var check = obj.checked;
							      if (check) {﻿
							          for (var i=0; i<=rowCnt; i++){
							           if(chkObj[i].type == "checkbox")
							               chkObj[i].checked = true; 
							          }
							      } else {
							          for (var i=0; i<=rowCnt; i++) {
							           if(chkObj[i].type == "checkbox"){
							               chkObj[i].checked = false; 
							           }
							          }
							      }
							  } 
							  function fn_userDel(){

								  var userid = "";
								  var memberChk = document.getElementsByName("RowCheck");
								  var chked = false;
								  var indexid = false;
								  for(i=0; i < memberChk.length; i++){
								   if(memberChk[i].checked){
								    if(indexid){
								      userid = userid + '-';
								    }
								    userid = userid + memberChk[i].value;
								    indexid = true;
								   }
								  }
								  if(!indexid){
								   alert("삭제할 사용자를 체크해 주세요");
								   return;
								  }
								  document.userForm.delUserid.value = userid;     

								  var agree=confirm("삭제 하시겠습니까?");
								     if (agree){
								   document.userForm.execute.value = "userDel";
								     document.userForm.submit();
								     } 
							</script> -->
							
<!-- PAGING -->
		<div class="comu_paging">
		  <ul class="pagination">
		    <li>
		      <a href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <li><a href="#">1</a></li>
		    <li><a href="#">2</a></li>
		    <li><a href="#">3</a></li>
		    <li><a href="#">4</a></li>
		    <li><a href="#">5</a></li>
		    <li>
		      <a href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</div>
</div>
