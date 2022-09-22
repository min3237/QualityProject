<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>프로젝트테스트</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/style.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>

</head>
<body>
	<c:if test="${!empty principal && principal.user.roles!='ADMIN'}">
	<div id="open" onclick="showDetail()">
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-fill" viewBox="0 0 16 16">
 			<path d="M8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6-.097 1.016-.417 2.13-.771 2.966-.079.186.074.394.273.362 2.256-.37 3.597-.938 4.18-1.234A9.06 9.06 0 0 0 8 15z" />
		</svg>
	</div>
	<div id="desc" class="chat-container shadow-lg">
		<div class="chat-header">
			<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-chat-left" viewBox="0 0 16 16">
 			   <path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" />
		    </svg>
			<span class="bi chat-title">QULITY 채팅</span>
			<button type="button" class="btn-close" onclick="hideDetail()" ></button>
		</div>
		<div class="chat-body">
			<br><div class="chat-bubble">
				<span class="chat-message">간단한 키워드로 챗봇에게 질문해주세요.(예: 배송조회, 영업시간 등)</span>
			</div>
			<div class="chat-bubble">
				<span class="chat-message">고객지원 도우미 챗봇 콜리😃입니다. 무엇을 도와드릴까요?</span>
			</div>
			<div class="chat-bubble">
				<span class="chat-message">현재 서비스 준비중입니다.<br> 빠른 시일내에 서비스하도록 하겠습니다.<br>- Quality -</span>
			</div>
		</div>
		<div class="chat-footer">
			<nav class="navbar navbar-light bg-light">
				<form id="chat-form" class="container-fluid">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="여기에 메세지를 입력하세요." aria-label="Username" aria-describedby="basic-addon1">
						<button id="btn-send" type="button" class="btn btn-outline-secondary">전송</button>
					</div>
				</form>
			</nav>
		</div>
	</div>
	</c:if>

	<div class="container"><br>
	  <header class="blog-header py-1">
	    <div class="row flex-nowrap justify-content-between align-items-center">
	      <div class="col-4 pt-1">
	        <a href="/"><img src="../../image/Main-logo.png"></a>
	      </div>
			<c:choose>
				<c:when test="${empty principal}">
					<div class="col-5 d-flex justify-content-end align-items-center">
						<a class="btn btn-sm btn-outline-secondary" href="/auth/loginForm">로그인</a>&emsp;
						<a class="btn btn-sm btn-outline-secondary" href="/auth/joinForm">회원가입</a>
					</div>
				</c:when>
				<c:otherwise>
					<c:if test="${principal.user.roles=='ADMIN'}">
						<div class="col-5 d-flex justify-content-end align-items-center">
							<b>${principal.user.name}</b>님,(${principal.user.username})&emsp;
							<a class="btn btn-sm btn-outline-danger" href="../orderCheck">관리자페이지</a>&emsp;
							<a class="btn btn-sm btn-outline-secondary" href="../cartPage">마이페이지</a>&emsp;
							<a class="btn btn-sm btn-outline-secondary" href="../logout">로그아웃</a>
						</div>
					</c:if>
					<c:if test="${principal.user.roles!='ADMIN'}">
						<div class="col-5 d-flex justify-content-end align-items-center">
							<b>${principal.user.name}</b>님,(${principal.user.username})&emsp;
							<a class="btn btn-sm btn-outline-secondary" href="../cartPage">마이페이지</a>&emsp;
							<a class="btn btn-sm btn-outline-secondary" href="../logout">로그아웃</a>
						</div>
					</c:if>
				</c:otherwise>
			</c:choose>
		</div>
	  </header>
		<br>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="../auth/company"><b>회사소개</b></a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarNav">
		      <ul class="navbar-nav">
		        <li class="nav-item" style="margin-left:20px">
		          <a class="nav-link active" href="../auth/notice"><b>공지사항</b></a>
		        </li>
		        <li class="nav-item" style="margin-left:20px">
		          <a class="nav-link active" href="../auth/event"><b>이벤트</b></a>
		        </li>
		      </ul>
		    </div>
		  </div>
		</nav>
	</div>
<br>