<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../headerfooter/header.jsp"%>
<div class="container"  style="text-align:center">

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
</ul><hr>
	
	<br><br><h3 style="text-align:center">주문상세내역</h3><br>

	<div class="mb-3 row gara">
		<table style="text-align:center">
			<tr style="border-bottom-width: 2px;">
				<th>제품명</th>
				<th>가격</th>
				<th>수량</th>
				<th>합계</th>
			</tr>
			
			<c:forEach items="${orders}" var="order">
			<tr style="border-bottom-width: 1px; ">
				<td style="height:45px">${order.itemNames}</td>
				<td>${order.prices}원</td>
				<td>${order.quantitys}</td>
				<td>${order.prices * order.quantitys}원</td>
			</tr>
			</c:forEach>
		</table>
	</div>
			<p style="text-align:right; font-weight:bold">합계금액 : ${orders.get(0).totalPrice} 원</p>
			<p style="text-align:right">결제수단 : ${orders.get(0).payment}</p>
			<p style="text-align:right">배송지 : ${orders.get(0).address}</p>
			<a href="../queryPage"><p style="text-align:right; color:red; font-size:13px">※ 주문취소는 1:1문의를 통해 접수바랍니다</p></a>
			
			<button class="btn btn-secondary" onclick="history.back()" >돌아가기</button>
			
			<hr>
</div>
<%@ include file="../headerfooter/footer.jsp"%>