<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../headerfooter/header.jsp"%>
<div class="container">

	<h3 style="text-align: center; margin-top: 50px">이벤트</h3><br>
		<div class="row">
			<c:forEach items="${boardevents}" var="boardevent">
				<c:if test="${boardevent.kind==1}">
			    <div class="col-sm-6 col-lg-4 mb-4">
			      <div>
			        <svg class="bd-placeholder-img card-img-top" width="400" height="300"><image href="${boardevent.img}" width="100%" height="100%"></svg>
			        <div class="card-body">
			            <h4>${boardevent.title}</h4><br>
			           		${boardevent.content}
			        </div>
			      </div>
			    </div>
			    </c:if>
			</c:forEach>
		</div><br><br><hr>

</div>   
<%@ include file="../headerfooter/footer.jsp"%>


































