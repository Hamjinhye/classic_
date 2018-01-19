<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/public/css/member.css' />">
<script src="<c:url value='/public/js/member.js'/>"></script>
</head>
<body>
<div class="member_body">
	<div class="container">
		<!-- My QNA -->
		<div class="myQna_wrap">
			<h2 class="myQnaTitle">MY QNA</h2>
			<table class="table myQna_table">
				<thead>
					<tr>
						<th class="col-sm-1">
							<label>
								<input type="checkbox" id="blankCheckbox" value="option1" aria-label="checkbox">
							</label>
						</th>
						<th class="col-sm-1">No.</th>
						<th class="col-sm-3">SUBJECT</th>
						<th class="col-sm-1">작성자</th>
						<th class="col-sm-1">작성일</th>
						<th class="col-sm-1">조회수</th>
					</tr>
				</thead>
				<tbody>
			<c:forEach var="qna" items="${memQnaList}">
					<tr>
						<td>
							<label>
								<input type="checkbox" id="blankCheckbox" value="option1" aria-label="checkbox">
							</label>
						</td>
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
								<td class="col-sm-1">${qna.count}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
 			<div class="myposting_btn_group">
				<button class="btn btn-default" type="button">전체 선택</button>
				<button class="btn btn-default" type="button">선택 삭제</button>
			</div>
<!-- 페이징 -->
	<jsp:include page="/common/paging.jsp"/>
		<!-- My review -->
		<div class="myReview_wrap">
			<h2 class="myReviewTitle">MY REVIEW</h2>
			<div class="myReview_inner">
				<div class="myReview_top_menu">
					<ul class="top_menu_left">
						<li>
							<div class="top_menu_text">
								0개의 리뷰를 작성하셨습니다.
							</div>
						</li>
					</ul>
					<ul class="top_menu_right">
						<li class="top_menu_li li_action">
							<a href="#">
								포토리뷰 모아보기
							</a>
						</li>
						<li class="top_menu_li li_search">
							<div class="top_menu_search">
								<form name="myReviewSearchForm" action="" class="form-inline">
									<input type="text" class="form-control searchInput" name="searchValue" placeholder="검색어 입력">
									<button type="submit" class="btn btn-default">&#128269;</button>
								</form>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="myreview_List">
				<div class="review_page">
					<ul>
						<li id="reviews_1">
							<a class="reviews_a1">
								<img src="#">
							</a>
							<div class="edit_trash_btn">
								<button type="button" class="btn btn-default glyphicon glyphicon-edit">
								</button>
								<button type="button" class="btn btn-default glyphicon glyphicon-trash">
								</button>
							</div>
							<div class="reviews_2">
								<div class="reviews_score">
									<div class="reviews_title">
										<div class="review_tags">
											<div class="reviews_camera">
												<span class="glyphicon glyphicon-camera camera"></span>
											</div>
											<span class="reviews_index">NEW</span>
										</div>
										<a class="reviews_a2">챔마 골지티셔트 티</a>
									</div>
									<div class="reviews_rating">
										<span class="top_star">
											<span class="glyphicon glyphicon-star star_rating">
											</span>
											<span class="glyphicon glyphicon-star star_rating">
											</span>
											<span class="glyphicon glyphicon-star star_rating">
											</span>
											<span class="glyphicon glyphicon-star star_rating">
											</span>
											<span class="glyphicon glyphicon-star star_rating">
											</span>
										</span>
									</div>
								</div>
								<div class="content_expanded">
									<div class="content_msg">
										<div class="review_options">
											<div class="review_option">
												<div class="review_option_title">키</div>
												<div class="review_option_content">167</div>
											</div>
											<div class="review_option">
												<div class="review_option_title">몸무게</div>
												<div class="review_option_content">46</div>
											</div>
											<div class="review_option">
												<div class="review_option_title">Color</div>
												<div class="review_option_content">블랙</div>									
											</div>
											<div class="review_option">
												<div class="review_option_title">사이즈</div>
												<div class="review_option_content">S</div>
											</div>
										</div>
										<div class="review_msg">
											포토후기 2등<br>
											배송이 빨라서 좋았구요<br>
											가격대비 옷도 튼튼하고 좋음<br>
											두께감이 있는 맨투맨이라<br>
											지금 편하게 입기 좋음 ^_^				
										</div>									
										
										</div>
										<div class="reviws_reply_wrap">
											<div class="reply_name">
												<span>ADMIN</span>
													<div class="reply_label">감사합니다.</div>
											</div>
										</div>
									</div>	
								</div>
							</li>
						</ul>					
					</div>	
				</div>
				<div class="row myreview_row">
					<div class="col-xs-12">
						<div class="myreview_paging">
						  <ul class="pagination pagination-sm">
						    <li><a href="#"><span aria-hidden="true">«</span><span class="sr-only">Previous</span></a></li>
						    <li><a href="#">1</a></li>
						    <li><a href="#">2</a></li>
						    <li><a href="#">3</a></li>
						    <li><a href="#">4</a></li>
						    <li><a href="#">5</a></li>
						    <li><a href="#"><span aria-hidden="true">»</span><span class="sr-only">Next</span></a></li>
						  </ul>
						</div>
	         		</div>
				</div>
			</div>
		</div>
	</div>
</div>