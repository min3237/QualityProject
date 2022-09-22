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

	<h3 style="text-align: center">결제수단</h3><br>
	
	<% a = 0; %>
	<c:forEach var="payment" items="${payments}">
		<c:if test="${payment.user.id == principal.user.id}">
			<% a = 1;%>
		</c:if>
	</c:forEach>
	
	<c:choose>
		<c:when test="<%= a == 0 %>">
			<br><br><br><br><br><br><h5 style="text-align:center">등록된 결제수단이 없습니다.</h5>
			<p style="text-align:center">결제수단을 등록해주세요</p><br><br>
			<a href="paymentSave"><button type="button" class="btn btn-secondary" style="margin-left:45%">결제수단등록</button></a><br><br>
		</c:when>
	<c:otherwise>

	<div class="container marketing">
		<div class="row">
		<c:forEach var="payment" items="${payments}">
			<c:if test="${payment.user.id == principal.user.id}">
		     <div class="col-lg-4">
		     <c:choose>
		     <c:when test="${payment.bank =='국민은행'}">
			  	<div class="list-group-item py-3" style="border:2px solid grey; border-radius:20px; text-align:left; background-color: yellow">
			 </c:when>
		     <c:when test="${payment.bank =='신한은행'}">
			  	<div class="list-group-item py-3" style="border:2px solid grey; border-radius:20px; text-align:left; background-color: darkgrey">
			 </c:when>
		     <c:when test="${payment.bank =='기업은행'}">
			  	<div class="list-group-item py-3" style="border:2px solid grey; border-radius:20px; text-align:left; background-color: white">
			 </c:when>
		     <c:when test="${payment.bank =='우리은행'}">
			  	<div class="list-group-item py-3" style="border:2px solid grey; border-radius:20px; text-align:left; color:white; background-color: lightblue">
			 </c:when>
		     <c:when test="${payment.bank =='하나은행'}">
			  	<div class="list-group-item py-3" style="border:2px solid grey; border-radius:20px; text-align:left; background-color: lightgreen">
			 </c:when>
			 <c:otherwise>
			 	<div class="list-group-item py-3" style="border:2px solid grey; border-radius:20px; text-align:left; color:yellow; background-color: green">
			 </c:otherwise>
			  </c:choose>
			  	
			    <h3>${payment.name}</h3>
			    <p>${payment.bank}</p>
			    <h3>${payment.cardNum}</h3><br>
			    <p><a href="paymentUpdate/${payment.id}"><button class="btn btn-warning" type="button" value="수정/삭제" style="float:right">수정/삭제</button></a></p><br>
			  </div><br>
			  </div>
			</c:if>
		</c:forEach>
	</div><br>
		
			<div style="text-align:center"><a href="paymentSave"><button type="button" class="btn btn-secondary">결제수단 추가등록</button></a></div><br><br>
</div>	
	</c:otherwise>
	</c:choose>
	
<hr>
<%@ include file="../headerfooter/footer.jsp"%>