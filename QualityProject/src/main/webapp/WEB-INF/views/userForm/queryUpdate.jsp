<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../headerfooter/header.jsp" %>
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

	<form>
		<input type="hidden" id="id" value="${QualityQuery.id}" />
		<div class="form-group">
			<label for="title">Update Title</label>
			<input value="${QualityQuery.title}" type="text" class="form-control" id="title"><br>
		</div>
		<div class="form-group">
			<label for="contetn">Update Content:</label>
			<textarea class="form-control summernote" rows="5" id="content">${QualityQuery.content}</textarea>
		</div>
	</form><br>
		<button id="btn-update" class= "btn btn-primary">수정</button>
		<button class="btn btn-secondary" type="button" onclick="history.back()">뒤로가기</button><br>
	
<hr></div>
<script type="text/javascript" src="/js/query.js"></script>
<%@ include file="../headerfooter/footer.jsp" %>