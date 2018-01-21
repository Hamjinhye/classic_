<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</head>
<style>
#orderNumInfo{
	border: solid 1px;
	padding-left: 8px;
}
#orderNumInfo p{
	margin: 3px;
}
</style>
<body>
<!--  새 칭으로 open -->
<div class="container-fluid common-body-container">
	<div class="row">
		<div class="col-sm-9 ml-sm-auto col-md-10 pt-3 common-right-body">
			<div class="common-right-title">
				<p class="h3">주문상세정보</p>
			</div>
			<div class="common-inner-body">
				<div id="orderNumInfo">
					<p>주문번호: 123456 	주문일시 : 2017-11-14 HH:mm:ss</p>
				</div>
				<div>
					<table class="table table-default">
						<tr class="table-active">
							<th>총 결제금액</th>
							<th>총 취소금액</th>
							<th>총 환불금액</th>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
