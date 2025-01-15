<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

	<!-- 권한 정리 
	    부서장 = ${role_head}
	    전산과 = ${role_it}
	    영업지원과 = ${role_sales}
	    가맹점관리과 = ${role_fm}
	    인사과 = ${role_hr}
    -->
   <sec:authorize access="hasRole('ROLE_HEAD')" var="role_head"></sec:authorize>
   <sec:authorize access="hasRole('ROLE_IT')" var="role_it"></sec:authorize>
   <sec:authorize access="hasRole('ROLE_SALES')" var="role_sales"></sec:authorize>
   <sec:authorize access="hasRole('ROLE_FM')" var="role_fm"></sec:authorize>
   <sec:authorize access="hasRole('ROLE_HR')" var="role_hr"></sec:authorize>

<nav id="sidebar">

	<div class="navbar-nav theme-brand flex-row  text-center">
		<div class="nav-logo">
			<div class="nav-item theme-logo">
				<a href="${pageContext.request.contextPath}/home">
					<img src="${pageContext.request.contextPath}/src/assets/img/logo.svg" class="navbar-logo" alt="logo">
				</a>
			</div>
			<div class="nav-item theme-text">
				<a href="${pageContext.request.contextPath}/home" class="nav-link"> SKILLUP </a>
			</div>
		</div>
		<div class="nav-item sidebar-toggle">
			<div class="btn-toggle sidebarCollapse">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevrons-left"><polyline points="11 17 6 12 11 7"></polyline><polyline points="18 17 13 12 18 7"></polyline></svg>
			</div>
		</div>
	</div>
	<div class="shadow-bottom"></div>

	<ul class="list-unstyled menu-categories" id="accordionExample">
		<li class="menu active">
			<a href="#dashboard" data-bs-toggle="collapse active" aria-expanded="true" class="dropdown-toggle">
				<div class="">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
					<span>마이페이지</span>
				</div>
				<div>
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
				</div>
			</a>
			<ul class="collapse submenu list-unstyled show" id="dashboard" data-bs-parent="#accordionExample">
				<li class="active">
					<a href="${pageContext.request.contextPath}/myInfo">내 정보 </a>
				</li>
			</ul>
		</li>
		
		<c:if test="${!role_head}">
			<li class="menu">
				<a href="${pageContext.request.contextPath}/employee/attendance" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
					<div class="">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>
						<span>근태관리</span>
					</div>
					<div>
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
					</div>
				</a>
			</li>
		</c:if>
		
		<c:if test="${role_head}">
			<li class="menu">
				<a href="#attendance" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
					<div class="">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>
						<span>근태관리</span>
					</div>
					<div>
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
					</div>
				</a>
				<ul class="collapse submenu list-unstyled" id="attendance" data-bs-parent="#accordionExample">
					<li class="active">
						<a href="${pageContext.request.contextPath}/employee/attendance">내 근태</a>
					</li>
					<li class="active">
						<a href="${pageContext.request.contextPath}/department/attendance">부서 근태</a>
					</li>
				</ul>
			</li>
		</c:if>
		
		<li class="menu">
			<a href="#" aria-expanded="false" class="dropdown-toggle">
				<div class="">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>
					<span>쪽지함(사이드바 수정필요)</span>
				</div>
			</a>
		</li>

		<li class="menu">
			<a href="${pageContext.request.contextPath}/calendar" aria-expanded="false" class="dropdown-toggle">
				<div class="">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-square"><polyline points="9 11 12 14 22 4"></polyline><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path></svg>
					<span>일정</span>
				</div>
			</a>
		</li>

		<li class="menu menu-heading">
			<div class="heading"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-minus"><line x1="5" y1="12" x2="19" y2="12"></line></svg><span>USER INTERFACE</span></div>
		</li>

		<li class="menu">
			<a href="#components" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
				<div class="">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-briefcase"><rect x="2" y="7" width="20" height="14" rx="2" ry="2"></rect><path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path></svg>
					<span>문서</span>
				</div>
				<div>
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
				</div>
			</a>
			<ul class="collapse submenu list-unstyled" id="components" data-bs-parent="#accordionExample">
				<li>
					<a href="${pageContext.request.contextPath}/approval"> 결재신청  </a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/draft/list"> 내문서함 </a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/component-accordion.html"> 참조문서함  </a>
				</li>
			</ul>
		</li>

		<li class="menu">
			<a href="#elements" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
				<div class="">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
					<span>조직도</span>
				</div>
				<div>
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
				</div>
			</a>
			<ul class="collapse submenu list-unstyled" id="elements" data-bs-parent="#accordionExample">
				<li>
					<a href="./element-alerts.html"> 조직도 </a>
				</li>
				<li>
					<a href="./element-avatar.html"> 사원 조회(미완) </a>
				</li>
				<c:if test="${role_hr}">
					<li>
						<a href="addEmp">사원등록</a>
					</li>
				</c:if>
			</ul>
		</li>

		<li class="menu">
			<a href="#board" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
				<div class="">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clipboard"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path><rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect></svg>
					<span>게시판</span>
				</div>
				<div>
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
				</div>
			</a>
			<ul class="collapse submenu list-unstyled" id="board" data-bs-parent="#accordionExample">
				<li>
					<a href="${pageContext.request.contextPath}/board/notice"> 공지 게시판 </a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/board"> 자유 게시판 </a>
				</li>
				<c:if test="${role_it}">
					<li>
						<a href="${pageContext.request.contextPath}/categories"> 카테고리 관리 </a>
					</li>
				</c:if>
			</ul>
		</li>
		
		<li class="menu">
			<a href="#reservation" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
				<div class="">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-square"><polyline points="9 11 12 14 22 4"></polyline><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path></svg>
					<span>회의실 예약</span>
				</div>
				<div>
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
				</div>
			</a>
			<ul class="collapse submenu list-unstyled" id="reservation" data-bs-parent="#accordionExample">
				<c:if test="${role_it}">
					<li>
						<a href="/meetingRooms">회의실 조회 / 관리</a>
					</li>
				</c:if>
				<c:if test="!${role_it}">
					<li>
						<a href="/meetingRooms">회의실 리스트</a>
					</li>
				</c:if>
				<li>
					<a href="/meetingRooms/myReservation">내 예약 리스트</a>
				</li>
			</ul>
		</li>

		<c:if test="${role_fm}">
			<li class="menu">
				<a href="#franchise" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
					<div class="">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trello"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><rect x="7" y="7" width="3" height="9"></rect><rect x="14" y="7" width="3" height="5"></rect></svg>
						<span>가맹점 </span>
					</div>
					<div>
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
					</div>
				</a>
				<ul class="collapse submenu list-unstyled" id="franchise" data-bs-parent="#accordionExample">
					<li>
						<a href="/franchises"> 가맹점 조회 </a>
					</li>
					<li>
						<a href="/franchises/insert"> 가맹점 등록 </a>
					</li>
					<li>
						<a href="/franchises/courses"> 가맹점 교육 </a>
					</li>
					<li>
						<a href="/franchises/questions"> 가맹점 문의 </a>
					</li>
				</ul>
			</li>
		</c:if>

		<li class="menu menu-heading">
			<div class="heading"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-minus"><line x1="5" y1="12" x2="19" y2="12"></line></svg><span>TABLES AND FORMS</span></div>
		</li>

	<li class="menu">
		<a href="/logout" aria-expanded="false" class="dropdown-toggle">
			<div class="">
				<svg xmlns="http://www.w3.org/2000/svg"  width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-log-out"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" y1="12" x2="9" y2="12"></line></svg>
				<span>로그아웃</span> 
			</div>
		</a>
	</li>

	<li class="menu">
		<a href="https://github.com/SkillUp86/haruon.git" aria-expanded="false" class="dropdown-toggle">
			<div class="">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-github"><path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"></path></svg>
				<span>GitHub</span>
			</div>
		</a>
	</li>
		
	

</nav>
                
