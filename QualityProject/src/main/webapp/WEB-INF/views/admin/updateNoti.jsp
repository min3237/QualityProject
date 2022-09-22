<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../headerfooter/header.jsp"%>
<div class="container">
<br><br>
	<input type="hidden" id="id" value="${board.id}">
	<div class="mb-3 row">
		<label for="image2" class="col-sm-2 col-form-label">기존 이미지 주소</label>
		<div class="col-sm-5">
			<input type="text" class="form-control" id="image2" value="${board.img}" readonly>
		</div>
	</div>
	
	<div class="mb-3 row">
		<label for="image1" class="col-sm-2 col-form-label">변경할 이미지 주소</label>
		<div class="col-sm-5">
			<input type="file" class="form-control" id="image1">
		</div>
	</div>

	<div class="mb-3 row">
		<label for="productName" class="col-sm-2 col-form-label">제목</label>
		<div class="col-sm-5">
			<input type="text" class="form-control" id="productName" value="${board.title}">
		</div>
	</div>

	<div class="mb-3 row">
		<label for="productPrice" class="col-sm-2 col-form-label">내용</label>
		<div class="col-sm-5">
		<textarea class="form-control summernote" rows="5" id="content" cols="40">${board.content}</textarea>
		</div>
	</div>
	
	<div class="form-group row">
		<label class="col-sm-2">구분</label>
		<div class="col-sm-5">
			<c:if test="${board.kind==0}">
			<input type="radio" name="kind" value="0" checked>공지사항
			<input type="radio" name="kind" value="1">이벤트
			</c:if>
			<c:if test="${board.kind==1}">
			<input type="radio" name="kind" value="0">공지사항
			<input type="radio" name="kind" value="1" checked>이벤트
			</c:if>
		</div>
	</div>
	
	<input type="button" class="btn btn-primary registration" value="수정" id="btn-update">
	<input type="button" class="btn btn-danger registration" value="삭제" id="btn-delete">
	<input type="button" class="btn btn-secondary registration" value="뒤로가기" onclick="history.back()">
 		
</div><hr>
<script type="text/javascript" src="/js/board.js"></script>
<%@ include file="../headerfooter/footer.jsp"%>