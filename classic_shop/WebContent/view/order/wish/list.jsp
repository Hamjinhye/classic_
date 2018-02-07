<%@page import="com.classic.order.dto.WishDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/public/css/order.css' />">
<script src="<c:url value='/public/js/order.js'/>"></script>
</head>
<body>
<body>
	<div class="container" id="mainDiv">
		<h2 class="text-left mb-0" id="wishName">WISH LIST</h2>
		<table class="table" id="wishTable">
			<thead id="wishTitle" class="align-top">
				<tr>
					<th width="5%"><input type="checkbox" id="allCheck" onclick="checkAll(this)"></th>
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
							<td><input type="checkbox" value="${wish.productNum}" class="checkWish paramValue" name="product_num" ></td>
							<td class="infoList">
								<div class="infoListDiv">
									<div>
										<a href="<c:url value='/detail.do?num=${wish.productNum}'/>">
											<p>이미지임</p>
										</a>
									</div>
								</div>
								<div class="infoListDiv">
									<ul class="list-group">
										<li class="list-group-item"><strong><a href="<c:url value='/detail.do?num=${wish.productNum}'/>"><input type="hidden" name="product_name" value="${wish.productName}" class="paramValue">${wish.productName}</a></strong></li>
										<li class="list-group-item"><strong>color : ${wish.colour}   <input type="hidden" name="product_colour" value="${wish.colour}" class="paramValue">size : ${wish.sizu}<input type="hidden" name="product_sizu" value="${wish.sizu}" class="paramValue"> </strong></li>
										<li class="list-group-item">
											<button type="button" class="btn btn-default" data-toggle="modal" data-target="#wishOption${wish.productNum}"  onclick="productOptionSelect(${loginMem.num},${wish.productNum})">옵션변경</button></li>
										<div class="modal fade" id="wishOption${wish.productNum}" tabindex="-1" role="dialog">
  											<div class="modal-dialog" role="document">
  												<div class="modal-content">
     												<div class="modal-header">
     	  												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
     	  												<span aria-hidden="true">&times;</span></button>
      													<h3 class="modal-title" id="myModalLabel">옵션변경</h3>
      												</div>
      												<form action="wish/option.do" method="PUT">
	      												<div class="modal-body row" style="display: inline-block!important;" id="optionSelect${wish.productNum}">
	     												</div>
	      												<div class="modal-footer">
	      													<button type="reset" class="btn btn-default">초기화</button>
	        												<button type="button" class="btn btn-default">변경</button>
	      												</div>
      												</form>
   												</div>
 											</div>
										</div> 
									</ul>
								</div>
							</td>
							<td><input type="hidden" name="price" value="${wish.price}" class="paramValue">${wish.price}원</td>
							<td><input type="hidden" name="wishQuantity" value="${wish.wishQuantity}" class="paramValue">${wish.wishQuantity}개</td>
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
									<a type="button" class="btn btn-default partOrder" href="<c:url value='/cart.do?num=${loginMem.num}&productNum=${wish.productNum}'/>">장바구니 등록</a>									
									<a type="button" class="btn btn-default partOrder" href='<c:url value="/user/ordersheet.do?num=${loginMem.num}&cookie=f&productNum=${wish.productNum}"/>'>주문하기</a>									
									<button type="button" class="btn btn-default" onclick="pickWishDel(${loginMem.num},${wish.productNum})">삭제</button>
								</div>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="8" class="emptyTableData">wish list가 비었습니다.<td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>
		</table>
		<div id="wishCRUDBtn">
			<button type="button" class="btn btn-default" onclick="allWishDel(${loginMem.num})">전체삭제</button>
			<button type="button" class="btn btn-default" onclick="CheckGoSheet(${loginMem.num})">선택주문</button>
			<button type="button" class="btn btn-default"  onclick="delWishSelected(${loginMem.num})">선택삭제</button>
			<button class="btn btn-default" onclick="GoCartWishSelected(${loginMem.num})">선택 상품 장바구니 등록</button>
			<button class="btn btn-default pull-right" onclick="AllGoSheet(${loginMem.num})">전체상품 주문</button>
		</div>
		<c:if test="${(fn:length(wishList))!=0}">
			<jsp:include page="/common/paging.jsp"/>
		</c:if>
	</div>
