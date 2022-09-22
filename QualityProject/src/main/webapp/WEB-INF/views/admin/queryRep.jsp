<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../headerfooter/header.jsp"%>
<div class="container">

<br><br>
	<div class="mb-3 row gara">
		<div style="font-size:20px">
			<b>번호</b> : ${query.id}<br>
			<b>작성자</b> : ${query.user.name}<br>
			<b>제목</b> : ${query.title}<br>
			<b>내용</b> : ${query.content}
		</div>
	</div>
	
	<div class="mb-3 row" style="font-size:20px">
		<c:choose>
			<c:when test="${principal.user.roles=='ADMIN' && query.answerC == 0}">
				<label for=""><span style="color:blue; font-weight:bold">답변내용</span></label>
				<div class="col-sm-10">
				<input type="hidden" value="${query.id}" id="id">
				<textarea class="form-control summernote" rows="5" id="answer" cols="40">${query.answer}</textarea>
				</div>
			</c:when>
			<c:otherwise>
				<span style="color:blue; font-weight:bold">답변내용</span>
				
				<div class="col-sm-10">
				<br>
				${query.answer}
				</div>
			</c:otherwise>
		</c:choose>
	</div><br>
	
	<c:if test="${principal.user.roles=='ADMIN' && query.answerC == 0}">
 		<input type="button" class="btn btn-primary" id="btn-answer" value="답변" >
 	</c:if>
 		<input type="button" class="btn btn-secondary" value="뒤로가기" onclick="history.back()"><br><br><hr>

</div>
<script type="text/javascript" src="/js/query.js"></script>
<%@ include file="../headerfooter/footer.jsp"%>