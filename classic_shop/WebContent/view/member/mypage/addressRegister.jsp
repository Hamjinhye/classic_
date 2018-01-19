<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/public/css/member.css' />">
<script src="<c:url value='/public/js/member.js'/>"></script>
</head>
<body>    
<div class="member_body">
	<div class="container">
		<div class="address_wrap">
			<h2 class="addressBookTitle">ADDRESS BOOK</h2>
				<form name="addrForm" method="post" action="<c:url value='/user/address/register.do'/>">
					<div>
						<div class="boardWrite">
							<table class="table table-bordered addressBook_table">
								<tbody>
<!-- 										배송지명x
									<tr>
										<th scope="row">배송지명</th>
										<td>
											<div class="col-sm-3">
												<input type="text" name="addressBook" value="" class="form-control">
											</div>
										</td>
									</tr>
									<tr>
										성명x
										<th scope="row">성명</th>
										<td>
											<div class="col-sm-3">
												<input type="text" name="name" value="" class="form-control">
											</div>
										</td>
									</tr> -->
									<tr>
										<!-- 주소 -->
										<th scope="row">주소</th>
										<td>
											<div class="zip_code_wrap">
												<div class="col-sm-3">
													<input type="text" name="addrZip" class="form-control">
												</div>
												<button class="btn btn-default" type="button">우편번호</button>

											</div>
											
											<div class="addrbase_wrap">
												<div class="col-sm-5">
													<input type="text" name="addrBase" class="form-control">
												</div>
											</div>

											<div class="addrdetail_wrap">
												<div class="col-sm-5">
													<input type="text" name="addrDetail" class="form-control">
												</div>
											</div>
										</td>
									</tr>
									<!-- <tr>
										전화x
										<th scope="row">일반전화</th>
										<td>
											<div class="col-sm-3">
												<input type="text" name="name" value="" class="form-control">
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">휴대전화</th>
										<td>
											<div class="col-sm-3">
												<input type="text" name="name" value="" class="form-control">
											</div>
										</td>
									</tr> -->
								</tbody>
							</table>
						</div>
						<input type="hidden" name="memNum" value="${loginMem.num}">
						<!-- 버튼 -->
						<div class="modify_btn_group">
							<button class="btn btn-default" type="button" onclick="addrJson(this.form)">등록</button>
							<button class="btn btn-default" type="button" onclick="location.href='<c:url value='/user/address.do?num=${loginMem.num}'/>'">취소</button>
						</div>
					</div>
				</form>
		</div>
	</div>
</div>


<script>
	var addrJson = function(addrForm){
		var mem_num = addrForm.memNum.value;
		var zip_code = addrForm.addrZip.value;
		var base_addr = addrForm.addrBase.value;
		var detail_addr = addrForm.addrDetail.value;
		var url = "/classic_shop/user/address/register.do"
		var method = "POST";
		var data = "mem_num="+mem_num+"&zip_code="+zip_code+"&base_addr="+base_addr+"&detail_addr="+detail_addr;
		console.log(data);
		var http = new XMLHttpRequest();
		http.open(method, url, true);
		http.onreadystatechange = function(){
			if(this.readyState==4 && this.status==200){
				var register = JSON.parse(this.response)["register"];
				if(register){
					alert("등록했당");
					location.href="/classic_shop/user/address.do?num="+mem_num;
					
				}else{
					alert("다시 시도");
				}
			}
		}
		http.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=UTF-8");
		/* charset=UTF-8 을 추가하지 않으면 ajax 전송시 한글이 깨짐...... */
		http.send(data);
	}

</script>