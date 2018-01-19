<%@page import="com.classic.order.dto.WishDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/public/css/order.css' />">
</head>
<body>
<body>
	<div class="container" id="mainDiv">
		<h2 class="text-left" id="wishName">WISH LIST</h2>
		<table class="table" id="wishTable">
			<thead id="wishTitle">
				<tr>
					<th width="5%"><input type="checkbox" id="allCheck"></th>
					<th width="45%">상품정보</th>
					<th width="10%">판매가</th>
					<th width="10%">수량</th>
					<th width="10%">배송비</th>
					<th width="10%">합계</th>
					<th width="10%">선택</th>
				</tr>
			</thead>
			<tbody id="wishContents">
			<c:choose>
				<c:when test="${(fn:length(wishList))!=0}">
					<c:forEach var="wish" items="${wishList}">
						<tr>
							<td><input type="checkbox" value="${wish.productNum}" class="checkWish paramValue" name="product_num"></td>
							<td class="infoList">
								<div class="infoListDiv">
									<div>
										<a href="<c:url value='/product/detail.do?num=${wish.productNum}'/>">
											<p>이미지임</p>
										</a>
									</div>
								</div>
								<div class="infoListDiv">
									<ul class="list-group">
										<li class="list-group-item"><strong><a href="<c:url value='/product/detail.do?num=${wish.productNum}'/>"><input type="hidden" name="product_name" value="${wish.productName}" class="paramValue">${wish.productName}</a></strong></li>
										<li class="list-group-item"><strong>color : ${wish.colour}   <input type="hidden" name="product_colour" value="${wish.colour}" class="paramValue">size : ${wish.sizu}<input type="hidden" name="product_sizu" value="${wish.sizu}" class="paramValue"> </strong></li>
										<!-- 모달버튼  -->
										<li class="list-group-item">
											<button class="btn btn-default" data-toggle = "popover" data-trigger="focus" data-title="옵션선택" type="button">옵션변경</button>
										</li>
										<%-- <!-- 모달 -->
										<div class="modal fade" id="wishOption${wish.productNum}" tabindex="-1" role="dialog">
  											<div class="modal-dialog" role="document">
  												<div class="modal-content">
     												<div class="modal-header">
     	  												<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      													<h3 class="modal-title" id="myModalLabel">옵션변경</h3>
      												</div>
      												<div class="modal-body" class="wishOptionSelect">
      													<div>
	      													<select class="form-control">
	      													
	      													</select>
      													</div>
      													<div>
	      													<select class="form-control">
	      													
	      													</select>
      													</div>
     												</div>
      												<div class="modal-footer">
        												<button type="button" class="btn btn-default">변경</button>
      												</div>
   												</div>
 											</div>
										</div> --%>
									</ul>
								</div>
							</td>
							<td><input type="hidden" name="price" value="${wish.price}" class="paramValue">${wish.price}원</td>
							<td><input type="hidden" name="wishQuantity" value="${wish.wishQuantity}" class="paramValue">${wish.wishQuantity}개</td>
							<%-- <fmt:parseNumber var="percent" value="${((wish.price*wish.wishQuantity)*0.02)}" integerOnly="true" />
							<td>${percent}</td> --%>
							<c:choose>
								<c:when test="${wish.price>50000}">
									<td>무료</td>
									<td>${wish.price*wish.wishQuantity}원</td>
								</c:when>
								<c:when test="${wish.price<50000}">
									<td>2500원</td>
									<td>${wish.price*wish.wishQuantity+2500}원</td>
								</c:when>
							</c:choose>
							<td>
								<div class="buttonGroup">
									<a type="button" class="btn btn-default partOrder" href="<c:url value='/user/cart.do?num=${loginMem.num}&productNum=${wish.productNum}'/>">주문하기</a>									
									<button type="button" class="btn btn-default" onclick="pickWishDel(${loginMem.num},${wish.productNum})">삭제</button>
								</div>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="8" id="emptyTableData">wish list가 비었습니다.<td>
					</tr>
				</c:otherwise>
			</c:choose>
