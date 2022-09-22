<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../headerfooter/header.jsp"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div class="container" >

	<br><br><h3 style="text-align:center">회원가입</h3><br>
	<div class="col-md-7 col-lg-7" style="margin:0 auto">
		<form class="needs-validation">
				<div class="col-9" style="margin:0 auto">
					<input type="text" class="form-control" id="userid" placeholder="ID"required>&emsp; <br>	
					<input type="password" class="form-control" id="pwd" placeholder="PASSWORD" required> <br>
					<input type="password" class="form-control" id="pwd_check" placeholder="PASSWORD CHECK"required> <br>
					<input type="text" class="form-control" id="username"placeholder="NAME" required> <br>
					<input type="email" class="form-control" id="email" placeholder="E-MAIL"> <br>
					<div class="input-group has-validation">
						<input type="text" class="form-control" id="sample6_postcode" placeholder="ZIP CODE" required>&emsp;
						<button class="btn btn-secondary" type="submit" onclick="sample6_execDaumPostcode()">주소찾기</button>
					</div>
					<input type="text" class="form-control" id="sample6_address" placeholder="ADDRESS" required>
					<div class="input-group has-validation">
						<input type="text" class="form-control" id="sample6_extraAddress" placeholder="ADDRESS">
						<input type="text" class="form-control" id="sample6_detailAddress" placeholder="DETAIL ADDRESS" required ><br>
					</div><br>
					<input type="text" class="form-control" id="phone" placeholder="PHONE NUMBER"><br>
				</div>
		</form>	
					<div style="text-align:center">
					<button id="btn-save" class="btn btn-secondary" type="button">회원가입완료</button>
					<button class="btn btn-secondary" type="reset" onclick="history.back()">뒤로가기</button>
					</div>
	</div><br><br><hr>
	
</div>
<script type="text/javascript" src="/js/user.js"></script>
<%@ include file="../headerfooter/footer.jsp"%>