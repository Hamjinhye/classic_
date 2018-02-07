<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/public/css/product.css' />">
</head>


<body>
<div class="product_body container">
<div id="productTitle">
	<h2><a class="cate" href="<c:url value='product.do?cate=0&num=${cate.num}'/>">${cate.name}</a><!-- Cate --></h2>
	
  <p> <!-- miniCate -->
	<c:forEach var="mini" items="${miniCateList}">
  		<a href="<c:url value='/product.do?cate=1&num=${mini.num}' />" class="cate">${mini.name}</a>
	</c:forEach>
  </p>
</div>
 
 <script>
 //console.log(${coloursList});
 </script>
<div class="product_list" data-example-id="thumbnails-with-custom-content">
	<div class="row">
		<c:forEach var="list" items="${productList}">
		<div class="col-sm-6 col-md-4">

			<div class="thumbnail border-0" style="border: none;">
			
			<a href="<c:url value='/detail.do?num=${list.num}&page=1' />">
			<img class="img-thumbnail" src="<c:url value='/public/img/test_img.png'/>" >
			</a>
			
				<div class="product_caption">
				  <p class="product_name product_colorchip">
				  	<table style="width: 100%; height: 50px">
				  		<tr style="border-bottom: 1px solid #ced4da;"> <!-- 마진을 div 넓이만큼 -->
				  			<td>
					  			<a href="<c:url value='/detail.do?num=${list.num}&page=1' />" class="cate">${list.name}</a> <!--css랑 링크 색상 없애는 거 잘봐 이름 바꾸거나 새로 추가한게 안된다. -->
					  		</td>
					  		<td style="text-align: right;">
			          			<c:forEach var="colour" items="${coloursList}">
			          				<c:if test="${list.num eq colour.product_num}">
										<span style="display: inline-block; width:10px; height:10px; background-color:#${colour.code};"></span>
			          				</c:if>
							
			          			</c:forEach>
		          			</td>
				  		</tr>
				  	</table>
		          	
		          <p class="product_price">	<fmt:formatNumber type="Number" pattern="#,###" value="${list.price}" /></p>
		          <p class="product_description">${list.main_info }</p>
				</div>
			 </div>
		 </div>
		 </c:forEach>
	</div><!-- row -->
    
</div>
  
 <%--  <jsp:include page="/common/paging.jsp"/> --%>
	
</div>