<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../headerfooter/header.jsp"%>
<div class="container">
<%! int a = 0; %>

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
	</ul><hr>

	<br><br><h3 style="text-align:center">1:1문의하기</h3><br>
	<% a = 0; %>
	<c:forEach var="query" items="${querys.content}">
		<c:if test="${query.user.id == principal.user.id}">
			<% a = 1;%>
		</c:if>
	</c:forEach>
	<c:choose>
		<c:when test="<%= a == 0 %>">
		<br><br><br><br><br><br><h5 style="text-align:center">문의하신 내역이 없습니다.</h5>
		<p style="text-align:center">궁금한 사항을 문의해주세요</p><br><br><br><br><br><br>
		<a href="querySave"><button type="button" class="btn btn-secondary" style="margin-left:47%">문의하기</button></a><br><br><br>
		</c:when>
		<c:otherwise>
		<div class="mb-3 row gara">
			<table style="text-align:center">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일자</th>
						<th></th>
					</tr>
				<c:forEach var="query" items="${querys.content}">
					<c:if test="${query.user.id == principal.user.id}">
					<tr style="border-bottom:1px solid lightgrey">
						<td style="width:20%">${query.id}</td>
						<td style="width:20%">${query.title}</td>
						<td style="width:20%">
						<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${query.createDate}"/>	
						</td>
							<td style="width: 20%">
								<div class="col-sm-offset-2 col-sm-10">
									<c:if test="${query.answerC == 0}">
										<a href="queryUpdate/${query.id}"><input type="button" class="btn btn-warning btn-sm" value="수정/상세보기" style="width: 120px"></a>
									</c:if>
									<c:if test="${query.answerC == 1}">
										<a href="queryRep/${query.id}"><input type="button" class="btn btn-secondary btn-sm" value="답변완료" style="width: 120px"></a>
									</c:if>
								</div>
							</td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</div><br>
			<ul class="pagination justify-content-center">
				<c:choose>
					<c:when test="${querys.first}">
						<li class="page-item disabled"><a class="page-link" href="?page=${querys.number-1}" style="color:#363636">Previous</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="?page=${querys.number-1}" style="color:#363636">Previous</a></li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${querys.last}">
						<li class="page-item disabled"><a class="page-link" href="?page=${querys.number+1}" style="color:#363636">Next</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="?page=${querys.number+1}" style="color:#363636">Next</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
				<div style="text-align:center"><a href="querySave"><button type="button" class="btn btn-secondary">추가문의하기</button></a></div><br><br>
		</c:otherwise>
	</c:choose>	

<hr></div>
<%@ include file="../headerfooter/footer.jsp"%>