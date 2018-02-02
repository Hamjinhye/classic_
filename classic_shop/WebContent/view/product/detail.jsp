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
	
	
	
	<div class="container">
	
		<div class="form">
	
		</div>
	
		<div class="detail_top">
			<div class="col-xl-6">
			<div class="detail_top_left">
				<img style="width: 80%; height: 60%" src="<c:url value='/public/img/product_num_1.jpg'/>" class="img-responsive"/>
			</div>
			</div>
			<div class="col-xl-6">
			<div class="detail_top_right">
				<div class="detail_top_right_top">
				<hr class="detail_hr">
				<h3>${productDetail.name}</h3>
				<p class="detail_top_right_description_one"><%-- ${productDetail.main_info} --%></p>
				<p class="detail_top_right_description_two"><%-- ${productDetail.sub_info} --%></p>
				</div>
				<div class="detail_top_right_middle">
				<table>
					<tr>
						<th>Price</th>
						<td><fmt:formatNumber value="${productDetail.price}" pattern="#,###.##"/></td>
					</tr>
					<tr>
						<th>마일리지</th>
						<td>$<fmt:formatNumber value="${productDetail.price*0.01}" pattern="#,###.##"/>원(1%)</td>
					</tr>
				</table>
				</div>
				
				<hr class="detail_hr">
				<div class="detail_top_right_bottom">
					<table>
						<tr>
							<th>Color</th>
							<td style="text-align: 'right';" class="text-left">
							<c:forEach items="${colourList}" var="colour">
								<span style="display: inline-block; width:10px; height:10px; background-color:#${colour.code};"></span> 
							</c:forEach>
	
						    </td>
						</tr>
						<tr>
							<th>Size</th>
							<td>
								<select id="sizuTest" class="selectpicker">사이즈선택
									<c:forEach var="sizu" items="${sizuList}">
										<option value="${sizu.num}">${sizu.sizu}</option>
									</c:forEach>
									<c:set value="안녕" var="finalSizu" /> 
									
								</select>
							</td>
						</tr>
					</table>
					<hr>
					<p>최소주문수량 1개</p>
					<table>   
						<tr>
							<th>${productDetail.name}{Color,Size}</th> 
							<td>
								<button id="bt_minus" class="bt_down">-</button>
	                  			<input readonly style="text-align: center;" id="quantity" type="text" size="2" name="num" value="1" id="" class="num"/>	               
								<button id="bt_plus" class="bt_up">+</button>							
							</td>
							<td>${productDetail.price}원(가격*수량)</td>
						</tr>
					</table>
		
				</div>
				
			</div>
			</div>
		</div>
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
				<img src="http://www.blueb.co.kr/SRC2/_image/w01.jpg" style="width:100%" alt="First slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>Slide 1</h1>
						<p>텍스트 1</p>
					</div>
				</div>
			</div>

			<div class="item"> 
				<img src="http://www.blueb.co.kr/SRC2/_image/w02.jpg" style="width:100%" data-src="" alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>Slide 2</h1>
						<p>텍스트 2</p>
					</div>
				</div>
			</div>
			
			
			<div class="item"> 
				<img src="http://www.blueb.co.kr/SRC2/_image/w03.jpg" style="width:100%" data-src="" alt="Third slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>Slide 3</h1>
						<p>텍스트 3</p>
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
		
		
		<hr>
		
			<ul class="list-group"> 
				<li class="list-group-item">
					<c:forEach var="list" items="${reviewList}" varStatus="i">
						<ul class="list-group">
						<div class="item">
    							<a data-toggle="collapse" data-parent="#exampleAccordion" href="#exampleAccordion${i.index}" role="button" aria-expanded="true" aria-controls="exampleAccordion1">
	   							 <div>
							<li class="list-group-item stars text-warning">
								<table style="width: 100%">
									<tr>
										<td>
											<c:forEach begin="1" end="${list.star}">
												<i class="fa fa-star"></i>
											</c:forEach>
											<c:forEach begin="1" end="${5-list.star}">
												<i class="fa fa-star-o"></i>
											</c:forEach>
										</td>
										<td style="width:65%">
											${list.product_name}
										</td>
										<td>
											${list.id}
										</td>
										<td>
											${list.indate}
										</td>
									</tr>
								</table>
							</li>
							</div>
							</a>
							<div id="exampleAccordion${i.index}" class="collapse" role="tabpanel">
			  					<div class="container">%>
			  					
									<li class="list-group-item content h5" id="reviewList${i.index}">
										신체 사이즈 : ${list.body_size}<br>
										구입 색상 : ${list.colour_name}<br>
										구입 사이즈 : ${list.product_size}<br>
										<hr>
										${list.content}
										<br>
										${list.img_path}
									</li>
									
			  					</div>
								
							</div>
							</div>
					
						</ul>
					</c:forEach>
					<jsp:include page="/common/paging.jsp"/>
				</li>
			</ul>
	
		
		
		
	<script>
	
	$('[data-toggle=collapse]').on('show', function () {
		  $(this).show();
		}).on('hidden', function () {
		  $(this).css("display", "none");
		});
		
		
				
	</script>
	
	
			
	<a class="back-to-top" href="#top">
		<button>Top</button>
	</a>
				
</div>