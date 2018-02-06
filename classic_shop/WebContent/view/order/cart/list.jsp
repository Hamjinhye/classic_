<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/public/css/order.css' />">
<script src="<c:url value='/public/js/order.js'/>"></script>
</head>
<body>
	<div class="container" id="cartMainDiv">
		<h2 class="text-left" id="cartName">CART</h2>
		<table class="table border-bottom-1" id="cartTable">
			<tbody id="cartTitle">
				<tr class="text-center">
					<th width="5%" class="text-center"><input type="checkbox" id="AllCheckCart"></th>
					<th width="45%" class="text-center">상품정보</th>
					<th width="10%" class="text-center">판매가</th>
					<th width="10%" class="text-center">수량</th>
					<th width="10%" class="text-center">배송비</th>
					<th width="10%" class="text-center">합계</th>
					<th width="10%" class="text-center">선택</th>
				</tr>
			</tbody>
			<tbody id="cartContents">
			</tbody>
		</table>
		<div class="btn-group" id="cartCRUDBtn">
			<button type="button" class="btn btn-default">전체삭제</button>
			<button type="button" class="btn btn-default">선택주문</button>
			<button type="button" class="btn btn-default">선택삭제</button>
			<button type="button" class="btn btn-default">선택한 상품을<br> 위시리스트에 등록</button>
		</div>
		<div>
			<table class="table table-bordered" id="AllPriceTab">
				<tr>
					<th class="col">총 상품금액</th>
					<th class="col">총 배송비</th>
					<th class="col">총 결제예상금액</th>
				</tr>
				<tr>
					<td class="col" id="allProductPrice"></td>
					<td class="col" id="delivPrice"></td>
					<td class="col" id="allSellPrice"></td>
				</tr>
			</table>
		</div>
		<div id="paidUpdateBtn" class="text-center">
			<button type="button" class="btn btn-default" onclick="AllCartGoSheet(${loginMem.num})"><strong>전체 상품 주문</strong></button>
			<button type="button" class="btn btn-default" onclick = "CheckCartGoSheet(${loginMem.num})"><strong>선택 상품 주문</strong></button>
		</div>
		<br>
		<div id="cartInfo" class="container">
			<div class="container">
				<p class="h5 "><strong>장바구니 이용안내</strong></p>
			</div>
			<ul>
				<li><small>[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이선택된 모든 상품에 대한 주문/결제가 이루어집니다.</small></li>
				<li><small>선택하신 상품의 수량을 변경하시려면  [옵션변경] 버튼을 눌러 변경가능합니다.</small></li>
				<li><small>장바구니에 담긴 상품은 7일 동안 보관됩니다. 보관된 상품은 7일 이후에 삭제되오니 장바구니에서 삭제된 경우 다시 장바구니에 담으시기 바랍니다.</small></li>
				<li><small>장바구니와 wish list를이용하여 원하시는 상품만 주문하거나 wish list으로 등록하실 수 있습니다.</small></li>
			</ul>
		</div>
	</div>
