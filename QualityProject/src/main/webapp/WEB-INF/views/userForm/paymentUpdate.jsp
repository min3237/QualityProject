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
	</ul><hr>

	<br><br><h3 style="text-align:center">결제수단 수정</h3><br>
	<div class="col-md-7 col-lg-7" style="margin: 0 auto">
		<form class="needs-validation">
			<div class="col-9" style="margin: 0 auto">
				<input type="hidden" value="${payment.id}" id="id">
				<input type="text" class="form-control" id="paymentname" value="${payment.name}"><br>
					<div class="input-group has-validation">
				      <select id="bank">
				             <option value="국민은행">국민은행</option>
				             <option value="신한은행">신한은행</option>
				             <option value="기업은행">기업은행</option>
				             <option value="우리은행">우리은행</option>
				             <option value="하나은행">하나은행</option>
				             <option value="농협은행">농협은행</option>
				      </select>&emsp;
						<input type="number" class="form-control" id="card-number1" value="${cardNum[0]}">&emsp;-&emsp;
						<input type="number" class="form-control" id="card-number2" value="${cardNum[1]}">&emsp;-&emsp;
						<input type="number" class="form-control" id="card-number3" value="${cardNum[2]}">&emsp;-&emsp;
						<input type="number" class="form-control" id="card-number4" value="${cardNum[3]}"><br>
					</div><br>	
					<button id="btn-update" class="btn btn-primary" type="button" style="margin-left: 180px">수정</button>
					<button id="btn-delete" class="btn btn-danger" type="button">삭제</button>
					<button class="btn btn-secondary" type="reset" onclick="history.back()">뒤로가기</button>
			</div>
		</form>
	</div><br><br><hr>	

</div>
<script type="text/javascript" src="/js/payment.js"></script>
<%@ include file="../headerfooter/footer.jsp"%>