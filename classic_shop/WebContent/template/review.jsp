<%@ page pageEncoding="UTF-8"%>
<hr>
		
<ul class="list-group"> 
	<li class="list-group-item">
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