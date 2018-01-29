<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/public/css/order.css' />">
</head>
<body>
	<div class="container" id="cartMainDiv">
		<h2 class="text-left" id="cartName">CART</h2>
		<table class="table" id="cartTable">
			<tbody id="cartTitle">
				<tr>
					<th width="5%"><input type="checkbox"></th>
					<th width="45%">상품정보</th>
					<th width="10%">판매가</th>
					<th width="10%">수량</th>
					<th width="10%">배송비</th>
					<th width="10%">합계</th>
					<th width="10%">선택</th>
				</tr>
			</tbody>
			<tbody id="cartContents">
			</tbody>
		</table>
		<div class="btn-group" id="cartCRUDBtn">
			<button type="button" class="btn">전체삭제</button>
			<button type="button" class="btn">선택주문</button>
			<button type="button" class="btn">선택삭제</button>
			<button type="button" class="btn">선택한 상품을<br> 위시리스트에 등록</button>
		</div>
		<div>
			<table class="table table-bordered" id="AllPriceTab">
				<tr>
					<th>총 상품금액</th>
					<th>총 배송비</th>
					<th>총 결제예상금액</th>
				</tr>
				<tr>
					<td>200,000원</td>
					<td>0원</td>
					<td>200,000원</td>
				</tr>
			</table>
		</div>
		<div id="paidUpdateBtn">
			<button type="button" class="btn" onclick="AllCartGoSheet(${loginMem.num})"><strong>전체 상품 주문</strong></button>
			<button type="button" class="btn"><strong>선택 상품 주문</strong></button>
		</div>
		<div id="cartInfo">
			<p>장바구니 안내문</p>
		</div>
	</div>
<script>
	var cookies = document.cookie.split(";");
	var product = {};
	var pNum;
	for(i=0; i<cookies.length; i++){
		var key = cookies[i].split("=")[0].trim();
		if(key.startsWith("classic_")){
			pNum = key.split("_")[1].trim();
			var pInfo = key.split("_")[2].trim();			
			var value = cookies[i].split("=")[1].trim();
			if(eval("typeof(c"+pNum+")=='undefined'")){
				eval("var c"+pNum+"= {}");
				eval("c"+pNum+"."+pInfo+"=\""+value+"\"");
			} else {
				eval("c"+pNum+"."+pInfo+"=\""+value+"\"");
			}
		}
		if(eval("Object.keys(c"+pNum+").length==5")){
			product[pNum]=eval("c"+pNum);
		}
	}
	var table = document.getElementById("cartContents");
	var innerText ="";
	var key ;
	for(key in product){
		innerText +='<tr>';
		innerText +='	<td><input type="checkbox" class="checkCart" value="'+product[key]+'"></td>';
		innerText +='	<td id ="cartDetailList">';
		innerText +='		<div id="cartDetailListDiv">';
		innerText +='			<div>';
		innerText +='				<p><a href="#">이미지임</a></p>';
		innerText +='			</div>';
		innerText +='			<div>';
		innerText +='				<ul class="list-group" >';
		innerText +='					<li class="list-group-item"><a href="#">'+product[key].name+'</a></li>';
		innerText +='					<li class="list-group-item">';
		innerText += (product[key].colour==undefined)?"":"color"+product[key].colour;
		innerText += (product[key].sizu==undefined)?"":"sizu"+product[key].sizu;
		innerText +='					</li>';
		innerText +='					<li class="list-group-item"><button type="button" class="btn btn-default">옵션변경</button></li>';
		innerText +='				</ul>';
		innerText +='			</div>';
		innerText +='		</div>';
		innerText +='	</td>';
		innerText +='	<td>'+product[key].price+'</td>';
		innerText +='	<td>';
		innerText +='		<div id="productQuantity">';
		innerText +='			<div>';
		innerText +='				<input type="number" value="'+product[key].count+'" min="1">';
		innerText +='			</div>';
		innerText +='			<div>';
		innerText +='				<button class="btn btn-default" >변경</button>';
		innerText +='			</div>';					
		innerText +='		</div>';
		innerText +='	</td>'
		innerText +='	<td>';
		innerText += (product[key].price>50000)?"무료":"2500원";
		innerText +='	</td>';
		innerText +='	<td>'+product[key].price+'</td>';
		innerText +='	<td>';
		innerText +='		<div class="btn-group" id="cartListBtn">';
		innerText +='			<button type="button" class="btn btn-default" >주문하기</button>';
		innerText +='			<button type="button" class="btn btn-default">WISH LIST 등록</button>';
		innerText +='			<button type="button" class="btn btn-default">삭제</button>';
		innerText +='		</div>';
		innerText +='	</td>';
		innerText +='</tr>';
	}
	table.innerHTML =innerText;
	
var AllChartGoSheet = function(memNum){
	if(${(fn:length(wishList))!=0}){
		var url ='<c:url value="/user/ordersheet.do?num='+memNum+'&cookie=t&productNum="/>';
		$('input:checkbox[class*="checkCart"]').each(function(){
			url+=this.value+"_";
		});
		url=url.substr(0, url.length-1);
		location.href=url;
	}
}
</script>