<%-- 			<c:choose>
				<c:when test="${wishList!=null}">
					<c:forEach var="wish" items="${wishList}">
					<tr>
					<!-- var == 내가 설정하는 이름 즉, 내가 ${이 안에서 쓰는 변수이름} -->
					<!-- items == 내가 컨트롤러에서 setAtt~("wishList", wishDTO) 이렇게 설정한 이름 -->
						<!-- wishList에 뭐가 있을 때 -->
						<td><input type="checkbox" value="${wish.productNum}"></td>		
						<td class ="infoList">
						<div class="infoListDiv">
							<div>
								<p><a>이미지임</a></p>
							</div>
							<div>
								<ul class="list-group" >
									<li class="list-group-item"><strong><a>${wish.productName}</a></strong></li>
									<li class="list-group-item"><strong>color ${wish.colour} size ${wish.sizu} %></strong></li>
									<li class="list-group-item"><button type="button" class="btn btn-default">옵션변경</button></li> <!--  onclick구현 -->
								</ul>
							</div>
						</div>
					</td>
					<td>${wish.price}원</td>
					<td>${wish.wishQuantity}개</td>
					<td>(${wish.productNum}*${wish.wishQuantity*0.02}</td>
					<c:choose>
						<c:when test="${wish.price>50000}">
							<td>무료</td>
							<td>${wish.price*wish.wishQuantity}원</td>
						</c:when>
						<c:when test="${wish.price<50000}">
							<td>2500원</td>
							<td>${wish.price*wish.wishQuantity+2500}원</td>
						</c:when>
					</c:choose>
					<td>
						<div class="buttonGroup">
							<button type="button" class="btn btn-default">주문하기</button>
							<button type="button" class="btn btn-default">장바구니 등록</button>
							<button type="button" class="btn btn-default">삭제</button>
						</div>
					</td>
				</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<!-- wishList에 아무것도 없을 때 -->
					<tr>
						<td colspan="8">wish list가 비었습니다.<td>
					</tr>
				</c:otherwise>
			</c:choose> --%>
			<%-- <%if(wishList==null){ %>
				<td colspan="8">wish list가 비었습니다.<td>
			<%} else { 
				 for(int i = 0; i<wishList.size(); i++){ %>
				<tr>
					<td><input type="checkbox" value="<%=wishList.get(i).getProductNum()%>"></td>
					<td class ="infoList">
						<div class="infoListDiv">
							<div>
								<p><a>이미지임</a></p>
							</div>
							<div>
								<ul class="list-group" >
									<li class="list-group-item"><strong><a><%=wishList.get(i).getProductName()%></a></strong></li>
									<li class="list-group-item"><strong>color <%=wishList.get(i).getColour()%> size <%=wishList.get(i).getSizu() %></strong></li>
									<li class="list-group-item"><button type="button" class="btn btn-default">옵션변경</button></li> <!--  onclick구현 -->
								</ul>
							</div>
						</div>
					</td>
					<td><%=wishList.get(i).getPrice() %>원</td>
					<td><%=wishList.get(i).getWishQuantity() %>개</td>
					<td><%=wishList.get(i).getPrice()*wishList.get(i).getWishQuantity()*0.02 %></td>
					<% if(wishList.get(i).getPrice()>50000){ %>
						<td>무료</td>
						<td><%=wishList.get(i).getPrice()*wishList.get(i).getWishQuantity() %>원</td>
					<%}else{  %>
						<td>2500원</td>
						<td><%=wishList.get(i).getPrice()*wishList.get(i).getWishQuantity()+2500 %>원</td>
					<%} %>
					<td>
						<div class="buttonGroup">
							<button type="button" class="btn btn-default">주문하기</button>
							<button type="button" class="btn btn-default">장바구니 등록</button>
							<button type="button" class="btn btn-default">삭제</button>
						</div>
					</td>
				</tr>
				<%} 
				}%> --%>
			</tbody>
		</table>
		<div id="wishCRUDBtn">
			<button type="button" class="btn btn-default" onclick="allWishDel(${loginMem.num})">전체삭제</button>
			<!-- ~~~~~~~~~~~~~~~mem_num으로 바꿔야댐~~~~~~~~`~~~~~~~~~~~~-->
			<button type="button" class="btn btn-default" >선택주문</button>
			<button type="button" class="btn btn-default"  onclick="delWishSelected(${loginMem.num})">선택삭제</button>
			<button class="btn btn-default pull-right">전체상품 주문</button>
		</div>
		<jsp:include page="/common/paging.jsp"/>
		<!-- <div id="pagingBtn">
			<ul class="pagination">
				<li>
					<a href="#" aria-label="Previous">
						<span aria-hidden="true">&laquo; Pre</span>
					</a>	
				</li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li>
					<a href="#" aria-label="Next">
						<span aria-hidden="true">Next &raquo;</span>
					</a>	
				</li>
			</ul>
		</div> -->
	</div>
<script>
/* var popoverTemplate = [
	'<div class="popover" role="tooltip">',
		' <div class="popover-arrow">',
		'</div>',
		'<h3 class="popover-title"></h3>',
		'<div class="popover-content"></div>',
	'</div>'
].join(''); */
/* $("[data-toggle = 'popover']").Popover({
	/* html : true,
	template : popoverTemplate 
}); */
$("[data-toggle = 'popover']").Popover();
$("#allCheck").click(function(){
	if(this.checked){
		$('input:checkbox[class*="checkWish"]').each(function(){
			this.checked = true;
		});
	} else {
		$('input:checkbox[class*="checkWish"]').each(function(){
			this.checked = false;
		});
	}	
});

var delWishSelected=function(mem_num){
	if(${(fn:length(wishList))!=0}){
		var url ="http://localhost:9999/classic_shop/user/wish/remove.do?num="+mem_num+"&product_num=";
		/* var url ='<c:url value="/order/delwish.do?num='+mem_num+'&product_num="/>'; */
		var method="GET";
		var http = new XMLHttpRequest();
		$('input:checkbox[class*="checkWish"]').each(function(){
			if(this.checked){
				url+=this.value+"_";
			}		
		});
		url=url.substr(0, url.length-1);
		http.onreadystatechange=function(){
			if(this.readyState==4 && this.status==200){
				var delete_json = JSON.parse(this.response);
				if(delete_json["delete"]){
					alert("삭제되었습니다.");
					location.reload();
				}else{
					alert("삭제실패");
				}
			}
		}
		http.open(method,url,true);
		http.send();
	} else {
		alert("wish list가 비었습니다.");
	}
}
var allWishDel = function(mem_num){
	if(${(fn:length(wishList))!=0}){
		var url ="http://localhost:9999/classic_shop/user/wish/remove.do?num="+mem_num;
		/* var url ='<c:url value="/order/delwish.do?num='+mem_num+'"/>'; */
		var method="DELETE";
		var http = new XMLHttpRequest();
		http.onreadystatechange=function(){
			if(this.readyState==4 && this.status==200){
				var delete_json = JSON.parse(this.response);
				if(delete_json["delete"]){
					alert("삭제되었습니다.");
					location.reload();
				}else{
					alert("삭제실패");
				}
			}
		}
		http.open(method,url,true);
		http.send();
	} else {
		alert("wish list가 비었습니다.");
	}
}
var pickWishDel = function(mem_num,product_num){
	var url ="http://localhost:9999/classic_shop/user/wish/remove.do?num="+mem_num+"&product_num="+product_num;
	/* var url ='<c:url value="/order/delwish.do?num='+mem_num+'&product_num='+product_num+'"/>'; */
	var method= "PUT";
	var http = new XMLHttpRequest();
	console.log
	http.onreadystatechange=function(){
		if(this.readyState==4 && this.status==200){
			var delete_json = JSON.parse(this.response);	
			console.log(delete_json["delete"]);
			if(delete_json["delete"]){
				alert("삭제되었습니다.");
				location.reload();
			}else{
				alert("삭제실패");
			}
		}
	}
	http.open(method,url,true);
	http.send();
}
</script>