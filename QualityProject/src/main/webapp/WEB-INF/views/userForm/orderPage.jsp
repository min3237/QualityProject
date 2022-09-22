<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../headerfooter/header.jsp"%>
<div class="container">

<%! int a = 0; %>
	<ul class="nav nav-fill">
		<li class="nav-item">
		<a class="nav-link" href="../cartPage" style="color: #363636"><b>장바구니</b></a>
		</li>
		<li class="nav-item">
		<a class="nav-link" href="../orderPage" style="color: #363636"><b>주문내역</b></a>
		</li>
		<li class="nav-item">
	    <a class="nav-link" href="../myPage" style="color:#363636"><b>회원정보수정</b></a>
	    </li>
	    <li class="nav-item">
	    <a class="nav-link" href="../paymentPage" style="color:#363636"><b>결제수단</b></a>
	    </li>
	 	<li class="nav-item">
	    <a class="nav-link" href="../queryPage" style="color:#363636"><b>1:1문의</b></a>
	    </li>
	</ul><hr><br><br>
	<h3 style="text-align: center">주문내역</h3><br>
	<% a = 0; %>
	<c:forEach var="order" items="${orders.content}">
		<c:if test="${order.user.id == principal.user.id}">
			<% a = 1; %>
		</c:if>
	</c:forEach>
	<c:choose>
			<c:when test="<%=a == 0%>">
				<br><br><br><br><br><br>
				<h5 style="text-align: center">주문내역이 없습니다.</h5>
				<p style="text-align: center">상품을 구매하여 주십시오</p>
				<br><br><br><br><br><br><br><br>
			</c:when>
	<c:otherwise>
	<div class="mb-3 row gara">
		<table>
			<tr style="border-bottom-width: 2px;">
				<th>주문번호</th>
				<th>제품명</th>
				<th>가격</th>
				<th>주문일자</th>
				<th>주문상태</th>
				<th></th>
			</tr>
	<c:forEach items="${orders.content}" var="order">
		<c:if test="${principal.user.id == order.user.id}">
			<tr style="border-bottom-width: 1px;">
				<td>${order.id}</td>
				<td>${order.orderTitle}</td>
				<td>${order.totalPrice}원</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${order.createDate}"/></td>
				<td><b>${order.status}</b></td>
				<td style="width: 100px;">
					<div class="col-sm-offset-2 col-sm-10" style="width: 100px;">
						<a href="orderDetail/${order.id}">
						<button class="btn btn-secondary" type="button">상세보기</button></a>
					</div>
				</td>
			</tr>
		</c:if>
	</c:forEach>
		</table>
	</div><br>
		<ul class="pagination justify-content-center">
			<c:choose>
				<c:when test="${orders.first}">
					<li class="page-item disabled"><a class="page-link" href="?page=${orders.number-1}" style="color: #363636">Previous</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="?page=${orders.number-1}" style="color: #363636">Previous</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${orders.last}">
					<li class="page-item disabled"><a class="page-link" href="?page=${orders.number+1}" style="color: #363636">Next</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="?page=${orders.number+1}" style="color: #363636">Next</a></li>
				</c:otherwise>
			</c:choose>
		</ul><br>
	</c:otherwise>
	</c:choose>
	
<hr></div>
<%@ include file="../headerfooter/footer.jsp"%>