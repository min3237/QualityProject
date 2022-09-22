<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../headerfooter/header.jsp"%>
<div class="container"><br><br>
<%! int a=0; %>
<% a=0; %>
	<c:forEach items="${cartItems}" var="cartItem">
		<c:if test="${cartItem.item.id == item.id}">
		<% a += 1; %>
		</c:if>
	</c:forEach>
	<div class="row mb-6">
		<div class="col-md-12">
			<div class="row g-0 flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				<div class="col-auto d-none d-lg-block">
					<svg class="bd-placeholder-img" width="700px" height="500px" style="margin-left:30px"><image href="../${item.img}" width="100%" height="100%" /></svg>
				</div>
				<div class="col p-4 d-flex flex-column position-static">
					<div class="card-body"><br>
						<h4 class="card-text">제품명 : ${item.name}</h4><br>
						<p class="card-text">가격 : &#92;${item.price}</p>
														${item.account}
						<div class="d-flex justify-content-between align-items-center">
						</div><br><br><br><br><hr>
						<input id="name" value="${item.name}" type="hidden">
						<input type="hidden" id="id" value="${item.id}">
						<c:choose>
							<c:when test="<%= a == 0 %>">
								<button type="button" class="btn btn-sm btn-outline-success" id="btn-save">장바구니</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-sm btn-warning" id="cartmove">이미 담긴 상품</button>
							</c:otherwise>
						</c:choose>
						<button type="button" class="btn btn-sm btn-outline-secondary" onclick="history.back()">제품 리스트</button>
					</div>
				</div>
			</div>
		</div>
	</div><br><br><hr>
</div>
<script type="text/javascript" src="/js/cart.js"></script>
<%@ include file="../headerfooter/footer.jsp"%>