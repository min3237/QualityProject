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
    <a class="nav-link" href="../queryReply" style="color:red"><b>문의답변</b></a>
  </li>
   <li class="nav-item">
    <a class="nav-link" href="../regiNotice" style="color:red"><b>공지/이벤트등록</b></a>
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
				<td>${order.prices * order.quantitys}원
				</td>
				
			</tr>
			</c:forEach>
		</table>
	</div>
	
	<p style="text-align:right; font-weight:bold">합계금액 : ${orders.get(0).totalPrice} 원</p>
	<p style="text-align:right; font-weight:bold">현재상태 : ${orders.get(0).status}</p>
	<p style="text-align:right">결제수단 : ${orders.get(0).payment}</p>
	<p style="text-align:right">배송지 : ${orders.get(0).address}</p>
	
	<div style="text-align:center">
	<input type="hidden" id="id" value="${orders.get(0).id}">
		<button id="btn-update1" class="btn btn-warning" type="button" value="배송중">배송중</button>
		<button id="btn-update2" class="btn btn-danger" type="button" value="주문취소">주문취소</button>
		<button id="btn-update3" class="btn btn-primary" type="button" value="배송완료">배송완료</button>
		<button class="btn btn-secondary" type="button" onclick="history.back()">뒤로가기</button>
	</div>
	<hr>
</div>
<script type="text/javascript" src="/js/order.js"></script>
<%@ include file="../headerfooter/footer.jsp"%>