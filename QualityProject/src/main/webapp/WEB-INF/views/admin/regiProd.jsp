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
</ul><hr><br><br><br>

	<div class="mb-3 row">
		<label for="image" class="col-sm-2 col-form-label">제품이미지</label>
		<div class="col-sm-5">
			<input type="file" class="form-control" id="image">
		</div>
	</div>

	<div class="mb-3 row">
		<label for="productName" class="col-sm-2 col-form-label">제품명</label>
		<div class="col-sm-5">
			<input type="text" class="form-control" id="productName">
		</div>
	</div>

	<div class="mb-3 row">
		<label for="productPrice" class="col-sm-2 col-form-label">가격</label>
		<div class="col-sm-5">
			<input type="text" class="form-control" id="productPrice">
		</div>
	</div>


	<div class="mb-3 row">
		<label for="productPrice" class="col-sm-2 col-form-label">상세내용</label>
		<div class="col-sm-5">
		<textarea class="form-control summernote" rows="5" id="content" cols="40" placeholder="dasdag^^ㅁㄴㅇㅎㄹ
		asd
		asd
		asd"></textarea>
		</div>
	</div>
	
	<div class="form-group row">
		<label class="col-sm-2">분류</label>
		<div class="col-sm-5">
			<input type="radio" name="kind" value="0">침실가구 
			<input type="radio" name="kind" value="1">거실가구 
			<input type="radio" name="kind" value="2">테이블&의자
		</div>
	</div>
 		<input type="button" class="btn btn-secondary registration" id="btn-save" value="등록" >
 		<input type="button" class="btn btn-secondary registration" value="뒤로가기" onclick="history.back()">
 		
</div>
<br><br><br><br>

<script type="text/javascript" src="/js/admin.js"></script>
<%@ include file="../headerfooter/footer.jsp"%>