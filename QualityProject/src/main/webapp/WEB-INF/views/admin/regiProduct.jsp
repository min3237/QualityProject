<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../headerfooter/header.jsp"%>
<div class="container">

	<ul class="nav nav-fill">
		<li class="nav-item">
		<a class="nav-link" href="../orderCheck" style="color: red"><b>주문관리</b></a>
		</li>
		<li class="nav-item">
		<a class="nav-link" href="../regiProduct" style="color: red"><b>제품관리</b></a>
		</li>
		<li class="nav-item">
	    <a class="nav-link" href="../queryReply" style="color:red"><b>문의답변관리</b></a>
	  </li>
	   <li class="nav-item">
	    <a class="nav-link" href="../regiNotice" style="color:red"><b>공지/이벤트관리</b></a>
	  </li>
	</ul><hr><br><br>

	<h3 style="text-align:center">제품 관리 페이지</h3><br>

	<div class="mb-3 row gara">
		<table>
			<tr style="border-bottom-width: 2px;">
				<th>번호</th>
				<th>제품명</th>
				<th>가격</th>
				<th>종류구분</th>
				<th>수정/삭제</th>
			</tr>
			
			<c:forEach var="item" items="${items.content}">
			<tr style="border-bottom-width: 1px;">
				<td>${item.id}</td>
				<td>${item.name}</td>
				<td>${item.price}</td>
				<td>
					<c:if test="${item.kind == 0}">침실가구</c:if> 
					<c:if test="${item.kind == 1}">거실가구</c:if>
					<c:if test="${item.kind == 2}">테이블&의자</c:if>
				</td>
				<td style="width: 102px;">
					<div class="col-sm-offset-2 col-sm-10" style="width: 100px;">
						<a href="productUpdate/${item.id}" class="btn btn-warning" >수정/삭제</a>
					</div>
				</td>
			</tr>
			</c:forEach>			
		</table>
	</div>
	
		<ul class="pagination justify-content-center">
			<c:choose>
				<c:when test="${items.first}">
					<li class="page-item disabled"><a class="page-link"
						href="?page=${items.number-1}" style="color:#363636">Previous</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="?page=${items.number-1}" style="color:#363636">Previous</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${items.last}">
					<li class="page-item disabled"><a class="page-link"
						href="?page=${items.number+1}" style="color:#363636">Next</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="?page=${items.number+1}" style="color:#363636">Next</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
		 
		 	<div style="text-align:center">
		 		<a href="regiProd" class="btn btn-success btn-lg">등록</a>
		 	</div>
		 <br><br><hr>
 
</div>
<%@ include file="../headerfooter/footer.jsp"%>