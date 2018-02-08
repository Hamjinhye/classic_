<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.pagination > .active > a, .pagination > .active > a:hover, .pagination > .active > a:focus{
background-color: #000;
	color: #fff;
}
.pagination li a{
	border: hidden;
	color: #000;
}
.pagination li a:focus, .pagination li a:hover {
	color: #000;
}
</style>
<div id="pagingBlock" align="center">
	<ul class="pagination">
		<li>
			<a href="javascript:loadReview(${num},${p.startBlock})" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span>
			</a>
		</li>
		<c:if test="${p.startBlock > p.pageBlock}">
			<li><a href="javascript:(${num},${p.startBlock-1})">이전</a></li>
		</c:if>
		<c:forEach var="i" begin="${p.startBlock}" end="${p.endBlock}">
			<c:choose>
				<c:when test="${p.pageNum==i}">
					<li class="active"><a href="#">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="javascript:loadReview(${num},${i})">${i}</a></li><!-- 현재 페이지 -->
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${p.endBlock < p.totalBlock}">
			<li><a href="javascript:loadReview(${num},${p.endBlock+p.pageBlock})">다음</a></li>
		</c:if>
		<li>
			<a href="javascript:loadReview(${num},${p.endBlock})" aria-label="Next">
				<span aria-hidden="true">&raquo;</span>
			</a>
		</li>
	</ul>
</div>



