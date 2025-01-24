<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="footer-wrapper">
	
    <div id="leftFooterConteiner" class="footer-section f-section-1">
		<div class="theme-brand d-flex align-items-center">
			<img src="${pageContext.request.contextPath}/src/assets/img/logo.svg">
			<span>HARUON</span>
		</div>
    </div>
    
    <div id="rightFooterConteiner" class="footer-section f-section-2">
       
    </div>
    
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
	$.ajax( {
		url: '${pageContext.request.contextPath}/company/information',
		method: 'GET',
	}).done(function(result) {
		rightFooterHTML = `<p class="text-end">
								<span>` + result.comName.toUpperCase() + ` 대표 ` + result.leader + `</span> 
								<span>` + result.address + `</span> 
						   </p>
								<span>phone- ` + result.phone + ` email- ` + result.email + `</span>`;
		
		$("#rightFooterConteiner").append(rightFooterHTML);
	}).fail(function() {
		console.log('show company information ajax 호출 실패')
	});
</script>