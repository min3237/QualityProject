<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../headerfooter/header.jsp"%>
<br>
<div class="container" style="text-align:center">

	<h3>로그인</h3><br>
	<div class="col-5" style="margin:0 auto">
		<form action="/auth/loginProc" method="post">
			<div class="form-floating">
				<input type="text" class="form-control" id="username" name="username" value="${user.username}" placeholder="a"> <label for="username">ID</label>
			</div><br>
			
			<div class="form-floating">
				<input type="password" class="form-control" id="password" name="password" placeholder="a"> <label for="password">PASSWORD</label>
			</div><br>
			
			<div style="text-align:center">
				<button id="btn-login" class="btn btn-secondary" type="submit">로그인</button>
				<a href="/auth/joinForm"><button class="btn btn-secondary" type="button">회원가입</button></a>
				<button class="btn btn-secondary" type="reset" onclick="history.back()">뒤로가기</button>
				<p><br><br><a href="/auth/idSearch">아이디가 기억나지 않습니다</a></p>
				<p><a href="/auth/pwdSearch">비밀번호가 기억나지 않습니다</a></p>
			</div>
		</form>
	</div><br><hr>
	
</div>
<%@ include file="../headerfooter/footer.jsp"%>