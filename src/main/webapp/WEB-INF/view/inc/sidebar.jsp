<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/inc/authVar.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

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
	<ul class="list-unstyled menu-categories" id="sideBarAccordion">
		<!-- 마이페이지 : id - myPageToggle -->
		<li class="menu">
			<a id="myPageToggle" href="#myPage" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
				<div>
					<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="#5a5a5a" d="M304 128a80 80 0 1 0 -160 0 80 80 0 1 0 160 0zM96 128a128 128 0 1 1 256 0A128 128 0 1 1 96 128zM49.3 464l349.5 0c-8.9-63.3-63.3-112-129-112l-91.4 0c-65.7 0-120.1 48.7-129 112zM0 482.3C0 383.8 79.8 304 178.3 304l91.4 0C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7L29.7 512C13.3 512 0 498.7 0 482.3z"/></svg>
					<span>마이페이지</span>
				</div>
				<div>
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
				</div>
			</a>
			<ul class="collapse submenu list-unstyled" id="myPage" data-bs-parent="#sideBarAccordion">
				<li class="active">
					<a href="${pageContext.request.contextPath}/myInfo">내 정보 </a>
				</li>
			</ul>
		</li>

		<!-- 근태관리 : class - attendanceToggle -->
		<c:if test="${!role_head}">
			<li class="menu">
				<a id="attendanceToggle" href="${pageContext.request.contextPath}/employee/attendance" aria-expanded="false" class="dropdown-toggle">
					<div>
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user-check"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><polyline points="17 11 19 13 23 9"></polyline></svg>
						<span>근태관리</span>
					</div>
				</a>
			</li>
		</c:if>

		<c:if test="${role_head}">
			<li class="menu">
				<a id="attendanceToggle" href="#attendance" data-bs-toggle="collapse" aria-expanded="false" class="attendanceToggle dropdown-toggle">
					<div>
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user-check"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><polyline points="17 11 19 13 23 9"></polyline></svg>
						<span>근태관리</span>
					</div>
					<div>
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
					</div>
				</a>
				<ul class="collapse submenu list-unstyled" id="attendance" data-bs-parent="#sideBarAccordion">
					<li class="active">
						<a href="${pageContext.request.contextPath}/employee/attendance">나의 근태</a>
					</li>
					<li class="active">
						<a href="${pageContext.request.contextPath}/department/attendance">부서 근태</a>
					</li>
				</ul>
			</li>
		</c:if>
		
		<!-- 쪽지함 : id - messageToggle -->
		<li class="menu">
			<a id="messageToggle" href="#mail" data-bs-toggle="collapse" aria-expanded="false" class="attendanceToggle dropdown-toggle">
				<div>
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>
					<span>메일함</span>
				</div>
				<div>
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
				</div>
			</a>
			<ul class="collapse submenu list-unstyled" id="mail" data-bs-parent="#sideBarAccordion">
				<li class="active">
					<a href="${pageContext.request.contextPath}/readersMsg">받은 메일함</a>
				</li>
				<li class="active">
					<a href="${pageContext.request.contextPath}/sendersMsg">보낸 메일함</a>
				</li>
				<li class="active">
					<a href="${pageContext.request.contextPath}/temporarysMsg">임시 보관함</a>
				</li>
				<li class="active">
					<a href="${pageContext.request.contextPath}/trashsMsg">휴지통</a>
				</li>
			</ul>
		</li>

		<!-- 일정 : id - scheduleToggle -->
		<li class="menu">
			<a id="scheduleToggle" href="${pageContext.request.contextPath}/calendar" aria-expanded="false" class="dropdown-toggle">
				<div>
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>
					<span>일정</span>
				</div>
			</a>
		</li>

		<!-- 문서 : id - draftToggle -->
		<li class="menu">
			<a id="draftToggle" href="#components" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
				<div>
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-briefcase"><rect x="2" y="7" width="20" height="14" rx="2" ry="2"></rect><path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path></svg>
					<span>문서</span>
				</div>
				<div>
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
				</div>
			</a>
			<ul class="collapse submenu list-unstyled" id="components" data-bs-parent="#sideBarAccordion">
				<li>
					<a href="${pageContext.request.contextPath}/approval"> 결재신청  </a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/draft/list"> 내문서함 </a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/draft/refers/list"> 참조문서함 </a>
				</li>
			</ul>
		</li>

		<!-- 조직도 : id - coworkerToggle -->
		<li class="menu">
			<a id="coworkerToggle" href="#elements" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
				<div class="">
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
					<span>조직도</span>
				</div>
				<div>
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
				</div>
			</a>
			<ul class="collapse submenu list-unstyled" id="elements" data-bs-parent="#sideBarAccordion">
				<li>
					<a href="${pageContext.request.contextPath}/depts/chart"> 조직도 </a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/employees"> 사원 조회 </a>
				</li>
				<c:if test="${role_hr}">
					<li>
						<a href="${pageContext.request.contextPath}/addEmp">사원등록</a>
					</li>
				</c:if>
				<c:if test="${!role_it}">
					<li>
						<a href="${pageContext.request.contextPath}/company"> 회사 </a>
					</li>
				</c:if>
			</ul>
		</li>

		<!-- 게시판 : id - boardToggle -->
		<li class="menu">
			<a id="boardToggle" href="#board" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
				<div>
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clipboard"><path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2"></path><rect x="8" y="2" width="8" height="4" rx="1" ry="1"></rect></svg>
					<span>게시판</span>
				</div>
				<div>
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
				</div>
			</a>
			<ul class="collapse submenu list-unstyled" id="board" data-bs-parent="#sideBarAccordion">
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
		
		<!-- 회의/미팅룸 : id - meetingToggle -->
		<li class="menu">
			<a id="meetingToggle" href="#reservation" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
				<div>
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-square"><polyline points="9 11 12 14 22 4"></polyline><path d="M21 12v7a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h11"></path></svg>
					<span>회의실 예약</span>
				</div>
				<div>
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
				</div>
			</a>
			<ul class="collapse submenu list-unstyled" id="reservation" data-bs-parent="#sideBarAccordion">
				<c:if test="${role_it}">
					<li>
						<a href="${pageContext.request.contextPath}/meetingroom">회의실 조회 / 관리</a>
					</li>
				</c:if>
				<c:if test="${role_it == false}">
					<li>
						<a href="${pageContext.request.contextPath}/meetingroom">회의실 리스트</a>
					</li>
				</c:if>
				<li>
					<a href="${pageContext.request.contextPath}/myReservation">내 예약 리스트</a>
				</li>
			</ul>
		</li>

		<!-- 가맹점 : id - franchiseToggle -->
		<c:if test="${role_fm}">
			<!-- 가맹점 1계층 시작 -->
			<li class="menu">
				<a id="franchiseToggle" href="#aboutfranchise" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
					<div class="">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trello"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><rect x="7" y="7" width="3" height="9"></rect><rect x="14" y="7" width="3" height="5"></rect></svg>
						<span>가맹점</span>
					</div>
					<div>
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
					</div>
				</a>
		
				<ul class="collapse submenu list-unstyled" id="aboutfranchise" data-bs-parent="#sideBarAccordion">
					<!-- 가맹점 2계층 시작 -->
						<!-- 가맹점 2계층 : 가맹점 기본 정보 시작 -->
						<li>
							<a href="#basicFranchise" data-bs-toggle="collapse" aria-expanded="true" class="dropdown-toggle">
								<div>가맹점 관리</div>
								<div><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg></div>
							</a>
					
							<ul class="collapse submenu list-unstyled" id="basicFranchise" data-bs-parent="#aboutfranchise">
								<!-- 가맹점 3계층 : 가맹점 기본 정보 시작 -->
								<li class="ms-4">
									<a href="${pageContext.request.contextPath}/franchises"> 가맹점 리스트 </a>
								</li>
								<li class="ms-4">
									<a href="${pageContext.request.contextPath}/franchises/insert"> 가맹점 등록 </a>
								</li>
								<!-- 가맹점 3계층 : 가맹점 기본 정보 시작 -->
							</ul>
						</li>
						<!-- 가맹점 2계층 : 가맹점 기본 정보 끝 -->
					
						<!-- 가맹점 2계층 : 가맹점 교육 시작 -->
						<li>
							<a href="#eduFranchise" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
								<div>가맹점 교육</div>
								<div><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg></div>
							</a>
					
							<ul class="collapse submenu list-unstyled" id="eduFranchise" data-bs-parent="#aboutfranchise">
								<!-- 가맹점 3계층 : 가맹점 기본 정보 시작 -->
								<li class="ms-4">
									<a href="${pageContext.request.contextPath}/franchises/courses"> 교육 리스트 </a>
								</li>
								<li class="ms-4">
									<a href="${pageContext.request.contextPath}/franchises/courses/insert"> 교육 등록 </a>
								</li>
								<!-- 가맹점 3계층 : 가맹점 기본 정보 시작 -->
							</ul>
						</li>
						<!-- 가맹점 2계층 : 가맹점 교육육 끝 -->
					
						<!-- 가맹점 2계층 : 가맹점 교육의 시작 -->
						<li>
							<a href="${pageContext.request.contextPath}/franchises/questions" aria-expanded="false" class="dropdown-toggle">
								<div>가맹점 문의</div>
							</a>
						<!-- 가맹점 2계층 : 가맹점 교육 끝 -->
						</li>
					<!-- 가맹점 2계층 종료 -->
				</ul>
			</li>
			<!-- 가맹점 1계층 종료 -->
		</c:if>

		<!-- 회사부서관리 : id - companyToggle -->
		<c:if test="${role_it}">
			<li class="menu">
				<a id="companyToggle" href="#companyAndDeptSetting" data-bs-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
					<div>
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-settings"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg>
						<span> 회사/부서 관리 </span>
					</div>
					<div>
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-right"><polyline points="9 18 15 12 9 6"></polyline></svg>
					</div>
				</a>
				<ul class="collapse submenu list-unstyled" id="companyAndDeptSetting" data-bs-parent="#sideBarAccordion">
					<li>
						<a href="${pageContext.request.contextPath}/company"> 회사 </a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/depts"> 부서 </a>
					</li>
				</ul>
			</li>
		</c:if>
		
		<hr>
		<li class="menu">
			<a href="https://github.com/SkillUp86/haruon.git" aria-expanded="false" class="dropdown-toggle">
				<div>
					<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-github"><path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"></path></svg>
					<span>GitHub</span>
				</div>
			</a>
		</li>

		<hr>
	
		<li class="menu">
			<a href="${pageContext.request.contextPath}/logout" aria-expanded="false" class="dropdown-toggle">
				<div>
					<svg xmlns="http://www.w3.org/2000/svg"  width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-log-out"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" y1="12" x2="9" y2="12"></line></svg>
					<span>로그아웃</span> 
				</div>
			</a>
		</li>
	</ul>
	
	<!-- 현재 접속중인 URL에 따라 aria-expanded 속성 동적 처리 -->
	<script>
		let currentPath = window.location.pathname;
		let it = ${role_it};
	
		// 마이페이지
		if(currentPath === "/myInfo") {
			$("#myPageToggle").attr("aria-expanded", "true");
		}
		// 근태관리
		if(currentPath === "/employee/attendance" || currentPath === "/department/attendance") {
			$("#attendanceToggle").attr("aria-expanded", "true");
		}
		
		// 메일함
		if(currentPath === "/readersMsg" || currentPath === "/sendersMsg" || currentPath === "/temporarysMsg" || currentPath === "/trashsMsg") {
			$("#messageToggle").attr("aria-expanded", "true");
		}
		
		// 일정
		if(currentPath === "/calendar") {
			$("#scheduleToggle").attr("aria-expanded", "true");
		}
		// 문서
		if(currentPath === "/approval" || currentPath.startsWith("/draft")) {
			$("#draftToggle").attr("aria-expanded", "true");
		}
		// 조직도
		if(currentPath === "/addEmp" || currentPath === "/employees") {
			$("#coworkerToggle").attr("aria-expanded", "true");
		}
		
		
		// 게시판
		if(currentPath.startsWith("/board") || currentPath === "categories" ) {
			$("#boardToggle").attr("aria-expanded", "true");
		}
		// 회의실 예약
		if(currentPath === "/myReservation" || currentPath === "/meetingroom") {
			$("#meetingToggle").attr("aria-expanded", "true");
		}
		// 가맹점
		if(currentPath.startsWith("/franchises")) {
			$("#franchiseToggle").attr("aria-expanded", "true");
		}
		// 부서/회사
		if(it && (currentPath === "/company" || currentPath === "/depts")) {
			$("#companyToggle").attr("aria-expanded", "true");
		} 
		
		if(!it && (currentPath === "/company")) {
			$("#coworkerToggle").attr("aria-expanded", "true");
		}
		
		
		
	</script>
</nav>


