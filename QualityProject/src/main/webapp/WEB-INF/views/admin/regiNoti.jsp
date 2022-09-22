<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../headerfooter/header.jsp"%>
<div class="container">

<ul class="nav nav-fill">
	<li class="nav-item">
	<a class="nav-link" href="../orderCheck" style="color: red"><b>주문관리</b></a>
	</li>
	<li class="nav-item">
	<a class="nav-link" href="../regiProduct" style="color: red"><b>제품관리</b></a>
	</li>
	<li class="nav-item">
    <a class="nav-link" href="../queryReply" style="color:red"><b>문의답변</b></a>
  </li>
   <li class="nav-item">
    <a class="nav-link" href="../regiNotice" style="color:red"><b>공지/이벤트등록</b></a>
  </li>
</ul><hr><br><br>

	<div class="mb-3 row">
		<label for="image" class="col-sm-2 col-form-label">이미지</label>
		<div class="col-sm-5">
			<input type="file" class="form-control" id="image">
		</div>
	</div>

	<div class="mb-3 row">
		<label for="productName" class="col-sm-2 col-form-label">제목</label>
		<div class="col-sm-5">
			<input type="text" class="form-control" id="productName">
		</div>
	</div>
	<div class="mb-3 row">
		<label for="productPrice" class="col-sm-2 col-form-label">내용</label>
		<div class="col-sm-5">
			<textarea class="form-control summernote" rows="5" id="content" cols="40"></textarea>
		</div>
	</div>
	
	<div class="form-group row">
		<label class="col-sm-2">구분</label>
		<div class="col-sm-5">
		<form>
			<input type="radio" name="kind" value="0" checked>공지사항
			<input type="radio" name="kind" value="1">이벤트
		</form>
		</div>
	</div>
 		<input type="button" class="btn btn-primary registration" value="등록" id="btn-save">
 		<input type="button" class="btn btn-secondary registration" value="뒤로가기" onclick="history.back()">
 		
</div><hr>
<script type="text/javascript" src="/js/board.js"></script>
<%@ include file="../headerfooter/footer.jsp"%>