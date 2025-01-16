<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 


<!-- 권한 정리 
    부서장 = ${role_head}
    전산과 = ${role_it}
    영업지원과 = ${role_sales}
    가맹점관리과 = ${role_fm}
    인사과 = ${role_hr} 		-->
<sec:authorize access="hasRole('ROLE_HEAD')" var="role_head"></sec:authorize>
<sec:authorize access="hasRole('ROLE_IT')" var="role_it"></sec:authorize>
<sec:authorize access="hasRole('ROLE_SALES')" var="role_sales"></sec:authorize>
<sec:authorize access="hasRole('ROLE_FM')" var="role_fm"></sec:authorize>
<sec:authorize access="hasRole('ROLE_HR')" var="role_hr"></sec:authorize>