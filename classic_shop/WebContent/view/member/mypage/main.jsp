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
					<a href="<c:url value='/user/order.do?num=${loginMem.num}' />">
						<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
					</a>
				</p>
			</div>
			<table class="table orderList_table">
				<thead>
					<tr>
						<th class="col-sm-1">No.</th>
						<th class="col-sm-2">이미지</th>
						<th class="col-sm-2">상품명</th>
						<th class="col-sm-1">옵션</th>
						<th class="col-sm-1">수량</th>
						<th class="col-sm-1">판매가</th>
						<th class="col-sm-1">적립금</th>
						<th class="col-sm-1">배송료</th>
						<th class="col-sm-1">합계</th>
						<th class="col-sm-2">주문상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>
							<img alt="images" src="" align="left" hspace="10">
						</td>
						<td><a href="#">상품명이야</a></td>
						<td>[옵션]색상:color_name, 사이즈:product_sizu</td>
						<td>1개</td>
						<td>100,000원</td>
						<td>10M</td>
						<td>0원</td>
						<td>100,000원</td>
						<td>결제대기중</td>
					</tr>
				</tbody>
					<tbody>
					<tr>
						<td>2</td>
						<td>
							<img alt="images" src="" align="left" hspace="10">
						</td>
						<td><a href="#">상품명이야</a></td>
						<td>옵션</td>
						<td>1개</td>
						<td>100,000원</td>
						<td>10M</td>
						<td>0원</td>
						<td>100,000</td>
						<td>결제대기중</td>
					</tr>
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
						<c:forEach var="qna" items="${memQnaList}" end="4">
							<tr>
								<td class="col-sm-1">${qna.row_num}</td>
								<td class="col-sm-4">
									<a href="<c:url value='/community/qna/read.do?num=${qna.num}'/>">
									<%-- <a href="javascript:readQna('${qna.num}')"> --%>
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
						</tbody>
					</table>
				</div>
			</div>					
		</div>
	</div>
</div>



<!-- 
table 맨 밑줄 border -> 어떤 테이블의 맨 밑에 border를 넣는건가여?
order List에 주문번호 추가(일단 이건 하지마) -> 넵!!
my posting -> 제목에 링크했습니다
 -->