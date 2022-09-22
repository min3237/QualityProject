<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../headerfooter/header.jsp"%>
<div class="container">
<br><br>
	<input type="hidden" value="${item.id}" id="id">
	<div class="mb-3 row">
		<label for="image" class="col-sm-2 col-form-label">주문자</label>
		<div class="col-sm-5">
			<input type="text" class="form-control" id="image" value="${item.img}">
		</div>
	</div>

	<div class="mb-3 row">
		<label for="productName" class="col-sm-2 col-form-label">제품명</label>
		<div class="col-sm-5">
			<input type="text" class="form-control" id="productName" value="${item.name}">
		</div>
	</div>

	<div class="mb-3 row">
		<label for="productPrice" class="col-sm-2 col-form-label">구매금액</label>
		<div class="col-sm-5">
			<input type="text" class="form-control" id="productPrice" value="${item.price}">
		</div>
	</div>
	
 		<input type="button" class="btn btn-primary registration" value="수정" id="btn-update">
 		<input type="button" class="btn btn-danger registration" value="삭제" id="btn-delete">
 		<input type="button" class="btn btn-secondary registration" value="뒤로가기" onclick="history.back()">
</div>
<br><br><br><br>

<script type="text/javascript" src="/js/admin.js"></script>
<%@ include file="../headerfooter/footer.jsp"%>