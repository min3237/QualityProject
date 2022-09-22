<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sun.xml.txw2.Document"%>
<%@ page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ include file="../headerfooter/header.jsp"%>
<br><br><br><br>
<div class="container" style="text-align:center">

	<h3>아이디 찾기</h3><br>
	<div class="col-5" style="margin:0 auto">
		<form>
			<div class="form-floating">
				<input type="text" class="form-control" id="name" name="name"> <label for="name">이름</label>
			</div><br>
			<div class="form-floating">
				<input type="text" class="form-control" id="email" name="email"> <label for="email">이메일</label>
			</div><br>
			<div class="form-floating">
				<input type="text" class="form-control" id="phone" name="phone"> <label for="phone">전화번호</label>
			</div><br>
		</form>
		<p style="text-align:center"><a href="/auth/pwdSearch">비밀번호가 기억나지 않습니다</a></p>
		<button id="btn-idSearch" class="btn btn-secondary" type="button">아이디 찾기</button>
		<a href="/auth/joinForm"><button class="btn btn-secondary" type="button">회원가입</button></a>
		<button class="btn btn-secondary" type="reset" onclick="history.back()">뒤로가기</button>
	</div><br><br><br><br><br><br><br><hr>
	
</div>
<script type="text/javascript" src="/js/user.js"></script>
<%@ include file="../headerfooter/footer.jsp"%>