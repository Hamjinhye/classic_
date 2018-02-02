<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/public/css/order.css' />">
<script src="<c:url value='/public/js/order.js'/>"></script>
</head>
<body>
<div id="contents" class="order_list_body">
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
						<input type="text" id="search_start_date" class="datepicker form-control">
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
					<th>주문번호</th>
					<th>상품정보</th>
					<th>수량</th>
					<th>상품구매금액</th>
					<th>배송상태</th>
					<th>선택</th>
				</tr>
			</tbody>
			<tbody class="list_contents">
				<c:forEach items="${orderList}" var="list">
					<tr>
						<td><a href="<c:url value='/user/order/detail.do?num=${list.mem_num}&order_num=${list.order_num}'/>">${list.order_num}</a></td>
						<td>
							<img alt="images" src=""  align="left" hspace="10">
							<label><a href="<c:url value='/detail.do?num=${list.product_num}' />">${list.g_name}</a></label><br>
							[옵션]색상:<strong>${list.g_color}</strong>, 사이즈:<strong>${list.g_size}</strong>
						</td>
						<td>1(임시)</td>
						<td>${list.payment}</td>
						<td>
							<c:if test="${list.deliv_state==0}"><strong>배송준비</strong></c:if>
							<c:if test="${list.deliv_state==1}"><strong>배송중</strong><br>(송장번호:${list.deliv_num})</c:if>
							<c:if test="${list.deliv_state==2}"><strong>배송완료</strong><br>(송장번호:${list.deliv_num})</c:if>
							<c:if test="${list.deliv_state==3}"><strong>구매확정</strong></c:if>
							
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
									<button type="button" class="btn btn-default">주문취소</button>
								</c:otherwise>
							</c:choose>
							</td>
						</c:if>
						<c:if test="${list.deliv_state==0}">
							<td>결제대기</td>
						</c:if>
						<c:if test="${list.deliv_state==1}">
							<td>
								<button type="button" class="btn btn-default" 
									onclick="window.open('https://www.doortodoor.co.kr/parcel/pa_004.jsp','CJ대한통운 배송조회','width=430,height=550,location=no,status=no,scrollbars=yes');">
										배송조회
								</button><br>
								<button type="button" class="btn btn-default">구매확정</button>
							</td>
						</c:if>
						<c:if test="${list.deliv_state==2}">
							<td>
								<button type="button" class="btn btn-default">구매확정</button><br>
								<button type="button" class="btn btn-default">리뷰작성</button><br>
								<button type="button" class="btn btn-default">교환/반품</button>
							</td>
						</c:if>
						<c:if test="${list.deliv_state==3}">
							<td>
								<button type="button" class="btn btn-default">리뷰작성</button>
							</td>
						</c:if>
					</tr>
				</c:forEach>		
			</tbody>
		  </table>
		</div>
		
		<div>
			<c:import url="/common/paging.jsp"></c:import>
		</div>
	</div>
</div>
