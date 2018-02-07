<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/public/css/order.css' />">
<script src="<c:url value='/public/js/order.js'/>"></script>
</head>
<body>
<script>
$(function(){
    $(".datepicker").datepicker();
});
</script>
<div id="contents" class="order_list_body container">
	<h2 id="orderlistTitle">ORDER LIST</h2>
	<div id="serchContents">
		<div class="searchDay">
			<div class="serchBtn">
		 	 	<button type="button" id="todayBtn" class="btn btn-default">오늘</button>
		 		<button type="button" class="btn btn-default">일주일</button>
		 		<button type="button" class="btn btn-default">1개월</button>
		 		<button type="button" class="btn btn-default">3개월</button>
		 		<button type="button" class="btn btn-default">6개월</button>	
	 		</div>
	 		<form class="form-inline">
				<div class="form-group searchCal">
					<div class="input-group">
						<input type="text" id="search_start_date" class="datepicker form-control">
						<div class="input-group-addon  glyphicon glyphicon-calendar"></div>
					</div>
				</div>
				 ~ 
				<div class="form-group searchCal">
					<div class="input-group">
						<input type="text" id="search_end_date" class="datepicker form-control">
						<div class="input-group-addon  glyphicon glyphicon-calendar"></div>
					</div>
				</div>
				<button type="submit" class="btn btn-default">조회</button>
			</form>
		</div>
		<h4 class="text-left">
			<strong>총 주문건 수</strong> <span class="badge">${totalRecord}건</span>
		</h4>
		<div id="list"  class="table-responsive">
		  <table class="table table-hover">
		  	<tbody class="list_title">
			    <tr>
			    	<th>No.</th>
					<th>주문번호</th>
					<th>상품정보</th>
					<th>상품구매금액</th>
					<th>배송상태</th>
					<th>선택</th>
				</tr>
			</tbody>
			<tbody class="list_contents">
				<c:forEach items="${orderList}" var="list">
					<tr>
						<td>${list.row_num}</td>
						<td><a href="<c:url value='/user/order/detail.do?num=${list.mem_num}&order_num=${list.order_num}'/>">${list.order_num}</a></td>
						<td>
							<img alt="images" src=""  align="left" hspace="10">
							<label><a href="<c:url value='/detail.do?num=${list.product_num}' />">${list.g_name}</a></label><br>
							[옵션]색상:<strong>${list.g_color}</strong>, 사이즈:<strong>${list.g_size}</strong>
						</td>
						<td>${list.payment}</td>
						<td>
							<c:if test="${list.deliv_state==0}"><strong>배송준비</strong></c:if>
							<c:if test="${list.deliv_state==1}"><strong>배송중</strong><br>(송장번호:${list.deliv_num})</c:if>
							<c:if test="${list.deliv_state==2}"><strong>배송완료</strong><br>(송장번호:${list.deliv_num})</c:if>
							<c:if test="${list.deliv_state==3}"><strong>구매확정</strong><br>(송장번호:${list.deliv_num})</c:if>
							
						</td>
						<c:if test="${list.deliv_state==0}">
							<td>
							<c:choose>
								<c:when test="${list.order_state==-2}">
									<p style="color:red;">주문 취소건</p>
								</c:when>
								<c:when test="${list.order_state==-1}">
									<p style="color:red;">교환/반품건</p>
								</c:when>
								<c:otherwise>
									<form action="<c:url value='/order/cancel.do'/>" method="post" name="cancelUpdateForm">
										<input type="hidden" name="order_state" value="-2"/>
										<button type="button" class="btn btn-default cancelBtn" onclick="cancelBtn()">주문취소</button>
									</form>
								</c:otherwise>
							</c:choose>
							</td>
						</c:if>
						<c:if test="${list.deliv_state==1}">
							<td>
								<button type="button" class="btn btn-primary">구매확정</button><br>
								<button type="button" class="btn btn-default" 
									onclick="window.open('https://www.doortodoor.co.kr/parcel/pa_004.jsp','CJ대한통운 배송조회','width=430,height=550,location=no,status=no,scrollbars=yes');">
										배송조회
								</button>
							</td>
						</c:if>
						<c:if test="${list.deliv_state==2}">
							<td>
								<button type="button" class="btn btn-primary">구매확정</button><br>
								<button type="button" class="btn btn-default"  
									data-toggle="modal" data-target="#reviewModal">리뷰작성</button><br>
								<button type="button" class="btn btn-default"
									data-toggle="modal" data-target="#csModal">교환/반품</button>
							</td>
						</c:if>
						<c:if test="${list.deliv_state==3}">
							<td>
								<button type="button" class="btn btn-default"  
									data-toggle="modal" data-target="#reviewModal">리뷰작성</button>
							</td>
						</c:if>
					</tr>
				</c:forEach>		
			</tbody>
		  </table>
		</div>
		<!-- 리뷰작성 modal -->
		<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">리뷰 작성</h4>
		      </div>
		      <div class="modal-body">
		      	<fieldset>
		      		<form name="reviewsRegist" action="<c:url value='/reviews/regist'/>" method="post">
		      			<div class="form-group row">
							<label class="col-form-label col-sm-2">별점</label>
							<div class="col-sm-10">
								<div class="star-group btn-group btn-group-toggle d-none" data-toggle="buttons">
									<label class="btn">
										<input type="radio" name="star" value="1">
										<span class="fa fa-star"></span>
									</label>
									<label class="btn">
										<input type="radio" name="star" value="2">
										<span class="fa fa-star"></span>
									</label>
									<label class="btn active">
										<input type="radio" name="star" value="3" checked>
										<span class="fa fa-star"></span>
									</label>
									<label class="btn">
										<input type="radio" name="star" value="4">
										<span class="fa fa-star"></span>
									</label>
									<label class="btn">
										<input type="radio" name="star" value="5">
										<span class="fa fa-star"></span>
									</label>
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label class="form-col-label col-sm-2">내용</label>
							<div class="col-sm-10">
								<textarea class="form-control" rows="3" cols="" name="content"></textarea>
							</div>
						</div>
		      		</form>
		      	</fieldset>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary">저장</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- 교환/반품 modal -->
		<div class="modal fade" id="csModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">교환/반품 신청</h4>
		      </div>
		      <div class="modal-body text-left">
		      	<fieldset>
		      		<form name="reviewsRegist" action="<c:url value='/reviews/regist'/>" method="post">
						<div role="tabpanel">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs" role="tablist">
							  <li role="presentation" class="active"><a href="#trade" aria-controls="trade" role="tab" data-toggle="tab"><h6>교환신청</h6></a></li>
							  <li role="presentation"><a href="#return" aria-controls="return" role="tab" data-toggle="tab"><h6>반품신청</h6></a></li>
							</ul>
							
							<!-- Tab panes -->
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane fade in active form-group" id="trade">
							    	<br>
									<h6><label for="exampleInputName2">사유선택: </label></h6>
  									<select class="form-control">
  										<option>단순변심</option>
  										<option>상품불량</option>
  										<option>배송지연</option>
  										<option>옵션 잘 못 선택함</option>
  									</select>
  									<h6><label style="color:red;">* 선회수 후 출고되므로 신청일로부터 약 7~14일정도 소요됩니다.</label></h6>
								</div>
								<div role="tabpanel" class="tab-pane fade" id="return">
									<br>
									<h6><label for="exampleInputName2">사유선택: </label></h6>
  									<select class="form-control">
  										<option>단순변심</option>
  										<option>상품불량</option>
  										<option>배송지연</option>
  										<option>옵션 잘 못 선택함</option>
  									</select>
  									<hr>
  									<h5><strong>환불계좌 정보입력</strong></h5>
  									<h6><label for="exampleInputName2">은행명: </label></h6>
  									<input class="form-control">
  									<h6><label for="exampleInputName2">계좌번호: </label></h6>
  									<input class="form-control">
  									<h6><label for="exampleInputName2">예금주: </label></h6>
  									<input class="form-control">
								</div>
							</div>
						</div>
		      		</form>
		      	</fieldset>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary">저장</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		<div>
			<c:import url="/common/paging.jsp"></c:import>
		</div>
	</div>
</div>
