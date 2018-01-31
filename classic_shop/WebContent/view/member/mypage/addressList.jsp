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
			<form action="/user/address/remove.do" method="post" name="delForm">
				<table class="table address_table">
					<tbody>
						<tr>
							<th class="col-sm-1">
								<label>
									<input name="checkAll" id="th_checkAll" type="checkbox" onclick="checkAll()">
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
										<input name="checkRow" type="checkbox" value="${addr.num}">
									</label>
								</td>
								<td>${addr.num }</td>
								<td>${addr.zip_code} ${addr.base_addr} ${addr.detail_addr}</td>
								<!-- onclick="addrJson(this.form)" -->
								<td><button class="btn btn-default" type="button" onclick="addrDelBtn(${addr.mem_num},${addr.num})">삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
 			<div class="adress_btn_group">
				<button class="btn btn-default" data-toggle="modal" data-target="#myModal" type="button">주소 등록</button>
			</div>
			<!-- 모달 -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog modal-lg">
					<!-- 모달 내용 -->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">X</button>
							<h4 class="modal-title">주소 등록</h4>
						</div>
						<form action="/user/address/register.do" method="post" name="addrForm">
							<div class="modal-body">
								<div class="zip_code_wrap">
									<div class="col-sm-3 zip_code_input">
										<input name="addrZip" type="text" id="sample6_postcode" class="form-control" placeholder="우편번호">
									</div>
									<button onclick="sample6_execDaumPostcode()" class="btn btn-default" type="button">우편번호</button>
								</div>
								<div class="addrbase_wrap">
									<div class="col-sm-5 addrbase_input">
										<input name="addrBase" type="text" id="sample6_address" class="form-control" placeholder="주소">
									</div>
									<div class="col-sm-5 addrdetail_input">
										<input name="addrDetail" type="text" id="sample6_address2" class="form-control" placeholder="상세주소">
									</div>
								</div>
								<!-- 우편번호 API -->
								<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
								<input type="hidden" name="memNum" value="${loginMem.num}">
								<div class="modify_btn_group">
									<button class="btn btn-default" type="button" onclick="addrJson(this.form)">등록</button>
									<button class="btn btn-default" type="button" onclick="location.href='<c:url value='/user/address.do?num=${loginMem.num}'/>'">취소</button>
								</div>
							</div>
						</form>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>				
	</div>
</div>