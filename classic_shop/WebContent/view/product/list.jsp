<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/public/css/product.css' />">
</head>


<body>
<div class="product_body container">
<div id="productTitle">
	<h2><a class="cate" href="<c:url value='product.do?cate=0&num=${cate.num}'/>">${cate.name}</a></h2>
	
  <p> 
	<c:forEach var="mini" items="${miniCateList}">
  		<a href="<c:url value='/product.do?cate=1&num=${mini.num}' />" class="cate">${mini.name}</a>

	</c:forEach>
  </p>
</div>

<div class="product_list" data-example-id="thumbnails-with-custom-content">
	<div class="row">
		<c:forEach var="list" items="${productList}">
		<div class="col-sm-6 col-md-4">

			<div class="thumbnail border-0" style="border: none;">
			<a href="<c:url value='/detail.do?num=${list.num}' />">
			<img data-src="holder.js/100%x200" alt="400x400" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMzE5IiBoZWlnaHQ9IjIwMCIgdmlld0JveD0iMCAwIDMxOSAyMDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjxkZWZzLz48cmVjdCB3aWR0aD0iMzE5IiBoZWlnaHQ9IjIwMCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjEyMC41NzAzMTI1IiB5PSIxMDAiIHN0eWxlPSJmaWxsOiNBQUFBQUE7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6MTVwdDtkb21pbmFudC1iYXNlbGluZTpjZW50cmFsIj4zMTl4MjAwPC90ZXh0PjwvZz48L3N2Zz4=" data-holder-rendered="true" style="height: 400px; width: 400px; display: block;">
			</a>
			
				<div class="product_caption">
				  <p class="product_name product_colorchip">
				  	<table style="width: 100%; height: 50px">
				  		<tr style="border-bottom: 1px solid #ced4da;"> 
				  			<td>
					  			<a href="<c:url value='/detail.do?num=${list.num}' />" class="cate">${list.name}</a> <!--css랑 링크 색상 없애는 거 잘봐 이름 바꾸거나 새로 추가한게 안된다. -->
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
		          	
		          </p>
		          <p class="product_price">	<fmt:formatNumber type="Number" pattern="#,###" value="${list.price}" /></p>
		          <p class="product_description">${list.main_info }</p>
				</div>
			 </div>
		 </div>
		 </c:forEach>
	</div>
    
</div>
  
  <jsp:include page="/common/paging.jsp"/>
	
</div>