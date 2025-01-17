<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<sec:authentication property="principal" var="principal"/>


<header class="header navbar navbar-expand-sm expand-header">
	<!-- 로고 부분 -->
	<ul class="navbar-item theme-brand flex-row  text-center">
		<li class="nav-item theme-logo">
			<a href="${pageContext.request.contextPath}/home">
				<img alt="" src="${pageContext.request.contextPath}/src/assets/img/logo.svg">
			</a>
		</li>
		<li class="nav-item theme-text">
			<a href="${pageContext.request.contextPath}/home" class="nav-link">HARUON</a>
		</li>
	</ul>
	
	<!-- 우측 회원 프로필 + 쪽지 수신 알림 -->
	<ul class="navbar-item flex-row ms-lg-auto ms-0 action-area">
	 
		<!-- 알림창 드롭다운 메뉴 -->
		<li class="nav-item dropdown notification-dropdown me-2">
		
			<a href="javascript:void(0);" class="nav-link dropdown-toggle" id="notificationDropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg><span class="badge badge-success"></span>
			</a>

			<div class="dropdown-menu position-absolute" aria-labelledby="notificationDropdown">
				<div class="drodpown-title message">
					<h6 class="d-flex justify-content-between">
						<span class="align-self-center"><div>읽지 않은 메세지</div></span>
						<!-- 안읽은 쪽지의 수 -->
						<span id="unreadmsgCount" class="badge badge-primary"></span>
					</h6>
				</div>
				<div class="notification-scroll">
					<div id="d" class="dropdown-item">
						<!-- 안읽은 쪽지에 대한 요약 정보 -->
						<div id="unreadMsgSumList" class="media server-log"></div>
					</div>
				</div>
			</div>
		</li>
		<!-- 알림창 드롭다운 메뉴 끝 -->    

		<!-- 유저 프로필 드롭다운 -->
		<li class="nav-item dropdown user-profile-dropdown  order-lg-0 order-1">
			<a href="javascript:void(0);" class="nav-link dropdown-toggle user" id="userProfileDropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<div class="avatar-container">
					<div class="avatar avatar-sm avatar-indicators avatar-online">
						<img src="${pageContext.request.contextPath}/upload/profile/noProfile.png" class="img-fluid me-2 rounded-circle" alt="avatar">
					</div>
				</div>
			</a>

			<div class="dropdown-menu position-absolute" aria-labelledby="userProfileDropdown">
				<div class="user-profile-section">
					<div class="media mx-auto">
						<div class="emoji me-2">
							&#x1F44B;
						</div>
						<div class="media-body">
							<!--현재 로그인 표시 -->
							<h5>${principal.ename}</h5>
							
							<!-- 현재 로그인한 계정 사원의 부서 -->
							<p>${principal.dname}</p>
						</div>
					</div>
				</div>
				<div class="dropdown-item">
					<a href="${pageContext.request.contextPath}/myInfo">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user">
							<path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
							<circle cx="12" cy="7" r="4"></circle>
						</svg> 
						<span>내 정보</span>
					</a>
				</div>
				<div class="dropdown-item">
					<a href="${pageContext.request.contextPath}/logout">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-log-out">
							<path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
							<polyline points="16 17 21 12 16 7"></polyline>
							<line x1="21" y1="12" x2="9" y2="12"></line>
						</svg> 
						<span>로그아웃</span>
					</a>
				</div>
			</div>
		</li>
		<!-- 유저 프로필 드롭다운  끝 -->
	</ul>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<!-- Ajax 관련 함수 부분-->
	<script>
		showUnreadMsgCount();
		function showUnreadMsgCount() {
			$.ajax({
				url: '/user/'+'${principal.empNo}'+'/messagies/unread',
				method: 'GET',
			}).done(function(result) {
				let unreadmsgCountHtml = '';
				$("#unreadmsgCount").empty();
				
				unreadmsgCountHtml += (result[0] == null? 0 : result[0]) + "건";
							
				$("#unreadmsgCount").append(unreadmsgCountHtml);
			}).fail(function() {
				console.log("showUnreadMsgCount - ajax 호출 실패");
			});
		}
/*
		function showUnreadMsgSumList() {
			$.ajax({
				url: '/user/+'${principal.empNo}'+/messageCount/unread',
				method: 'GET',
			}).done(function(rusult) {
				let unreadMsgSumListHtml = "";
				unreadMsgSumListHtml = `<img src="${pageContext.request.contextPath}/upload/profile/noProfile.png" class="img-fluid me-2" alt="avatar">
										<div class="media-body">
											<a href="#">
												<div class="data-info">
													<h6 class="">보낸사람</h6>
												</div>
											</a>
										</div>
										`
			})
*/
		}

	</script>
</header>

