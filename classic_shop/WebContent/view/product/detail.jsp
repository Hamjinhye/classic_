<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
</head>
<link rel="stylesheet" href="<c:url value='/public/css/product.css' />">
<script src='<c:url value="/public/js/product_detail.js"/>'></script>
<body>




<div class="product_body">
	
	<div id="productTitle">
		<h2>Outer List</h2>
	  <p>
	  	<a href="#" class="cate">코트</a>
	  	<a href="#" class="cate">자켓</a>
	  	<a href="#" class="cate">점퍼</a> 
	  	<a href="#" class="cate">가디건</a> 
	  </p>
	</div>
	<br><br>
	
	
	
	<div class="container">
	
		<div class="detail_top">
			<!-- Generate new Div -->
			<div class="row Container">
				<div class="col-md-6" style="height: 320px;">
					<img style="width: 100%; height: 100%" src="<c:url value='/public/img/test_img.png'/>" class="img-responsive"/>
				</div>
				<div class="col-md-6 ml-3">
					<div>
						<table class="table borderless">
							<tr class="border-top">
								<th colspan="2" class="col-md-12 h3">${productDetail.name}</th>
							<tr>
							<tr>
								<td colspan="2" class="col-md-12">${productDetail.main_info}</td>
							</tr>
							<tr class="border-top">
								<th class="col-md-2">PRICE </th>
								<td class="col-md-10">
									<fmt:formatNumber value="${productDetail.price}" pattern="#,###.##"/>
									
								</td>
							<tr>
							<tr>
								<th class="col-md-2">COLOR</th>
								<td class="col-md-10">
									<c:forEach items="${colourList}" var="colour">
										<span onclick="javascript:changeColor()" class="colorchip" style="display: inline-block; width:10px; height:10px; background-color:#${colour.code};">
											<input class="color-name" type="hidden" value="${colour.name}">
										</span> 
									</c:forEach>
					   			</td>
							</tr>
							<tr>
								<th class="col-md-2">SIZE</th>
								<td class="col-md-10">
									<select id="finalSize" class="selectpicker col-md-7">
										<option>::사이즈선택::</option>
										<c:forEach var="sizu" items="${sizuList}">
											<option value="${sizu.num}">${sizu.sizu}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th class="col-md-2">수량</th>
								<td class="col-md-10">
									<button id="bt_minus" class="bt_down" onclick="javascript:btnMinus(${productDetail.price})">-</button>
                  					<input readonly style="text-align: center;" id="quantity" type="text" size="2" name="num" value="1" id="" class="num"/>	               
									<button id="bt_plus" class="bt_up" onclick="javascript:btnPlus(${productDetail.price})">+</button>
								</td>
							</tr>
							<tr>
								<th class="col-md-2">
									선택한 상품
									
								</th>
								<td class="col-md-10">
									<span><STRONG>${productDetail.name}</STRONG>{</span>
									<span>Color</span>, 
									<span>Size</span><span> }</span>
								</td>
							</tr>
							<tr class="border-top">
								<td colspan="2" class="col-md-12" style="text-align: right;">
									<span>Total:</span>
									<span class="h3">
									<STRONG id="finalPrice"><fmt:formatNumber value="${productDetail.price}" pattern="#,###.##"/></STRONG>
									</span>원
								</td>
							</tr>
							<tr class="border-top">
								<td colspan="2" align="right">
									<button class="btn btn-default btn-lg">Wish List</button>
									<button class="btn btn-default btn-lg">ADD Cart</button>
								</td>
							</tr>
						</table>
					
					
					</div>
				</div>
			</div>
		   
			<!--  -->
			
			
		</div> <!-- don't remove it -->
		</div>
		<div class="product_slide">
		
			<div id="myCarousel" class="carousel slide" data-ride="carousel"> 
		
		
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		
	
		<div class="carousel-inner"> 
			
			<div class="item active"> 
				<img src="<c:url value='/public/img/001.jpeg'/>" style="width:100%; height: 300px;" alt="First slide">
				<div class="container">
					<div class="carousel-caption">
					<h1>상품명</h1>
						<p>상품 간략 설명</p>
					</div>
				</div>
			</div>

			<div class="item"> 
				<img src="<c:url value='/public/img/002.png'/>" style="width:100%; height: 300px;" data-src="" alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>상품명</h1>
						<p>상품 간략 설명</p>
					</div>
				</div>
			</div>
			
			
			<div class="item"> 
				<img src="<c:url value='/public/img/003.jpg'/>" style="width:100%; height: 300px" data-src="" alt="Third slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>상품명</h1>
						<p>상품 간략 설명</p>
					</div>
				</div>
			</div>
			
		</div>
		
		<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
		<a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a> 
		</div>
		</div> 
		
		<h6 id="product_qna"></h6>
		<div id="sidebox" class="bs-example">
		    <ul class="nav nav-tabs">
		      <li role="presentation" class="active"><a href="javascript:productDetailInfo()">DETAIL INFO</a></li>
		      <li role="presentation"><a href="javascript:shopGuide()">SHOP GUIDE</a></li>
		      <li role="presentation"><a href="javascript:productReview()">REVIEW</a></li>
		      <li role="presentation"><a href="javascript:productQna()">QNA</a></li>
		    </ul>
	 	</div>
		<div class="highlight"><pre><code id="productDetailTest" class="language-html" data-lang="html">초기내용
		</code></pre></div>
		
		
		<!-- REVIEWS DOWN BELOW -->
		<c:import url="/template/review.jsp"/>
	
	
			
	<a class="back-to-top" href="#top">
		<button>Top</button>
	</a>
				
</div>