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
				<!-- <tr>
					<td><input type="checkbox"></td>
					<td id ="cartDetailList">
						<div id="cartDetailListDiv">
							<div>
								<p><a href="#">이미지임</a></p>
							</div>
							<div>
								<ul class="list-group" >
									<li class="list-group-item"><strong><a href="#">product Name</a></strong></li>
									<li class="list-group-item"><strong><a href="#">color 검정 size M</a></strong></li>
									<li class="list-group-item"><button type="button" class="btn">옵션변경</button></li>
								</ul>
							</div>
						</div>
					</td>
					<td>100000원</td>
					<td>
						<div id="productQuantity">
							<div>
								<input type="number" value="1" min="1">
							</div>
							<div>
								<button class="btn" >변경</button>
							</div>					
						</div>
					</td>
					<td>20원</td>
					<td>0원</td>
					<td>100000원</td>
					<td>
						<div class="btn-group" id="cartListBtn">
							<button type="button" class="btn" >주문하기</button>
							<button type="button" class="btn">WISH LIST 등록</button>
							<button type="button" class="btn">삭제</button>
						</div>
					</td>
				</tr> -->
				<!-- <tr>
					<td><input type="checkbox"></td>
					<td id="cartDetailList2">
						<div id="cartDetailListDiv2">
							<div>
								<p><a href="#">이미지임</a></p>
							</div>
							<div>
								<ul class="list-group" >
									<li class="list-group-item"><strong><a href="#">product Name</a></strong></li>
									<li class="list-group-item"><strong><a href="#">color 검정 size M</a></strong></li>
									<li class="list-group-item"><button type="button" class="btn">옵션변경</button></li>
								</ul>
							</div>
						</div>
					</td>
					<td>100000원</td>
					<td>
						<div id="productQuantity2">
							<div>
								<input type="number" value="1" min="1">
							</div>
							<div>
								<button class="btn" >변경</button>
							</div>					
						</div>
					</td>
					<td>20원</td>
					<td>0원</td>
					<td>100000원</td>
					<td>
						<div class="btn-group" id="cartListBtn2">
							<button type="button" class="btn">주문하기</button>
							<button type="button" class="btn">장바구니 등록</button>
							<button type="button" class="btn">삭제</button>
						</div>
					</td>
				</tr> -->
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
			<button type="button" class="btn"><strong>전체 상품 주문</strong></button>
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
	/* var pInfo;
	var value; */
	//var temp = 0; 
	for(i=0; i<cookies.length; i++){
		var key = cookies[i].split("=")[0].trim();
		//console.log(key);
		//console.log(eval("map"+i));
		if(key.startsWith("classic_")){
			pNum = key.split("_")[1].trim();
			var pInfo = key.split("_")[2].trim();			//productInfo
			var value = cookies[i].split("=")[1].trim();
			//console.log(pNum+"="+pInfo+"="+value);
			if(eval("typeof(c"+pNum+")=='undefined'")){
				eval("var c"+pNum+"= {}");
				eval("c"+pNum+"."+pInfo+"=\""+value+"\"");
			} else {
				eval("c"+pNum+"."+pInfo+"=\""+value+"\"");
			}
			/* if(temp!=pNum){
				temp = pNum;
				console.log("temp : "+temp);
				console.log(pInfo);
				console.log(value);  
				eval("var c"+pNum+"= {}");
				eval("c"+pNum+"."+pInfo+"=\""+value+"\"");
				console.log(eval("c"+pNum));
			}else{
				console.log(pNum);
				console.log(pInfo);
				console.log(value);  
				eval("c"+pNum+"."+pInfo+"=\""+value+"\"");
			} */
		}
		//이미지 경로 붙은면 length가 4가 될수도
		if(eval("Object.keys(c"+pNum+").length==3")){
			product[pNum]=eval("c"+pNum);
		} else if(eval("Object.keys(c"+pNum+").length==5")){
			product[pNum]=eval("c"+pNum);
		}
	}
	//console.log(product);
	//product[pNum] = info;
	//console.log(product);
	var table = document.getElementById("cartContents");
	//console.log(table);
	/* console.log(product);
	console.log(Object.keys(product).length); */
	var innerText ="";
	var key ;
	for(key in product){
		//if(product[key].size==undefined){console.log("eld");}
		innerText +='<tr>';
		innerText +='	<td><input type="checkbox"></td>';
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
</script>