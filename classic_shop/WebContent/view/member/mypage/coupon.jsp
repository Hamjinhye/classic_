<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" href="<c:url value='/public/css/member.css' />">
<script src="<c:url value='/public/js/member.js'/>"></script>
</head>
<body>   
<div class="member_body">
	<div class="container">
		<div class="coupon_wrap">
			<h2 id="couponTitle">COUPON</h2>
			<table class="table coupon_table">
				<thead>
					<tr>
						<th class="col-sm-1">No.</th>
						<th class="col-sm-2">쿠폰명</th>
						<th class="col-sm-5">내용</th>
						<th class="col-sm-2">사용가능기간</th>
						<th class="col-sm-1">사용여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="couponlog" items="${couponLogList}">
						<tr>
							<td>${couponlog.c_num}</td>
							<td>${couponlog.name}</td>
							<td>${couponlog.content}</td>
							<td>${couponlog.start_date}~${couponlog.end_date}</td>
							<td>
							<c:choose>
								<c:when test="${couponlog.c_state==0}">사용안함</c:when>
								<c:when test="${couponlog.c_state==1}">사용함</c:when>
							</c:choose>
							</td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="couponForm_wrap">
			<div class="couponFormTitle">쿠폰 등록하기</div>
			<form class="couponForm">
				<c:forEach var="couponBtn" items="${couponList }">
				<div class="couponFormGroup">
					<c:choose>
<%-- 						<c:when test="${couponBtn.allcount>927 }">
							<button class="btn btn-default" type="button" disabled="disabled">${couponBtn.name } 발급한수량:${couponBtn.allcount}  발급된수량:${couponBtn.num }</button>
						</c:when> --%>
						<c:when test="${couponBtn.allcount<=1000}">
<%-- 							<input type="text" name="logNum" value="${couponBtn.log_num}"> --%>
							<button class="btn btn-default" type="button" onclick="couponJson(this.form)"> ${couponBtn.name } 발급한수량:${couponBtn.allcount}  발급된수량:${couponBtn.num }</button>
						</c:when>
					</c:choose>
				</div>
				</c:forEach>
				<input type="hidden" name="memNum" value="${loginMem.num}">
				
				
			</form>
			<!-- <div class="couponFormTitle">쿠폰 등록하기</div>
			<form class="couponForm">
				<div class="couponFormGroup">
					<div class="col-sm-9">
						<input type="text" class="form-control" id="inputCouponName" placeholder="쿠폰명을 입력해 주세요.">
					</div>
					<button class="btn btn-default" type="button">쿠폰 등록</button>
				</div>
			</form> -->
			<div class="couponGuide_wrap">
				<p>쿠폰 이용안내</p>
				<div class="couponGuide">
					<div>
						<ol>
							<li class="item1">쿠폰 등록하기에서 쿠폰 버튼을 클릭하시면 온라인쿠폰으로 발급되어 사용이 가능합니다.</li>
							<li class="item2">쿠폰은 주문 시 1회에 한해 적용되며, 1회 사용 시 재 사용이 불가능합니다.</li>
						</ol>
					</div>
				</div>
			</div>
		</div>			
	</div>
</div>
<script>
var couponJson=function(couponForm){
	var method="POST";
	var url="/classic_shop/user/coupon/register.do";
	var memNum = couponForm.memNum.value;
	var logNum = couponForm.logNum.value;
	var check=true;
	console.log(memNum);

	if( !(logNum.trim() && Number(logNum.trim())>0 )){
		check=false;
		alert(data);

	}else if(check){
		var data="mem_num="+memNum+"&log_num="+logNum;
		alert(data);
		
		var http = new XMLHttpRequest();
		http.onreadystatechange = function(){
			if(this.readyState==4 && this.status==200){
				var register = JSON.parse(this.responseText)["register"];
				if(register){
					location.reload();
				}else{
					alert("등록 실패");
				}
			}
		}
		http.open(method, url, true);
		http.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=UTF-8;");
		http.send(data);
	}
}


</script>