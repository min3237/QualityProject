<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../headerfooter/header.jsp"%>
<div class="container">

        <br><br>
        <table class="table table-bordered table-striped table-white table-hover">
          <thead class="text-center">
            <tr>
              <th><h3>공지사항</h3></th>
            </tr>
          </thead>
          <tbody class="text-center">
			<c:forEach var="boardnotice" items="${boardnotices}">  
			<c:if test="${boardnotice.kind==0}">        
            <tr>
              <td class="text-left" width="50%">
                <div class="panel-faq-container">
                  <p class="panel-faq-title" style="font-weight:bold; font-size:20px"> ${boardnotice.title}</p>
                  <div class="panel-faq-answer">${boardnotice.content}</div>
                </div>
              </td>
            </tr>
            </c:if>
            </c:forEach>
          </tbody>
        </table><br><br><br><br><hr>

</div>
<script type="text/javascript" src="/js/board.js"></script>
<%@ include file="../headerfooter/footer.jsp"%>