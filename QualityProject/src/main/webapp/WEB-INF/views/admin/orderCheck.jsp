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
</ul><hr>

<br><br><h3 style="text-align:center">주문 관리페이지</h3><br>
	
	<div class="mb-3 row gara">
		<table>
			<tr style="border-bottom-width: 2px;">
				<th>번호</th>
				<th>주문자</th>
				<th>제품명</th>
				<th>구매금액</th>
				<th>구매일자</th>
				<th>주문상태</th>
				<th></th>
			</tr>

			<c:forEach items="${orders.content}" var="order">
			<tr style="border-bottom-width: 1px;">
				<td>${order.id}</td>
				<td>${order.user.username}</td>
				<td>${order.orderTitle}</td>
				<td>${order.totalPrice}원</td>				
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${order.createDate}"/></td>
				<td><b>${order.status}</b></td>
				<td style="width: 100px;">
					<div class="col-sm-offset-2 col-sm-10" style="width: 100px;">
						<a href="adminOrderDetail/${order.id}"><button class="btn btn-secondary" type="button">상세보기</button></a>
					</div>
				</td>
			</tr>
			</c:forEach>
		</table>
	</div><br><br>
	
		<ul class="pagination justify-content-center">
		<c:choose>
			<c:when test="${orders.first}">
				<li class="page-item disabled"><a class="page-link"
					href="?page=${orders.number-1}" style="color:#363636">Previous</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="?page=${orders.number-1}" style="color:#363636">Previous</a></li>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${orders.last}">
				<li class="page-item disabled"><a class="page-link"
					href="?page=${orders.number+1}" style="color:#363636">Next</a></li>
			</c:when>
			<c:otherwise>
				<li class="page-item"><a class="page-link"
					href="?page=${orders.number+1}" style="color:#363636">Next</a></li>
			</c:otherwise>
		</c:choose>
		</ul><br><br><hr>
</div>
<%@ include file="../headerfooter/footer.jsp"%>