<%@ page pageEncoding="UTF-8"%>
<hr>
		
<ul class="list-group"> 
	<li class="list-group-item">
		<div class="row">
			<p align="left" class="container">
			<button id="reviewBtn" data-toggle="collapse" data-target="#reviewForm" class="btn btn-default">리뷰작성</button></p>
		</div>
		<div id="reviewForm" class="row collapse"> 
			<div class="col-md-6">
				<form action="review/regist.do" method="post">
					<div class="form-group row">
						<label class="col-md-4">신체 사이즈</label>
						<div class="col-md-8">
							<input class="form-control" type="text" name="body_size">
						</div>
					</div> 
					<div class="form-group row">
						<label class="col-md-4">내용</label>
						<div class="col-md-8">
							<textarea rows="4" class="form-control"></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-md-4">사진등록</label>
						<div class="col-md-8">
							<input type="file" class="form-control-file" id="exampleFormControlFile1">
						</div>
						
					</div>
					<div class="form-group container" align="right">
						<button class="btn btn-danger" type="reset">취소</button>
						<button class="btn btn-default" type="button" onclick="javascript:registReview()">등록</button>
					</div>
				</form>
			</div>
			<div class="col-md-6">
			</div>
		</div>
		<c:forEach var="list" items="${reviewList}" varStatus="i">
			<ul class="list-group">
				<div class="item">
					<a data-toggle="collapse" data-parent="#exampleAccordion" href="#exampleAccordion${i.index}" role="button" aria-expanded="true" aria-controls="exampleAccordion1">
					<div>
						<li class="list-group-item stars text-warning">
							<table style="width: 100%">
								<tr>
									<td>
										<c:forEach begin="1" end="${list.star}">
											<i class="fa fa-star"></i>
										</c:forEach>
										<c:forEach begin="1" end="${5-list.star}">
											<i class="fa fa-star-o"></i>
										</c:forEach>
									</td>
									<td style="width:65%">
										${list.product_name}
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
							<li class="list-group-item content h5" id="reviewList${i.index}">
								신체 사이즈 : ${list.body_size}<br>
								구입 색상 : ${list.colour_name}<br>
								구입 사이즈 : ${list.product_size}<br>
								<hr>
								${list.content}
								<br>
								${list.img_path}
								<i class="fa fa-image fa-4x"></i>
							</li>
	  					</div>
					</div>
				</div>
		
			</ul>
		</c:forEach>
		
		<jsp:include page="/template/reviewPaging.jsp"/>
	</li>
</ul>
		
		
		
<script>
var registReview = function(){
	alert("리뷰 등록 실패");
}

var loadReview = function(num,page){
	$.ajax({
		url: "product/review.do?num="+num+"&page="+page,
		type: "GET",
		dataType: "json",
		success:function(data){
			console.log(data);
		}
		
	});
}

$('[data-toggle=collapse]').on('show', function () {
	  $(this).show();
	}).on('hidden', function () {
	  $(this).css("display", "none");
	});
	
	
			
</script>