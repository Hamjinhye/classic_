<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/public/css/member.css' />">
<script src="<c:url value='/public/js/member.js'/>"></script>
</head>
<body>   
<div class="member_body">
	<div class="container">
		<div class="address_wrap">
		${addrList}
			<h2 class="addressTitle">ADRESS LIST</h2>
			<table class="table address_table">
			
				<tbody>
					<tr>
						<th class="col-sm-1">
							<label>
								<input type="checkbox" id="blankCheckbox" value="option1" aria-label="checkbox">
							</label>
						</th>
						<th class="col-sm-1">No.</th>
						<th class="col-sm-3">주소</th>
						<th class="col-sm-1">삭제</th>
					</tr>
				</tbody>
				<tbody>
					<c:forEach var="addr" items="${addrList}">
						<tr>
							<td>
								<label>
									<input type="checkbox" id="blankCheckbox" value="${addr.num}" aria-label="checkbox">
								</label>
							</td>
							<td>${addr.num }</td>
							<td>${addr.zip_code} ${addr.base_addr} ${addr.detail_addr}</td>
							<td><button class="btn btn-default" type="button" onclick="addrDelBtn(${addr.mem_num},${addr.num})">삭제</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
 			<div class="adress_btn_group">
				<button class="btn btn-default" type="button" onclick="location.href='<c:url value='/user/address/register.do'/>'">주소 등록</button>
			</div>
		</div>
<%-- 		<!-- RECENT ADDRESS -->
		<div class="recentaddr_wrap">
			<h2 class="addressTitle">RECENT ADDRESS</h2>
			<table class="table address_table">
				<thead>
					<tr>
						<th class="col-sm-1">
							<label>
								<input type="checkbox" id="blankCheckbox" value="option1" aria-label="checkbox">
							</label>
						</th>
						<th class="col-sm-1">No.</th>
						<th class="col-sm-3">주소</th>
						<th class="col-sm-1">연락처</th>
						<th class="col-sm-1">수령인</th>
						<th class="col-sm-1">상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="addr" items="${addrBookList}">
						<tr>
							<td>
								<label>
									<input type="checkbox" id="blankCheckbox" value="option1" aria-label="checkbox">
								</label>
							</td>
							<td>${addr.num }</td>
							<td><a href="#">${addr.zip_code} ${addr.base_addr} ${addr.detail_addr}</a></td>
							<td>010-2222-3333</td>
							<td>나야나</td>
							<td>상태</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
 			<div class="recentadress_btn_group">
				<button class="btn btn-default" type="button">전체 선택</button>
				<button class="btn btn-default" type="button">선택 삭제</button>
				<button class="btn btn-default" type="button">기본 주소로 등록</button>
			</div>
		</div> --%>					
	</div>
</div>

<!-- member.js로 이동함 -->
<script>
 	var addrDelBtn = function(mem_num,addr_num){
		var url="http://localhost:9999/classic_shop/user/address/remove.do?mem_num="+mem_num+"&addr_num="+addr_num;
		var method="DELETE";
		var http= new XMLHttpRequest();
		http.onreadystatechange=function(){
			if(this.readyState==4 && this.status==200){
				var delete_json = JSON.parse(this.response);
				console.log(delete_json["delete"]);
				if(delete_json["delete"]){
					alert("삭제성공");
					location.reload();
				}else{
					alert("삭제 실패");
				}
			}
		}
	}
	http.open(method,url,true);
	http.send();
</script>
