<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../headerfooter/header.jsp"%>
<div class="container">
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

	<h3 style="text-align: center">장바구니</h3>
	<br>
	<c:choose>
		<c:when test="${cartItems.isEmpty()}">
			<br><br><br><h5 style="text-align:center">장바구니에 상품이 없습니다.</h5>
			<p style="text-align:center">상품을 담아주세요</p><br><br>
			<div  style="text-align:center">
				<a href="productList/0"><button type="button" class="btn btn-secondary">상품 페이지</button></a>
			</div>
			<br><br>
		</c:when>
	<c:otherwise>
		<form name="orderform" id="orderform" method="post" class="orderform" action="/Page" onsubmit="return false;">
			<input type="hidden" name="cmd" value="order">
			<div class="basketdiv" id="basket">
				<div class="row head">
					<div class="subdiv">
						<div class="check">
						<input type='checkbox' onclick="basket.checkAll()" id="th_checkAll"/>
						</div>
						<div class="pname">상품명</div>
					</div>
					<div class="subdiv">
						<div class="basketprice">가격</div>
						<div class="num">수량</div>
						<div class="sum" style="font-weight:bold">합계</div>
					</div>
					<div class="split"></div>
				</div>
				<c:forEach var="qualityCartItems" items="${cartItems}">
						<div class="row data">
							<div class="subdiv"> 
								<div class="check">
									<input type="checkbox" name="buy" value="${qualityCartItems.id}" onclick="basket.checkItem();">&nbsp;
								</div>
								<div class="pname">
									<a href="productDetail/${qualityCartItems.item.id}"><span>${qualityCartItems.item.name}</span></a>
								</div>
							</div>
							<div class="subdiv">
								<div class="basketprice">
									<input type="hidden" name="p_price" id="p_price${qualityCartItems.id}" class="p_price" value="${qualityCartItems.item.price}">${qualityCartItems.item.price}원
								</div>
								<div class="num">
									<div class="updown">
										<input type="text" name="p_num${qualityCartItems.id}" id="p_num${qualityCartItems.id}" size="2" maxlength="4" class="p_num" value="1" onkeyup="javascript:basket.changePNum(${qualityCartItems.id});"  oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');">
									</div>
								</div>
								<div class="sum" style="font-weight:bold">${qualityCartItems.item.price}원</div>
							</div>
						</div>
					
				</c:forEach>
			</div>
	
			<div class="right-align basketrowcmd">
				<a href="javascript:void(0)" class="btn btn-warning btn-sm" id="btn-deleteById">선택상품삭제</a> 
				<a href="javascript:void(0)" class="btn btn-danger btn-sm" id="btn-deleteAll">장바구니비우기</a>
			</div><br>
			
			<div class="bigtext right-align sumcount" id="sum_p_num">상품수량: -개</div>
			<div class="bigtext right-align box blue summoney" id="sum_p_price" style="color:#0075ff">합계금액: -원</div>
			<p style="float:right; font-weight:bold">결제수단 :
			<c:choose>
				<c:when test="${payments.isEmpty()}">
				 미등록
				</c:when>
					<c:otherwise>
					<select id="payment">
				        <c:forEach var="payment" items="${payments}">
							<c:if test="${payment.user.id == principal.user.id}">
					             <option value="${payment.bank} ${payment.cardNum}">${payment.name}</option>
				            </c:if>
					    </c:forEach>
		         	</select>
					</c:otherwise>
			</c:choose></p>
			<div id="goorder">
				<div class="buttongroup center-align cmd" style="text-align: center">
					<button type="button" class="btn btn-primary" id="btn-purchase">구매하기</button>
					<a href="productList/0"><button type="button" class="btn btn-secondary">상품 페이지</button></a>
				</div>
			</div>
		</form>
	  </c:otherwise>
	</c:choose>
	
<hr></div>
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript" src="/js/order.js"></script>
<%@ include file="../headerfooter/footer.jsp"%>