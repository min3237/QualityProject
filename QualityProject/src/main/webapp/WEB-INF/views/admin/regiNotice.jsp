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

	<h3 style="text-align: center">공지사항/이벤트 관리페이지</h3>
	<br>

	<div class="mb-3 row gara">
		<table>
			<tr style="border-bottom-width: 2px;">
				<th>번호</th>
				<th>제목</th>
				<th>공지사항/이벤트</th>
				<th></th>
			</tr>
			
		<c:forEach items="${boards.content}" var="board">
			<tr style="border-bottom:1px solid lightgrey">
				<td>${board.id}</td>
				<td>${board.title}</td>
					<td>
						<c:if test="${board.kind == 0}">공지사항</c:if> 
						<c:if test="${board.kind == 1}">이벤트</c:if>
					</td>
				<td style="width:100px">
					<div class="col-sm-offset-2 col-sm-10">
					<a href="updateNoti/${board.id}"><input type="submit" class="btn btn-warning btn-sm" value="수정/삭제" style="width:100px"></a>
					</div>
				</td>
			</tr>
		</c:forEach>
		</table>
	</div>
	
		<ul class="pagination justify-content-center">
			<c:choose>
				<c:when test="${boards.first}">
					<li class="page-item disabled"><a class="page-link"
						href="?page=${boards.number-1}" style="color:#363636">Previous</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="?page=${boards.number-1}" style="color:#363636">Previous</a></li>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${boards.last}">
					<li class="page-item disabled"><a class="page-link"
						href="?page=${boards.number+1}" style="color:#363636">Next</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="?page=${boards.number+1}" style="color:#363636">Next</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	
	 	<div style="text-align:center">
	 		<a href="regiNoti"><input type="submit" class="btn btn-success btn-lg" value="등록" ></a>
	 	</div>
	 	<br><br><hr>
 
 </div>
<%@ include file="../headerfooter/footer.jsp"%>