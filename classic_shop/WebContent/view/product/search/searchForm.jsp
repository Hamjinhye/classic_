<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/public/css/product.css' />">
</head>
<body>
<div class="product_body">
	<div class="container">
		<h2 class="title">SEARCH</h2>
		<!-- 검색 폼 -->
		<div id="productSeachField">
			<form name="productSearchForm">
				<!-- 검색 키워드 -->
				<div class="search_keyword">
					<div class="row">
						<label class="control-label col-xs-2">카테고리</label>
							<div class="col-xs-6">
									<select class="form-control">
										<option>Category</option>
								<c:forEach var="cate" items="${cateList}">
										<option value="${cate.name}">${cate.name}</option>
								</c:forEach>
								<c:forEach var="mini" items="${miniCateList}">
										<option value="${mini.name}">${mini.cate_name} &gt; ${mini.name}</option>
								</c:forEach>
									</select>
							</div>
					</div>
				</div>
				<div class="search_keyword">
					<div class="row">
						<label class="control-label col-xs-2">상품명</label>
						<div class="col-xs-6">
							<input list="productNameList" name="name" onkeyup="getProductName(this.value)" class="form-control">
							<!-- <input type="text" name="productSearchName" class="form-control"> -->
							<datalist id="productNameList">
							</datalist>
<script>
	var getProductName = function(productNameValue){
		if(productNameValue.trim()){
			var url = "/classic_shop/product/search/name.do?name="+productNameValue;
			var http = new XMLHttpRequest();
			http.onreadystatechange = function(){
				if(this.readyState == 4 && this.status == 200){
					var productNameList = JSON.parse(this.response);
					console.log(productNameList);
					var productNameHTML = "";
					productNameList.forEach(function(name){
						productNameHTML+="<option>"+name+"</option>";
					});
					document.getElementById("productNameList").innerHTML = productNameHTML;
				}
			}
			http.open("GET", url, true);
			http.send();
		}
	}
</script>
						</div>
					</div>
				</div>
				<div class="search_keyword">
					<div class="row">
						<label class="control-label col-xs-2">판매 가격대</label>
						<div class="col-xs-6">
							<select class="form-control">
								<option>가격 선택</option>
								<option>3만원 이하</option>
								<option>5만원 이하</option>
								<option>10만원 이하</option>
								<option>10만원 이상</option>
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
					<small><strong>TOTAL ? Items</strong></small>
				</div>
				<div class="productArrayKeyword">
					<small><strong><a href="#">최신순</a></strong></small>
					<small><strong><a href="#">인기순</a></strong></small>
					<small><strong><a href="#">리뷰순</a></strong></small>
					<small><strong><a href="#">높은 가격</a></strong></small>
					<small><strong><a href="#">낮은 가격</a></strong></small>
				</div>
			</div>
		</div>
		<!-- 검색 상품 진열 -->
		<div class="productArray">
			<label>&#128269; 검색된 상품이 없습니다.</label>
		</div>
		<!-- 페이징  -->
	</div>
</div>
