<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/public/css/member.css' />">
<script src="<c:url value='/public/js/member.js'/>"></script>
<script src="<c:url value='/public/js/comu.js'/>"></script>
</head>
<body>	
<div class="member_body">
	<div class="container">
		<!-- My Page -->
		<div class="mypage_wrap">
			<div class="mypage_info">
				<h2 class="mypageTitle">MY PAGE</h2>
				<ul>
					<li> <span class="mypageInfoLabel">회원등급</span>
						<div class="value"><strong>Lv. ${memDTO.grade}</strong></div>
					</li>
					<li> <span class="mypageInfoLabel">적립금</span>
						<div class="value"><strong>0원</strong></div>
					</li>
					<li> <span class="mypageInfoLabel">쿠폰</span>
						<div class="value"><strong>0장</strong></div>
					</li>
					<li> <span class="mypageInfoLabel">구매이력</span>
						<div class="value"><strong>0건</strong></div>
					</li>
				</ul>
				<div class="benefit_group">
					<div class="benefitInfo"><strong>${memDTO.id} </strong>님의<br> 혜택정보</div>
					<div class="benefitprint">혜택 정보 출력</div>
				</div>
			</div>
			<div class="mypage_btn_group">
				<button class="btn btn-default" type="button" onclick="location.href='<c:url value='/user/mypage/modify.do?num=${memDTO.num}'/>'">회원정보 수정</button>
				<button class="btn btn-default" type="button" onclick="location.href='<c:url value='/user/address.do?num=${memDTO.num}'/>'">배송주소록 관리</button>
			</div>
		</div>
		
		<!-- Oder List-->
		<div class="orderList_wrap">
			<div class="orderList_titleandbtn">
				<h2 class="orderListTitle">ORDER LIST</h2>
				<p>
					<a href="<c:url value='/order/list.do?num=${loginMem.num}' />">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
					</a>
				</p>
			</div>
			<table class="table orderList_table">
				<thead>
					<tr>
						<th class="col-sm-1">No.</th>
						<th class="col-sm-2">주문번호</th>
						<th class="col-sm-1">이미지</th>
						<th class="col-sm-1">상품명</th>
						<th class="col-sm-1">옵션</th>
						<th class="col-sm-1">수량</th>
						<th class="col-sm-1">판매가</th>
						<th class="col-sm-1">할인금액</th>
						<th class="col-sm-1">배송료</th>
						<th class="col-sm-1">합계</th>
						<th class="col-sm-2">주문상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${orderList}" var="list">
						<tr>
							<td>${list.row_num}</td>
							<td><a href="<c:url value='/user/order/detail.do?num=${list.mem_num}&order_num=${list.order_num}'/>">${list.order_num}</a></td>
							<td><img alt="images" src="" align="left" hspace="10"></td>
							<td><a href="<c:url value='/detail.do?num=${list.product_num}' />">${list.g_name}</a></td>
							<td>색상:<strong>${list.g_color}</strong><br>사이즈:<strong>${list.g_size}</strong></td>
							<td>1개</td>
							<td>${list.order_money} 원</td>
							<td>(-) ${list.order_money-list.payment} 원</td>
							<td><!-- 배송비가 10만원 이상일 때 무료, 아니면 2500원 -->
								<c:choose>
									<c:when test="${list.order_money>99999}">
										무료
									</c:when>
									<c:otherwise>2,500원</c:otherwise>
								</c:choose>
							</td>
							<td>${list.payment}</td>
							<td>
								<c:choose>
									<c:when test="${list.order_state==-2}">
										<p style="color:red;">주문 취소건</p>
									</c:when>
									<c:when test="${list.order_state==-1}">
										<p style="color:red;">교환/반품건</p>
									</c:when>
									<c:when test="${list.order_state==0}">
										<p>결제대기</p>
									</c:when>
									<c:when test="${list.order_state==1}">
										<p>결제완료</p>
									</c:when>
									<c:when test="${list.order_state==2}">
										<p>주문확인</p>
									</c:when>
									<c:when test="${list.order_state==3}">
										<p>주문완료</p>
									</c:when>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<!-- My Posting -->
		<div class="myPosting_wrap">
			<div class="myPosting_titleandbtn">
				<h2 class="myPostingTitle">MY POSTING</h2>
				<p>
					<a href="<c:url value='/user/mypage/myposting.do?num=${memDTO.num}'/>">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
					</a>
				</p>
			</div>
			<div class="reviewList">
				<div class="reviewList_wrap">
					<div class="reviewListTitle">REVEIW</div>
					<table class="table reviewList_table">
						<thead>
							<tr>
								<th class="col-sm-1">No.</th>
								<th class="col-sm-4">제목</th>
								<th class="col-sm-1">작성자</th>
								<th class="col-sm-1">작성일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="col-sm-1">1</td>
								<td class="col-sm-4"><a href="#">옷 예뻐요</a></td>
								<td class="col-sm-1">김기김</td>
								<td class="col-sm-1">18/01/01</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="qnaList">
				<div class="qnaList_wrap">
					<div class="qnaListTitle">QNA</div>
					<table class="table qnaList_table">
						<thead>
							<tr>
								<th class="col-sm-1">No.</th>
								<th class="col-sm-4">제목</th>
								<th class="col-sm-1">작성자</th>
								<th class="col-sm-1">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${memTotalRecord == 0}">
									<tr>
										<td colspan="4" style="text-align: center;">작성된 글이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="qna" items="${memQnaList}" end="4">
										<tr>
											<td class="col-sm-1">${qna.row_num}</td>
											<td class="col-sm-4">
												<a href="<c:url value='/community/qna/read.do?num=${qna.num}'/>">
													<c:choose>
														<c:when test="${qna.subject==0}">상품 문의</c:when>
														<c:when test="${qna.subject==1}">배송 문의</c:when>
														<c:when test="${qna.subject==2}">배송 전 변경</c:when>
														<c:when test="${qna.subject==3}">입금 문의</c:when>
														<c:when test="${qna.subject==4}">교환/환불 문의</c:when>
														<c:when test="${qna.subject==5}">기타 문의</c:when>
													</c:choose>
												</a>
												<span class="glyphicon glyphicon-camera" aria-hidden="true"></span>
												<c:if test="${qna.secure==1}">
													<span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
												</c:if>
											<td class="col-sm-1">${qna.name}</td>
											<td class="col-sm-1">${qna.indate}</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>					
		</div>
	</div>
</div>
