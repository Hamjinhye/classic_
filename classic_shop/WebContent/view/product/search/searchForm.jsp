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
					<c:forEach var="searchList" items="${searchList}">
						<c:choose>
							<c:when test="searchList">
								<div class="productArray product_body container">
									<label>&#128269; 검색된 상품이 없습니다.</label>
								</div>
							</c:when>
							<c:otherwise>
								<div class="productArray product_body container">
									<div class="product_list" data-example-id="thumbnails-with-custom-content">
										<div class="row">
												<div class="col-sm-6 col-md-4">
													<div class="thumbnail border-0" style="border: none;">
													<a href="<c:url value='/detail.do?num=${searchList.num}' />">
														<img data-src="holder.js/100%x200" alt="400x400" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMzE5IiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDMxOSAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMzE5IiBoZWlnaHQ9IjIwMCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjEyMC41NzAzMTI1IiB5PSIxMDAiIHN0eWxlPSJmaWxsOiNBQUFBQUE7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6MTVwdDtkb21pbmFudC1iYXNlbGluZTpjZW50cmFsIj4zMTl4MjAwPC90ZXh0PjwvZz48L3N2Zz4=" data-holder-rendered="true" style="height: 400px; width: 400px; display: block;">
													</a>
														<div class="product_caption">
															<p class="product_name product_colorchip">
																<table style="width: 100%; height: 50px">
																	<tr style="border-bottom: 1px solid #ced4da;"> 
																		<td>
																			<a href="<c:url value='/detail.do?num=${searchList.num}' />" class="cate">${searchList.name}</a> <!--css랑 링크 색상 없애는 거 잘봐 이름 바꾸거나 새로 추가한게 안된다. -->
																		</td>
																		<td style="text-align: right;">
																			<%-- <c:forEach var="colour" items="${coloursList}">
																				<c:if test="${searchList.num eq colour.product_num}"> --%>
																					<span style="display: inline-block; width:10px; height:10px; background-color:#${colour.code};"></span>
																				<%-- </c:if>
																			</c:forEach> --%>
																		</td>
																	</tr>
																</table>
															</p>
															<p class="product_price">	<fmt:formatNumber type="Number" pattern="#,###" value="${searchList.price}" /></p>
															<p class="product_description">${searchList.main_info }</p>
														</div>
													</div>
												</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
			</div>
		<!-- 페이징  -->
		<jsp:include page="/common/paging.jsp"/>
	</div>
</div>
