<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 lib -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value='/public/bootstrap/css/bootstrap.css' />">
<!-- awesome Icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- jQuery ui CSS -->
<link rel="stylesheet" href="<c:url value='/public/js/jquery-ui/jquery-ui.min.css' />">
<!-- jQuery lib -->
<script src='<c:url value="/public/js/jquery/jquery-3.2.1.min.js"/>'></script>
<script src='<c:url value="/public/js/jquery-ui/jquery-ui.min.js"/>'></script>
<!-- kakao 지도 api -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9634cbc392b8b80779d4f419ee72bf3a"></script>
<!-- 개인 lib -->
<link rel="stylesheet" href="<c:url value='/public/css/common.css' />">
<script src='<c:url value="/public/js/script_header.js"/>'></script>
<title>CLASSIC</title>
<script>
	if("${msg}"!=""){
		alert("${msg}");	
	}
</script>
<c:remove var="msg"/>
		<nav class="navbar navbar-default navbar-fixed-top" style="background-color: #ffffff;">
			<div class="container">
				<!-- 상품 Nav -->
				<div id="productNav">
					<div class="nav navbar-nav navbar-left">
						<ul class="nav nav-pills" id="cateNavbar">
						<%-- <li><a href="<c:url value='/main.do' />">CLASSIC</a></li>
							<li><a href="#">NEW</a></li>
							<li><a href="#">BEST</a></li>
							<li role="presentation" class="dropdown">
								<a class="dropdown-toggle" href="<c:url value='/view/product/list.do' />" role="button" aria-expanded="false">${cate.name}</a>
								<a class="dropdown-toggle" data-toggle="dropdown" href="<c:url value='/product/list/outerList.jsp' />" role="button" aria-expanded="false">OUTER</a>
								
								 <ul class="dropdown-menu" role="menu">
									<li><a href="#">COAT</a></li>
									<li><a href="#">JACKET</a></li>
									<li><a href="#">JUMPER</a></li>
									<li><a href="#">CARDIGAN</a></li>
								</ul>
							</li>
							<li role="presentation" class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="<c:url value='/view/product/list.do?cate=TOP' />" role="button" aria-expanded="false">TOP</a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#">T-SHIRT</a></li>
									<li><a href="#">BLOUSE</a></li>
									<li><a href="#">KNIT</a></li>
								</ul>
							</li>
							<li role="presentation" class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="<c:url value='/view/product/list.do?cate=BOTTOM' />" role="button" aria-expanded="false">BOTTOM</a>
								<ul class="dropdown-menu" role="menu">
									<li role=""><a href="#">SKIRTS</a></li>
									<li><a href="#">PANTS</a></li>
									<li><a href="#">DENIM</a></li>
								</ul>
							</li>
							<li role="presentation" class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="<c:url value='/view/product/list.do?cate=SHOESNBAG' />" role="button" aria-expanded="false">SHOES&amp;BAG</a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#">SHOES</a></li>
									<li><a href="#">BAG</a></li>
								</ul>
							</li>
							<li role="presentation" class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">ACC</a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#">ACC</a></li>
								</ul>
							</li> --%>
						</ul>
					</div>
				</div>
			<!-- 회원 Nav -->
				<div id="memNav">
					<div class="nav navbar-nav navbar-right">
						<ul class="nav nav-pills">
							<!--로그인 -->
							<c:choose>
								<c:when test="${loginMem ne null}">
										<c:if test="${loginMem.grade==0}">
											<li><button type="button" class="btn btn-danger" onclick="location.href='/classic_shop/admin/main.do'">MY ADMIN</button></li>
										</c:if>
									<li><a><strong style="color: #000;">${loginMem.id} 님 접속</strong></a></li>
									<li><a href="<c:url value='/logout.do' />">LOGOUT</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="<c:url value='/login.do' />">LOGIN</a></li>
									<li>
										<a href="<c:url value='/signup.do' />">JOIN US</a>
									</li>
								</c:otherwise>
							</c:choose>
								<li role="presentation" class="dropdown">
									<a class="dropdown-toggle" href="<c:url value='/user/mypage.do?num=${loginMem.num}'/>" role="button" aria-expanded="false">MY PAGE</a>
									<ul class="dropdown-menu" role="menu">
										<li><a href="<c:url value='/user/mypage/modify.do?num=${loginMem.num}'/>">회원정보수정</a></li>
										<li><a href="<c:url value='/user/address.do?num=${loginMem.num}'/>">배송주소록</a></li>
										<li><a href="<c:url value='/view/member/mypage/coupon.jsp'/>">쿠폰</a></li><!-- 경로설정 안됨 -->
										<li><a href="<c:url value='/user/cart.do'/>">장바구니</a></li>
										<li><a href="<c:url value='/user/wish.do?num=${loginMem.num}'/>">위시리스트</a></li>
										<li><a href="<c:url value='/user/order.do?num=${loginMem.num}' />">주문내역</a></li>
										<li><a href="<c:url value='/user/mypage/myposting.do?num=${loginMem.num}'/>">내가쓴글</a></li>
									</ul>
								</li>
								<li>
									<a href="<c:url value='/user/cart.do'/>">CART
										<span class="badge badge-pill badge-secondary" style="background-color: #ccc;" id="cartSymbol"></span>
									</a>
								</li>
								<li><a href="<c:url value='/user/order.do?num=${loginMem.num}' />">ORDER</a></li>
							<li role="presentation" class="dropdown">
									<a class="dropdown-toggle" href="<c:url value='/community/notice.do' />" role="button" aria-expanded="false">COMMUNITY</a>
									<ul class="dropdown-menu" role="menu">
										<li><a href="<c:url value='/community/notice.do' />">NOTICE</a></li>
										<li><a href="<c:url value='/community/qna.do' />">QNA</a></li>
										<li><a href="<c:url value='/community/faq.do' />">FAQ</a></li>
									</ul>
								</li>
							<li role="presentation" class="dropdown">
								<a class="dropdown-toggle" href="<c:url value='/view/product/search/searchForm.jsp' />" role="button">&#128269;</a><!-- 경로설정 안됨  -->
								<ul class="dropdown-menu" role="menu">
									<li><input type="text" placeholder="상품명 검색" id="productSearch">
										<button id="searchBtn">&#128269;</button></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</nav>
<script>
$(function(){
 	var cookies = document.cookie.split(";");
 	var cartSymbol = document.getElementById("cartSymbol");
 	//console.log(cookies);
 	var productCount=0;
 	var i;
 	for(i = 0; i<cookies.length; i++){
 		var key = (cookies[i].split("=")[0].trim()).split("_")[2];
 		if(key=="name"){
 			productCount++;
 		}
 	}
 	cartSymbol.innerHTML = productCount;
 	if(productCount!=0){
 		cartSymbol.style.background = "red";
 	}
});
</script>