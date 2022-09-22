<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../headerfooter/header.jsp"%>
<br><br><br><br>

<div class="container" style="text-align:center">
	<h3>비밀번호 찾기</h3><br>
	<div class="col-5" style="margin:0 auto">
		<form>
			<div class="form-floating">
				<input type="text" class="form-control" id="username" name="username"> <label for="username">아이디</label>
			</div><br>
			<div class="form-floating">
				<input type="text" class="form-control" id="name" name="name"> <label for="name">이름</label>
			</div><br>
			<div class="form-floating">
				<input type="text" class="form-control" id="email" name="email"> <label for="email">이메일</label>
			</div><br>
			<div class="form-floating">
				<input type="text" class="form-control" id="phone" name="phone"> <label for="phone">전화번호</label>
			</div><br>
			<div class="form-floating">
				<input type="password" class="form-control" id="pwd"  required> <label for="pwd">변경할 비밀번호</label>
			</div><br>
			<div class="form-floating">
				<input type="password" class="form-control" id="pwd_check"required> <label for="pwd_check">변경할 비밀번호 확인</label>
			</div><br>
		</form>
		
		<p style="text-align:center"><a href="/auth/idSearch">아이디가 기억나지 않습니다</a></p>
		
		<button id="btn-pwdSearch" class="btn btn-secondary" type="button">비밀번호 변경</button>
		<a href="/auth/joinForm"><button class="btn btn-secondary" type="button">회원가입</button></a>
		<button class="btn btn-secondary" type="reset" onclick="history.back()">뒤로가기</button>
	</div><br><br><br><br><br><br><br><hr>

</div>
<script type="text/javascript" src="/js/user.js"></script>
<%@ include file="../headerfooter/footer.jsp"%>