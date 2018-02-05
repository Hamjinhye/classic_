<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/public/css/product.css' />">
</head>
<body>
<!-- 이미지 슬라이드 -->
<div class="product_slide">
	<div id="myCarousel" class="carousel slide" data-ride="carousel"> 
<!-- 페이지 -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<!-- 슬라이드1 -->
			<div class="item active main-img" style="width: 100%; height: 800px"> 
				<img src="<c:url value='/public/img/001.jpeg'/>" alt="First slide" style="height: 100%; width: 100%">
			</div>
			<!-- 슬라이드2 -->
			<div class="item" style="width: 100%; height: 800px"> 
				<img src="<c:url value='/public/img/003.jpg'/>" data-src="" alt="Second slide" style="height: 100%; width: 100%">
			</div>
			<!-- 슬라이드3 -->
			<div class="item" style="width: 100%; height: 800px"> 
				<img src="<c:url value='/public/img/002.png'/>" data-src="" alt="Third slide"  style="height: 100%; width: 100%">
			</div>
		</div>
		<!-- 이전, 다음 버튼 -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
		<a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a> 
	</div>
</div> 
<!-- 상품 진열 -->
<div class="container">
	<!-- NEW ITEMS -->
	<p class="main_title">NEW ITEMS</p>
		<div class="main_body">
			<div class="product_list" data-example-id="thumbnails-with-custom-content">
				<div class="row">
					<c:forEach var="newList" items="${newList}" end="8">
						<div class="col-sm-6 col-md-4">
							<div class="thumbnail border-0" style="border: none;">
								<a href="<c:url value='/detail.do?num=${newList.num}' />">
									<img data-src="holder.js/100%x200" alt="400x400" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMzE5IiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDMxOSAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMzE5IiBoZWlnaHQ9IjIwMCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjEyMC41NzAzMTI1IiB5PSIxMDAiIHN0eWxlPSJmaWxsOiNBQUFBQUE7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6MTVwdDtkb21pbmFudC1iYXNlbGluZTpjZW50cmFsIj4zMTl4MjAwPC90ZXh0PjwvZz48L3N2Zz4=" data-holder-rendered="true" style="height: 400px; width: 400px; display: block;">
								</a>
								<div class="product_caption">
									<p class="product_name product_colorchip">
										<table style="width: 100%; height: 50px">
											<tr style="border-bottom: 1px solid #ced4da;"> 
												<td>
													<a href="<c:url value='/detail.do?num=${newList.num}' />" class="cate">${newList.name}</a>
												</td>
												<td style="text-align: right;">
													<c:forEach var="colour" items="${colorList}">
														<c:if test="${newList.num eq colour.product_num}">
															<span style="display: inline-block; width:10px; height:10px; background-color:#${colour.code};"></span>
														</c:if>
													</c:forEach>
												</td>
											</tr>
										</table>
									</p>
								<p class="product_price">	<fmt:formatNumber type="Number" pattern="#,###" value="${newList.price}" /></p>
								<p class="product_description">${newList.main_info}</p>
								</div>
							 </div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	<!-- BEST ITEMS -->
	<p class="main_title">BEST ITEMS</p>
		<div class="main_body">
			<div class="product_list" data-example-id="thumbnails-with-custom-content">
				<div class="row">
					<c:forEach var="best" items="${bestList}" end="8">
						<div class="col-sm-6 col-md-4">
							<div class="thumbnail border-0" style="border: none;">
								<a href="<c:url value='/detail.do?num=${best.num}' />">
									<img data-src="holder.js/100%x200" alt="400x400" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMzE5IiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDMxOSAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMzE5IiBoZWlnaHQ9IjIwMCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjEyMC41NzAzMTI1IiB5PSIxMDAiIHN0eWxlPSJmaWxsOiNBQUFBQUE7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6MTVwdDtkb21pbmFudC1iYXNlbGluZTpjZW50cmFsIj4zMTl4MjAwPC90ZXh0PjwvZz48L3N2Zz4=" data-holder-rendered="true" style="height: 400px; width: 400px; display: block;">
								</a>
								<div class="product_caption">
									<p class="product_name product_colorchip">
										<table style="width: 100%; height: 50px">
											<tr style="border-bottom: 1px solid #ced4da;"> 
												<td>
													<a href="<c:url value='/detail.do?num=${best.num}' />" class="cate">${best.name}</a>
												</td>
												<td style="text-align: right;">
													<c:forEach var="colour" items="${colorList}">
														<c:if test="${best.num eq colour.product_num}">
															<span style="display: inline-block; width:10px; height:10px; background-color:#${colour.code};"></span>
														</c:if>
													</c:forEach>
												</td>
											</tr>
										</table>
									</p>
								<p class="product_price">	<fmt:formatNumber type="Number" pattern="#,###" value="${best.price}" /></p>
								<p class="product_description">${best.main_info}</p>
								</div>
							 </div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
</div>
<script>
	function getCookie(cookieName){
		var name = cookieName+"=";
		var x = 0;
		while(x<=document.cookie.length){
			var y = (x+name.length);
			if(document.cookie.substring(x,y)==name){
				if((endName=document.cookie.indexOf(";",y))==-1) endName = document.cookie.length;
				return unescape(document.cookie.substring(y, endName));
			}
			x = document.cookie.indexOf(" ", x)+1;
			if(x==0) break;
		}
		return "";
	}
	
	if(getCookie('popup')!="off"){
		window.open('/classic_shop/event.do','CLASSIC HOT ISSUE',
				'top=100,left=200,width=320,height=450,location=no,resizable=no,scrollbars=no,status=no');
	}
	
</script>