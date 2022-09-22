<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../headerfooter/header.jsp"%>

    <div class="row py-lg-3">
      <div class="col-lg-6 col-md-8 mx-auto">
	      <c:if test="${id == 0}">
	    	  <img src="../image/bed.png" width="100%" height="100%" />
	      </c:if>
	      <c:if test="${id == 1}">
	     	 <img src="../image/sofa.png" width="100%" height="100%" />
	      </c:if>
	      <c:if test="${id == 2}">
	     	 <img src="../image/table.png" width="100%" height="100%" />
	      </c:if>
      </div>
    </div>

	 <div class="container marketing"><hr><br>
	   <div class="row">
	     <div class="col-lg-4">
	       <svg class="bd-placeholder-img rounded-circle" width="200" height="200"><image href="../image/midbed.png" width="100%" height="100%" /></svg>
	       <h4>침실가구</h4>
	       <br>
	       <p><a class="btn btn-secondary" href="../productList/0">제품 페이지 &raquo;</a></p>
	     </div>
	     <div class="col-lg-4">
	       <svg class="bd-placeholder-img rounded-circle" width="200" height="200"><image href="../image/midsofa.png" width="100%" height="100%" /></svg>
	       <h4>거실가구</h4>
	       <br>
	       <p><a class="btn btn-secondary" href="../productList/1">제품 페이지 &raquo;</a></p>
	     </div>
	     <div class="col-lg-4">
	       <svg class="bd-placeholder-img rounded-circle" width="200" height="200"><image href="../image/midtable.png" width="100%" height="100%" /></svg>
	       <h4>테이블&의자</h4>
	       <br>
	       <p><a class="btn btn-secondary" href="../productList/2">제품 페이지 &raquo;</a></p>
	     </div>
	   </div><hr>
	  </div>
	<div class="container">
		<div class="album py-5 bg-light">
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				<c:forEach var="item" items="${items}">
					<c:if test="${item.kind == id}">
						<div class="col">
							<div class="card shadow-sm">
								<a href="../productDetail/${item.id}"><img src="../${item.img}" width="100%" height="100%" /></a>
								<div class="card-body">
									<h4 class="card-text">${item.name}</h4>
									<p class="card-text">&#92;${item.price}</p>
									<a href="../productDetail/${item.id}"><button type="button" class="btn btn-sm btn-outline-primary">제품상세보기</button></a>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div><hr>
		
	</div>
<%@ include file="../headerfooter/footer.jsp"%>