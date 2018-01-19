<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/public/css/order.css' />">
<script src="<c:url value='/public/js/order.js'/>"></script>
</head>
<body>
<div class="order_list_body">
	<div id="contents">
		<h2 id="orderlistTitle">ORDER LIST</h2>
		<div id="serchContents">
			<div class="searchDay">
				<div class="serchBtn">
			 	 	<button type="button" class="btn btn-default">오늘</button>
			 		<button type="button" class="btn btn-default">일주일</button>
			 		<button type="button" class="btn btn-default">1개월</button>
			 		<button type="button" class="btn btn-default">3개월</button>
			 		<button type="button" class="btn btn-default">6개월</button>	
		 		</div>
				<div class="searchCal">
					<input type="text" name="startDate" value="" class="order_date_input">
					<button type="button" class="btn btn-default">
						<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
					</button> ~ 
					<input type="text" name="startDate" value="" class="order_date_input">
					<button type="button" class="btn btn-default">
						<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
					</button>
					<button class="btn btn-default">조회</button>
				</div>
			</div>
		</div>
	
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
						<td><a href="<c:url value='/view/order/detail.jsp'/>">${list.order_num}</a></td>
						<td>
							<img alt="images" src=""  align="left" hspace="10">
							<label><a href="#">${list.g_name}</a></label><br>
							[옵션]색상:<strong>${list.g_color}</strong>, 사이즈:<strong>${list.g_size}</strong>
						</td>
						<td>1(임시)</td>
						<td>${list.payment}</td>
						
						<td><!-- 배송상태 검사 -->
							<c:if test="${list.deliv_state==0}"><strong>배송준비</strong></c:if>
							<c:if test="${list.deliv_state==1}"><strong>배송중</strong><br>(송장번호:${list.deliv_num})</c:if>
							<c:if test="${list.deliv_state==2}"><strong>배송완료</strong><br>(송장번호:${list.deliv_num})</c:if>
							<c:if test="${list.deliv_state==3}"><strong>수취확인</strong></c:if>
							
						</td>
						<!-- 배송상태에 따른 버튼 출력 0배송준비 1배송중 2배송완료 3수취확인 -->

						<c:if test="${list.deliv_state==0}">
							<td>
							<c:choose>
								<c:when test="${list.order_state==-2}">
									<p style="color:red;">주문 취소건</p>
								</c:when>
								<c:when test="${list.order_state==-1 && list.deliv_state==2}">
									<p style="color:red;">교환/반품건</p>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-default">주문취소</button>
								</c:otherwise>
							</c:choose>
							
							</td>
						</c:if> <!-- 주문취소하면 버튼 사라져야 함 --> 
						
						<c:if test="${list.deliv_state==1}">
							<td>
								<button type="button" class="btn btn-default" 
									onclick="window.open('https://www.doortodoor.co.kr/parcel/pa_004.jsp','CJ대한통운 배송조회','width=430,height=550,location=no,status=no,scrollbars=yes');">
										배송조회
								</button><br>
								<button type="button" class="btn btn-default">수취확인</button>
							</td>
						</c:if>
						<c:if test="${list.order_state==1 && list.deliv_state==2}">
							<td>
								<button type="button" class="btn btn-default">수취확인</button><br>
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
		
		<div id="listPage">
			<nav>
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
			</nav>
		</div>
	</div>
</div>