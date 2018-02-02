<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="<c:url value='/public/js/product_detail.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/public/css/product.css' />">
</head>
<body>
<div class="product_body">
	<div class="container">
		<h2 class="title">SEARCH</h2>
		<!-- 검색 폼 -->
		<div id="productSeachField">
			<form name="productSearchForm" action="<c:url value='/product/search.do '/>">
				<!-- 검색 키워드 -->
				<div class="search_keyword">
					<div class="row">
						<label class="control-label col-xs-2">카테고리</label>
							<div class="col-xs-6">
									<select class="form-control" name="searchCate">
										<option value="">Category</option>
										<c:forEach var="mini" items="${miniCateList}">
											<option value="${mini.num}">${mini.name}</option>
										</c:forEach>
									</select>
							</div>
					</div>
				</div>
				<div class="search_keyword">
					<div class="row">
						<label class="control-label col-xs-2">상품명</label>
						<div class="col-xs-6">
							<input list="productNameList" name="name" value="" onkeyup="getSearchProductName(this.value)" class="form-control">
							<datalist id="productNameList">
							</datalist>
						</div>
					</div>
				</div>
				<div class="search_keyword">
					<div class="row">
						<label class="control-label col-xs-2">판매 가격대</label>
						<div class="col-xs-6">
							<select class="form-control" name="productPrice">
								<option value="">가격 선택</option>
								<option value="30000">3만원 이하</option>
								<option value="50000">5만원 이하</option>
								<option value="10000">10만원 이하</option>
								<option value="100000">10만원 이상</option>
							</select>
						</div>
					</div>
				</div>
				<!-- 검색 버튼 -->
				<div class="product_search_btn">
					<button type="submit" class="btn btn-default">검색</button>
				</div>
			</form>
		</div>
		<!-- 검색 결과 -->
		<div class="productResult">
			<!-- 검색 키워드 정렬 -->
			<div class="searchArray">
				<div id="totalProductCount">
					<small><strong>TOTAL ${searchCount} Items</strong></small>
				</div>
				<div class="productArrayKeyword">
					<small><strong><a href="#" id="productNew">최신순</a></strong></small>
					<small><strong><a href="#" id="productBest">인기순</a></strong></small>
					<small><strong><a href="#" id="productReview">리뷰순</a></strong></small>
					<small><strong><a href="#" id="productHighPrice">높은 가격</a></strong></small>
					<small><strong><a href="#" id="productLowPrice">낮은 가격</a></strong></small>
				</div>
			</div>
		</div>
		<!-- 검색 상품 진열 -->
		<!-- <div class="productArray">
			<label>&#128269; 검색된 상품이 없습니다.</label>
		</div> -->
		<div class="productArray">
			<c:forEach items="${searchList}" var="searchList">
				${searchList.name}
			</c:forEach>
				<h3>왜?</h3>
		</div>
		<!-- 페이징  -->
		<jsp:include page="/common/paging.jsp"/>
	</div>
</div>
