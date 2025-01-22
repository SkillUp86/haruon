<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authentication property="principal" var="user" />
<div class="approval-section">
<c:if test="${d.midApp != null}">
    <div class="approver mt-4">
        <p>중간결재자</p>
        <div class="signature-box">
        	<c:if test="${d.midFilename != null || (d.state == 'A02' || d.state == 'A03')}">
        		<img src="${pageContext.request.contextPath}/upload/sign/${d.midFilename}.${d.midFileExt}">
        	</c:if>
        </div>
        <p>${d.midAppName}</p>
    </div>
</c:if>
   <div class="approver mt-4">
       <p>최종결재자</p>
       <div class="signature-box">
       	<c:if test="${d.finalFilename != null || d.state == 'A03'}">
       		<img src="${pageContext.request.contextPath}/upload/sign/${d.finalFilename}.${d.finalFileExt}">
       	</c:if>
      	</div>
       <p>${d.finalAppName}</p>
    </div>
</div><br><br><br><br><br><br><br><br><br>