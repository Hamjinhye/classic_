<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/public/css/order.css' />">
</head>
<body>
	<div class="container" id="orderMainDiv">
		<h2 id="orderName">주문서</h2>
		<table class="table" id="benefitInfo">
			<tr>
				<th width="10%">혜택정보</th>
				<td width="90%">
					<div>
						<p><span>ham</span>님의 회원 등급은 <span>grade</span> 입니다.</p>					
					</div>
					<div>
						<p>가용적립금  :  <span>1,000</span>  원<br>
						쿠폰  :  <span>0</span>  장 </p>
					</div>
				</td>
			</tr>
		</table>
		<table class="table">
			<tbody id="orderTitle">
				<tr>
					<th width="5%"><input type="checkbox"></th>
					<th width="35%">상품정보</th>
					<th width="10%">판매가</th>
					<th width="10%">수량</th>
					<th width="10%">적립금</th>
					<th width="10%">배송구분</th>
					<th width="10%">배송비</th>
					<th width="10%">합계</th>
				</tr>
			</tbody>
			<tbody id="orderContents">
				<tr>
					<td><input type="checkbox"></td>
					<td id ="orderDetailList">
						<div id="orderDetailListDiv">
							<div>
								<p><a href="#">이미지임</a></p>
							</div>
							<div>
								<ul class="list-group" >
									<li class="list-group-item"><strong><a href="#">product Name</a></strong></li>
									<li class="list-group-item"><strong><a href="#">color 검정 size M</a></strong></li>
								</ul>
							</div>
						</div>
					</td>
					<td>100000원</td>
					<td>1</td>
					<td>20원</td>
					<td>기본배송</td>
					<td>무료</td>
					<td>100000원</td>
				</tr>
				<tr>
					<td><input type="checkbox"></td>
					<td id ="orderDetailList2">
						<div id="orderDetailListDiv2">
							<div>
								<p><a href="#">이미지임</a></p>
							</div>
							<div>
								<ul class="list-group" >
									<li class="list-group-item"><strong><a href="#">product Name</a></strong></li>
									<li class="list-group-item"><strong><a href="#">color 검정 size M</a></strong></li>
								</ul>
							</div>
						</div>
					</td>
					<td>100000원</td>
					<td>1</td>
					<td>20원</td>
					<td>기본배송</td>
					<td>무료</td>
					<td>100000원</td>
				</tr>
			</tbody>
		</table>
		<div class="container" id="paymentInfo">
			<p>*상품의 옵션 및 수량변경은 상품 상세 또는 장바구니에서 변경 가능합니다.</p>
			<p>상품구매금액   <span>200,000</span>원 + 배송비 <span>0</span>원 = 합계: <span>200,000</span>원</p>
		</div>
		<button class="btn btn-defult" id="selectProductDel">선택 상품 삭제</button>
		<div id="orderInfo">
			<p>주문정보 <span class="redRound">10</span><span>필수</span></p>
			<table class ="table orderTab">
				<tr>
					<th class="tabFirst">주문하시는  분</th>
					<td class="tabSecond "><span class="redRound">10</span></td>
					<td class="tabThird" ><input type="text"></td>
				</tr>
				<tr>
					<th class="tabFirst">주소</th>
					<td class="tabSecond"><span class="redRound">10</span></td>
					<td class="tabThird" ><input type="text"><button type="button" class="btn" onclick='javascript:window.open()'>우편번호</button></td>
				</tr>
				<tr>
					<th class="tabFirst"></th>
					<td class="tabSecond"></td>
					<td class="tabThird" ><input type="text" value="기본주소"></td>
				</tr>
				<tr>
					<th class="tabFirst"></th>
					<td class="tabSecond"></td>
					<td class="tabThird" ><input type="text" value="상세주소"></td>
				</tr>
				<tr>
					<th class="tabFirst">일반전화</th>
					<td class="tabSecond"><span class="redRound">10</span></td>
					<td class="tabThird" ><input type="number"></td>
				</tr>
				<tr>
					<th class="orderTab tabFirst">휴대전화</th>
					<td class="tabSecond"><span class="redRound sec">10</span></td>
					<td class="tabThird"><input type="number"></td>
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
						<div class="radio">
							<label><input type="radio" name="optraio" >주문자 정보와 동일</label>
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
					<td class="tabThird"><input type="text"></td>
				</tr>
				<tr>
					<th class="tabFirst">주소</th>
					<td class="tabSecond"><span class="redRound">10</span></td>
					<td class="tabThird" ><input type="text"><button type="button" class="btn" onclick='javascript:window.open()'>우편번호</button></td>
				</tr>
				<tr>
					<th class="tabFirst"></th>
					<td class="tabSecond"></td>
					<td class="tabThird" ><input type="text" value="기본주소"></td>
				</tr>
				<tr>
					<th class="tabFirst"></th>
					<td class="tabSecond"></td>
					<td class="tabThird" ><input type="text" value="상세주소"></td>
				</tr>
				<tr>
					<th class="tabFirst">일반전화</th>
					<td class="tabSecond"><span class="redRound">10</span></td>
					<td class="tabThird" ><input type="number"></td>
				</tr>
				<tr>
					<th class="tabFirst">휴대전화</th>
					<td class="tabSecond"><span class="redRound">10</span></td>
					<td class="tabThird" ><input type="number"></td>
				</tr>
				<tr>
					<th class="delivTab tabFirst">배송메세지</th>
					<td class="tabSecond"></td>
					<td class="tabThird" >
						<div class="form-group">
							<textarea class="form-control" rows="5" id="delivComent"></textarea>
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
					<td>-0 원</td>
					<td>200,000원</td>
				</tr>
			</table>
			<table class="table">
				<tr>
					<th>총 할인금액</th>
					<td><strong>0원</strong></td>
				</tr>
				<tr>
					<th>총 부가결제금액</th>
					<td><strong>0원</strong></td>
				</tr>
				<tr id="payPoint">
					<th>적립금</th>
					<td><input type="number"><p>원 <span>(총 사용 가능 적립금: 3000)</span></p></td>
				</tr>
				<tr>
					<th>쿠폰사용</th>
					<td>
						<select>
							<option>회원가입 기념 쿠폰</option>
							<option>생일기념 할인 쿠폰</option>
							<option>신년기념 할인 쿠폰</option>
						</select>
					</td>
				</tr>
			</table>
		</div>
		<div id="methodPay">
			<p id="payName">결제수단</p>
			<div id="methodPayDetail">
				<div class="radio">
					<label><input type="radio" name="optraio" checked>무통장입금</label>
				</div>
				<div class="radio">
					<label><input type="radio" name="optraio">신용카드</label>
				</div>
				<div id="payBank">
					<label>입금자명 : <input type="text"></label><br>
					<label>입금은행: 
						<select>
								<option value="1">국민(241587-51-17452)</option>
								<option value="2">하나(899631-158-2564)</option>
								<option value="3">신한(62583-8550-8874)</option>
							</select>
					</label>
				</div>
			</div>
			<div id="finalAmount">
				<p><span>무통장입금</span>최종 결제 금액</p>
				<h2>200,000원</h2>
				<p><input type="checkbox" value="true">결제 정보를 확인하였으며, 구매 진행에 동의 합니다.</p>
				<button type="button" class="btn btn-primary btn-lg">결제하기</button>
			</div>
		</div>
		<div id="orderInfoText">
			<p><strong>주문<br>이용 안내 공간</strong></p>
		</div>
	</div>