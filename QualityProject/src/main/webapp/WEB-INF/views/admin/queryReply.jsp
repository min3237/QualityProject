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
    <a class="nav-link" href="../queryReply" style="color:red"><b>문의답변관리</b></a>
  </li>
   <li class="nav-item">
    <a class="nav-link" href="../regiNotice" style="color:red"><b>공지/이벤트관리</b></a>
  </li>
</ul><hr><br><br>

	<h3 style="text-align: center">문의답변 페이지</h3><br>

	<div class="mb-3 row gara">
		<table>
			<tr style="border-bottom-width: 2px;">
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
				<th></th>
			</tr>
			
			<c:forEach var="query" items="${querys.content}">
			<tr style="border-bottom:1px solid lightgrey">
				<td>${query.id}</td>
				<td>${query.user.name}</td>
				<td>${query.title}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${query.createDate}"/></td>
				<td style="width:100px">
					<div class="col-sm-offset-2 col-sm-10">
						<c:if test="${query.answerC == 0}">
						  <a href="queryRep/${query.id}"><input type="button" class="btn btn-warning btn-sm" value="답변" style="width:100px"></a>
						</c:if>
						<c:if test="${query.answerC == 1}">
						 <a href="queryRep/${query.id}"><input type="button" class="btn btn-secondary btn-sm" value="답변완료" style="width:100px"></a>
						</c:if> 
					</div>
				</td>
			</tr>
			</c:forEach>
		</table>
	</div><br><br>
	
		<ul class="pagination justify-content-center">
			<c:choose>
				<c:when test="${querys.first}">
					<li class="page-item disabled"><a class="page-link"
						href="?page=${querys.number-1}" style="color:#363636">Previous</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="?page=${querys.number-1}" style="color:#363636">Previous</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${querys.last}">
					<li class="page-item disabled"><a class="page-link"
						href="?page=${querys.number+1}" style="color:#363636">Next</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="?page=${querys.number+1}" style="color:#363636">Next</a></li>
				</c:otherwise>
			</c:choose>
		</ul><br><br><hr>
	
</div>
<%@ include file="../headerfooter/footer.jsp"%>