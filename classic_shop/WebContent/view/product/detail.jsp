<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
</head>
<link rel="stylesheet" href="<c:url value='/public/css/product.css' />">
<script src='<c:url value="/public/js/product_detail.js"/>'></script>
<body>




<div class="product_body">
											
	<!-- <p class="-detail-spec-description displaynone">
		<input id="productNum" desc="상품번호" type="text" value="">
		<input id="productName" desc="상품이름" type="text" value="">
		<input id="productPrice" desc="상품가격" type="text" value="">
		<input id="productMileage" desc="상품마일리지" type="text" value="">
		<input id="productColor" desc="상품색상" type="text" value="">
		<input id="productSize" desc="상품사이즈" type="text" value="">
	</p> -->
	<div id="productTitle">
		<h2>Outer List <!--Custom content--></h2>
	  <p><!--With a bit of extra markup, it's possible to add any kind of HTML content like headings, paragraphs, or buttons into thumbnails.-->
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
				<img src="//withyoon.com/web/product/big/201801/7283_shop1_257605.jpg" class="img-responsive"/>
			</div>
			</div>
			<div class="col-xl-6">
			<div class="detail_top_right">
				<div class="detail_top_right_top">
				<hr class="detail_hr">
				<h3>${productDetail.name}</h3>
				<p class="detail_top_right_description_one"><%-- ${productDetail.main_info} --%></p><!-- product description Line1 -->
				<p class="detail_top_right_description_two"><%-- ${productDetail.sub_info} --%></p><!-- product description Line2 -->
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
										<!-- <option>::사이즈선택::</option> -->
									<c:forEach var="sizu" items="${sizuList}">
										<option value="${sizu.num}">${sizu.sizu}</option>
									</c:forEach>
									<c:set value="안녕" var="finalSizu" /> 
										<!-- <option selected value="8">셀렉트</option> -->
									
								</select>
							</td>
						</tr>
					</table>
					<hr>
					<p>최소주문수량 1개</p>
					<table>   
						<tr>
							<th>${productDetail.name}{Color,Size}</th> <!-- 선택한 컬러와 사이즈 -->
							
							<td>
							
									<button id="bt_minus" class="bt_down">-</button>
		                  			<input readonly style="text-align: center;" id="quantity" type="text" size="2" name="num" value="1" id="" class="num"/>	               
									<button id="bt_plus" class="bt_up">+</button>
									
									<!-- <div class="input-group input-group-sm mb-3"> 왜 부트스트랩 버튼 안 먹어?
									<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-sm">+</span>
									</div>
									<input type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
									</div> -->
									<script>
										/* var quantityMinus=function(){
											var val = Number($("#quantity").val());
											if(val>1){
												val-=1
											}
											$("#quantity").val(val);
										}
										var quantityPlus=function(){
											var val = Number($("#quantity").val());
											if(val<99){
												val+=1
											}
											$("#quantity").val(val);
										} */
									</script>
	
	                 		
							
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
		<!-- http://www.blueb.co.kr/?r=home&c=1/5&uid=3826&mod=preview&iframe=Y 
			http://www.blueb.co.kr/?c=1/5&uid=3826
			https://www.w3schools.com/w3css/tryit.asp?filename=tryw3css_slideshow_dots2
		
		
		active 활용해서 !!!!!!! -->
			<div id="myCarousel" class="carousel slide" data-ride="carousel"> 
		
		<!-- 페이지 -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<!-- 페이지 -->
	
		<div class="carousel-inner"> <!-- 카로셀 -->
			<!-- 슬라이드1 -->
			<div class="item active"> 
				<img src="http://www.blueb.co.kr/SRC2/_image/w01.jpg" style="width:100%" alt="First slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>Slide 1</h1>
						<p>텍스트 1</p>
					</div>
				</div>
			</div><!-- 
			슬라이드1 -->
	
			<!-- 슬라이드2 -->
			<div class="item"> 
				<img src="http://www.blueb.co.kr/SRC2/_image/w02.jpg" style="width:100%" data-src="" alt="Second slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>Slide 2</h1>
						<p>텍스트 2</p>
					</div>
				</div>
			</div>
		<!-- 	슬라이드2 -->
			
			<!-- 슬라이드3 -->
			<div class="item"> 
				<img src="http://www.blueb.co.kr/SRC2/_image/w03.jpg" style="width:100%" data-src="" alt="Third slide">
				<div class="container">
					<div class="carousel-caption">
						<h1>Slide 3</h1>
						<p>텍스트 3</p>
					</div>
				</div>
			</div>
			<!-- 슬라이드3 -->
		</div>
		
		<!-- 이전, 다음 버튼 -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
		<a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a> 
		</div>
		</div> <!-- 이미지슬라이드  -->
		
		<h6 id="product_qna"></h6>
		<div id="sidebox" class="bs-example">
	<!-- 	<div id="message" class="bs-example" data-example-id="simple-nav-tabs"> -->
		    <ul class="nav nav-tabs">
		      <li role="presentation" class="active"><a href="javascript:productDetailInfo()">DETAIL INFO</a></li>
		      <li role="presentation"><a href="javascript:shopGuide()">SHOP GUIDE</a></li>
		      <li role="presentation"><a href="javascript:productReview()">REVIEW</a></li>
		      <li role="presentation"><a href="javascript:productQna()">QNA</a></li>
		    </ul>
	 	</div>
	 	<!-- <script>
	 		//https://developer.mozilla.org/en-US/Add-ons/WebExtensions/API/tabs/move
	 		var currentPosition = parseInt($("#sidebox").css("top"));
	 		$(window).scroll(function() { var position = $(window).scrollTop();
			$("#sidebox").stop().animate({"top":position+currentPosition+"px"},100); });
	 	</script> -->
		<div class="highlight"><pre><code id="productDetailTest" class="language-html" data-lang="html">초기내용
		</code></pre></div>
		
		
		
		<!-- <hr>
		<div class="review">
			<div class="review_header">
			</div>
			<div class="review_body">
				<div class="page">
					<ul>
						<li>
							<div>
								<a>
									<div>
										내용
									</div>
								</a>
								<ul>
									<li></li>
								</ul>
							</div>
						
						</li>
						<li></li>
						<li></li>
					</ul>
					<div class="nodate">
					</div>
				</div>
			</div>
			<div class="review_footer">
				페이지 목록 버튼
			</div>
		</div>전체  -->
		
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
										<td style="width:60%">
											<c:forEach begin="1" end="${list.star}">
												<i class="fa fa-star"></i>
											</c:forEach>
											<c:forEach begin="1" end="${5-list.star}">
												<i class="fa fa-star-o"></i>
											</c:forEach>
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
			  					<div class="container">
			  						<p>	신체 사이즈: ${list.body_size} </p>
									<li class="list-group-item content h5" id="reviewList${i.index}">
										${list.content}
									</li>
			  					</div>
								
							</div>
							</div>
					
						</ul>
					</c:forEach>
				</li>
			</ul>
	
		
		
		
	<script>
	
	$('[data-toggle=collapse]').on('show', function () {
		  // Handle setting display here before show transition starts
		  $(this).show();
		}).on('hidden', function () {
		  // Handle adding display:none or visibility: hidden here after element is done transitioning
		  $(this).css("display", "none");
		});
	//$(function(){
		var productDetailInfo=function(){
			$.ajax({
				url:"#",
				dataType:"html",
				type: "GET",
				success: function(respData, status, jqXHR){
					$(".language-html").html("안녕안녕 여기는 detail info.");
				}
			});
		};
		var shopGuide=function(){
			$.ajax({
				url:"#",
				dataType:"html",
				type: "GET",
				success: function(respData, status, jqXHR){
					$(".language-html").html("${shopGuide.deliv_info}");
				}
			});
		};
		var productReview=function(){
			$.ajax({
				url:"#",
				dataType:"html",
				type: "GET",
				success: function(respData, status, jqXHR){
					$(".language-html").html("요기는 프로덕트 리뷰~~~~예에에에~~~.");
				}
			});
		};
		var productQna=function(){
			$.ajax({
				url:"#",
				dataType:"html",
				type: "GET",
				success: function(respData, status, jqXHR){
					$(".language-html").html("프롸덕 큐앤에이");
				}
			});
		};
	//});
						
		
				
	</script>
	
	
			
	<a class="back-to-top" href="#top">
		<button>Top</button>
	</a>
	<!-- https://stackoverflow.com/questions/18023278/what-is-top-and-how-can-i-use-it-on-my-site
		id로 이름을 지어놓고 a href=#id 로 이동할 수 있음
	 -->
				
</div>