<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../headerfooter/header.jsp"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

	<h3 style="text-align: center">회원정보수정</h3><br>
	
	<div class="col-md-7 col-lg-7" style="margin: 0 auto">
		<form class="needs-validation">
			<div class="col-9" style="margin: 0 auto">
				<input type="hidden" value="${principal.user.id}" id="id">
				<input type="text" class="form-control" id="username" value="${principal.user.name}" readonly><br>
				<input type="text" class="form-control" id="userid" value="${principal.user.username}" readonly><br>
				<input type="password" class="form-control" id="pwd" placeholder="Change password"><br>
				<input type="password" class="form-control" id="pwd_check" placeholder="Password check"><br>
				<input type="email" class="form-control" id="email" placeholder="E-MAIL" value="${principal.user.email}"><br>
			<div class="input-group has-validation">
				<input type="text" class="form-control" id="sample6_postcode" placeholder="ZIP CODE">&emsp;
				<button class="btn btn-secondary" type="submit" onclick="sample6_execDaumPostcode()">주소찾기</button>
			</div>
				<input type="text" class="form-control" id="sample6_address" placeholder="ADDRESS" required value="${principal.user.address}">
			<div class="input-group has-validation">
				<input type="text" class="form-control" id="sample6_extraAddress" placeholder="ADDRESS">
				<input type="text" class="form-control" id="sample6_detailAddress" placeholder="DETAIL ADDRESS"><br>
			</div><br>
				<input type="text" class="form-control" id="phone" placeholder="PHONE NUMBER" value="${principal.user.phone}"><br>
			<div style="text-align:center">
				<button id="btn-update" class="btn btn-secondary" type="button">회원수정완료</button>
				<button id="btn-delete" class="btn btn-secondary" type="button">회원탈퇴</button>
				<button class="btn btn-secondary" type="reset" onclick="history.back()">뒤로가기</button>
			</div>
			</div>
		</form>
	</div><br><hr>
	
</div>
<script type="text/javascript" src="/js/user.js"></script>
<%@ include file="../headerfooter/footer.jsp"%>