<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/public/css/order.css' />">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="<c:url value='/public/js/order.js'/>"></script>
</head>
<body>
	<div class="container" id="orderMainDiv">
		<h2 id="orderName">주문서</h2>
		<h2>${couponList}</h2>
		<form action="addorder.do" method="post">
		<table class="table" id="benefitInfo">
			<tr>
				<th width="10%">혜택정보</th>
				
				<td width="90%">
					<div>
						<input type="hidden" name="memNum" value="${loginMem.num}">
						<p><span>${loginMem.id}</span>님의 회원 등급은 <span>
						<c:if test="${loginMem.grade==0}">
							관리자
						</c:if>
						<c:if test="${loginMem.grade==1}">
							Lv.1
						</c:if>
						<c:if test="${loginMem.grade==2}">
							Lv.2
						</c:if>
						<c:if test="${loginMem.grade==3}">
							Lv.3
						</c:if>
						</span> 입니다.</p>					
					</div>
					<div>
						<p>쿠폰  :  <span>${coupon}</span>  장 </p>
					</div>
				</td>
			</tr>
		</table>
		<table class="table">
			<tbody id="orderTitle">
				<tr>
					<th width="5%"><input type="checkbox"></th>
					<th width="45%">상품정보</th>
					<th width="10%">판매가</th>
					<th width="10%">수량</th>
					<th width="10%">배송구분</th>
					<th width="10%">배송비</th>
					<th width="10%">합계</th>
				</tr>
			</tbody>
			<tbody id="orderContents">
				<c:forEach var="product" items="${productList}">
				<tr>
					<td><input type="checkbox"></td>
					<td id ="orderDetailList">
						<div id="orderDetailListDiv" class="row clearfix">
							<div class="col-2 float-left">
								<p class="productThumb"><a href="#">이미지임</a></p>
							</div>
							<div class="col-10 float-left">
								<ul class="list-group" >
									<li class="list-group-item"><strong><a href="#"><input type="hidden" name="productNum" value ="${product.productNum}">${product.productName}</a></strong></li>
									<li class="list-group-item row ">
										<p class="col-2">color</p>"${product.colour}
										<input class="col-4" type="hidden" name="colour" value ="${product.colour}">
										<p class="col-2">size</p> ${product.sizu}
										<input class="col-4" type="hidden" class="form-item" name="sizu" value ="${product.sizu}" >
									</li>
								</ul>
							</div>
						</div>
					</td>
					<td>${product.price}</td>
					<td><input type="text" class="form-item text-center" name="quantity" value ="${product.wishQuantity}" style="border: hidden;" readonly="readonly"></td>
					<td>기본배송</td>
					<td>
						<c:if test="${product.price>50000}">
							<p>무료</p>
						</c:if>
						<c:if test="${product.price<50000}">
							<p>2500</p>
						</c:if>
					</td>
					<td>
						<c:if test="${product.price>50000}">
							<input type="text" class="form-item text-center" name="price" value ="${product.price}" style="border: hidden;">
						</c:if>
						<c:if test="${product.price<50000}">
							<input type="text" class="form-item text-center" name="price" value ="${product.price+2500}" style="border: hidden;">  
						</c:if>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="container" id="paymentInfo">
			<p class="h5">*상품의 옵션 및 수량변경은 상품 상세 또는 장바구니에서 변경 가능합니다.</p>
			<p>상품구매금액   <span></span>원 + 배송비 <span>0</span>원 = 합계: <span>200,000</span>원</p>
		</div>
		<button class="btn btn-defult" id="selectProductDel">선택 상품 삭제</button>
		<div id="orderInfo">
			<p>주문정보 <span class="redRound">10</span><span>필수</span></p>
			<table class ="table orderTab">
				<tr>
					<th class="tabFirst">주문하시는  분</th>
					<td class="tabSecond "><span class="redRound">10</span></td>
					<td class="tabThird" ><input type="text" name="orderMemName"></td>
				</tr>
				<tr>
					<th class="tabFirst">주소</th>
					<td class="tabSecond"><span class="redRound">10</span></td>
					<td class="tabThird" ><input type="text" id="orderPostcode" name="orderPostcode"><button type="button" class="btn" onclick='OrderDaumPostcode()'>우편번호</button></td>
				</tr>
				<tr>
					<th class="tabFirst"></th>
					<td class="tabSecond"></td>
					<td class="tabThird" ><input type="text" name ="orderAddress"value="기본주소" id="orderAddress"></td>
				</tr>
				<tr>
					<th class="tabFirst"></th>
					<td class="tabSecond"></td>
					<td class="tabThird" ><input type="text" value="상세주소" id="orderAddress2" name="orderAddress2"></td>
				</tr>
				<tr>
					<th class="tabFirst">일반전화</th>
					<td class="tabSecond"><span class="redRound">10</span></td>
					<td class="tabThird" ><input type="number" name="orderHomeNumber"></td>
				</tr>
				<tr>
					<th class="orderTab tabFirst">휴대전화</th>
					<td class="tabSecond"><span class="redRound sec">10</span></td>
					<td class="tabThird"><input type="number" name="orderPhone"></td>
				</tr>
			</table>
		</div>
		<div id="delivInfo">
			<p>배송정보     <span class="redRound">10</span><span>필수</span></p>
			<table class ="table">
				<tr>
					<th class="tabFirst">배송지선택</th>
					<td class="tabSecond"></td>
					<td class="tabThird" id="adressChoiceBtn">
						<div class="radio ">
							<label><input type="radio" name="optraio" id="getOrderInfo" >주문자 정보와 동일</label>
						</div>
						<div class="radio">
							<label><input type="radio" name="optraio" checked>새로운 배송지</label>
						</div>
						<button type="button" onclick='javascript:window.open()'>주소록보기</button>
					</td>
				</tr>
				<tr>
					<th class="tabFirst">주문하시는  분</th>
					<td class="tabSecond"><span class="redRound">10</span></td>
					<td class="tabThird"><input type="text" name="delivName"></td>
				</tr>
				<tr>
					<th class="tabFirst">주소</th>
					<td class="tabSecond"><span class="redRound">10</span></td>
					<td class="tabThird" ><input type="text" name='delivPostcode' id='delivPostcode'><button type="button" class="btn" onclick='DelivDaumPostcode()'>우편번호</button></td>
				</tr>
				<tr>
					<th class="tabFirst"></th>
					<td class="tabSecond"></td>
					<td class="tabThird" ><input type="text" value="기본주소" id='delivAddress' name ="delivAddress"></td>
				</tr>
				<tr>
					<th class="tabFirst"></th>
					<td class="tabSecond"></td>
					<td class="tabThird" ><input type="text" value="상세주소" id='delivAddress2' name="delivAddress2"></td>
				</tr>
				<tr>
					<th class="tabFirst">일반전화</th>
					<td class="tabSecond"><span class="redRound">10</span></td>
					<td class="tabThird" ><input type="number" name="delivHomeNumber"></td>
				</tr>
				<tr>
					<th class="tabFirst">휴대전화</th>
					<td class="tabSecond"><span class="redRound">10</span></td>
					<td class="tabThird" ><input type="number" name="delivPhone"></td>
				</tr>
				<tr>
					<th class="delivTab tabFirst">배송메세지</th>
					<td class="tabSecond"></td>
					<td class="tabThird">
						<div class="form-group">
							<textarea class="form-control" rows="5" id="delivComent" name="delivComent"></textarea>
							<p>배송 메세지란에는 배송시 참고 할 사항이 있으면 적어주세요.</p>
						</div>
					</td>
				</tr>
				
			</table>
		</div>
		<div id="payAmount">
			<p>결제예정금액</p>
			<table class="table table-bordered">
				<tr>
					<th>총 주문금액</th>
					<th>총할인+부가결제금액</th>
					<th>총 결제 예정금액</th>
				</tr>
				<tr>
					<td>200,000원</td>
					<td id="discountPrice"></td>
					<td>200,000원</td>
				</tr>
			</table>
			<table class="table">
				<tr>
					<th>총 할인금액</th>
					<td><span><input value=""></span></td>
				</tr>
				<tr>
					<th>총 부가결제금액</th>
					<td><strong>0원</strong></td>
				</tr>
				<tr>
					<th>쿠폰사용</th>
					<td>
						<select name="couponNum" onchange="selectCoupon()" id="couponSelect">
						<c:forEach var="coupon" items="${couponList}">
							<option value="${coupon.num}_${coupon.sale}">${coupon.coupon_name}</option>
							<script>console.log("'${coupon.num}'은 '${coupon.sale}'");</script>
						</c:forEach>
							<option value="0">사용안함</option>
						</select>
					</td>
				</tr>
			</table>
			
			
			
		</div>
		<div id="methodPay">
			<p id="payName">결제수단</p>
			<div id="methodPayDetail" class="container clear-fix">
				<div class="col-6">
					<div class="row d-inline">
						<div class="radio col-3">
							<label><input type="radio" name="payWith"  value="0" checked>무통장입금</label>
						</div>
						<div class="radio col-3">
							<label><input type="radio" name="payWith" value="1">신용카드</label>
						</div>
					</div>
					<div id="payBank">
						<label>입금자명 : <input type="text" name="depositName"></label><br>
						<label>입금은행: 
							<select>
								<option value="1">국민(241587-51-17452)</option>
								<option value="2">하나(899631-158-2564)</option>
								<option value="3">신한(62583-8550-8874)</option>
							</select>
						</label>
					</div>
				</div>
			</div>
			<div id="finalAmount" class="col-6">
				<p><span>무통장입금</span>최종 결제 금액</p>
				<h2>200,000원</h2>
				<p><input type="checkbox" value="true">결제 정보를 확인하였으며, 구매 진행에 동의 합니다.</p>
				<button type="submit" class="btn btn-primary btn-lg">결제하기</button>
			</div>
		</div>
		</form>
		<div id="orderInfoText">
			<p><strong>주문<br>이용 안내 공간</strong></p>
		</div>
	</div>
