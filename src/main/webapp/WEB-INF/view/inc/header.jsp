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
		<li class="nav-item dropdown notification-dropdown">
			
			
			<button href="javascript:void(0);" type="button" class="btn bg-transparent active nav-link dropdown-toggle" id="notificationDropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<span class="me-1 fw-bold fst-italic text-white">
	 				MAIL
 				</span>
				<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#fff"><path d="M160-160q-33 0-56.5-23.5T80-240v-480q0-33 23.5-56.5T160-800h404q-4 20-4 40t4 40H160l320 200 146-91q14 13 30.5 22.5T691-572L480-440 160-640v400h640v-324q23-5 43-14t37-22v360q0 33-23.5 56.5T800-160H160Zm0-560v480-480Zm600 80q-50 0-85-35t-35-85q0-50 35-85t85-35q50 0 85 35t35 85q0 50-35 85t-85 35Z"/></svg>
			</button>

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
						<div id="unreadMsgSumList"></div>
					</div>
				</div>
			</div>
		</li>
		<!-- 알림창 드롭다운 메뉴 끝 -->   
		
		<!-- 메신저 팝업 버튼 -->
		<li class="nav-item">
	 		<button id="chatPopUpBtn" type="button" class="btn bg-transparent">
	 			<span class="me-1 fw-bold fst-italic text-white">
	 				MESSANGER
 				</span>
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#fff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-circle"><path d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z"></path></svg>
	 		</button>
	 	</li> 

		<!-- 유저 프로필 드롭다운 -->
		<li class="nav-item dropdown user-profile-dropdown  order-lg-0 order-1">
			<a href="javascript:void(0);" class="nav-link dropdown-toggle user" id="userProfileDropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<div class="avatar-container">
					<div class="avatar avatar-sm avatar-indicators avatar-online">
						<img src="${pageContext.request.contextPath}/${principal.profileUrl}" class="img-fluid me-2 rounded-circle" alt="avatar">
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
		showUnreadMsgSumList();
		function showUnreadMsgCount() {
			$.ajax({
				url: '/user/' + ${principal.empNo} + '/messageCount/unread', 
				method: 'GET',
			}).done(function(result) {
				let unreadmsgCountHtml = '';
				$("#unreadmsgCount").empty();
				
				unreadmsgCountHtml += (result == null? '0' : result) + "건";
							
				$("#unreadmsgCount").append(unreadmsgCountHtml);
			}).fail(function() {
				console.log("showUnreadMsgCount - ajax 호출 실패");
			});
		}
		
		function showUnreadMsgSumList() {
			$.ajax({
				url: '/user/'+${principal.empNo}+'/messagies/unread',
				method: 'GET',
			}).done(function(result) {
				  
				let unreadMsgSumListHtml = "";
				let now = new Date();
	     		now.setHours(0,0,0,0);
	     		
				$(result).each(function(index, item) {
					
		     		let sendTime = item.sendDate;
		     		let sendDate = new Date(sendTime.substr(0,4), sendTime.substr(5,2) - 1, sendTime.substr(8,2));
		     		// 오늘 날짜라면 시간만 나오게 하고, 올해대화가 아니라면 년월일로표시
		     		sendTime = (now.toDateString() === sendDate.toDateString())? 
		     				  			((sendTime.substr(11,2) <= 12) ? 'AM' + sendTime.substr(11,5) : 'PM' + sendTime.substr(11,5))
		     				  				: (sendDate.getFullYear() === now.getFullYear()? sendTime.substr(5,2)+'월'+sendTime.substr(8,2)+'일' : sendTime.substr(0,10));
		     				  			
					
					
					let profile = (item.senderProfileName == null)? 'noProfile.png' : item.senderProfileName + '.' + item.senderProfileExt;
					unreadMsgSumListHtml +=`<div class="mb-2">
												<a href="${pageContext.request.contextPath}/readersMsg">
													<div class="rounded w-100 d-flex justify-content-between align-items-center">
														<div>
												        	<img alt="avatar" src="${pageContext.request.contextPath}/upload/profile/` + profile + `" class="rounded"/>
												    		<span class="text"><strong>` + item.senderName + `</strong></span>
											    		</div>
											    		<small class="text">
											    			<span>` + sendTime + `</span>
															<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#515365"><path d="M504-480 320-664l56-56 240 240-240 240-56-56 184-184Z"/></svg>
											    		</small>
											    		
											    	</div>
												</a>
											</div>
											`
				});
				
				$("#unreadMsgSumList").append(unreadMsgSumListHtml);
			
			}).fail( function() {
				console.log('showUnreadMsgSumList -  호출 실패');
			});
		}

	</script>
	
	<!-- 메신저 버튼 클릭시 메신저창 팝업 -->
	<script>
		$("#chatPopUpBtn").click(function() {
			window.open('${pageContext.request.contextPath}/chat/main', '_blank', 'width=5, height=6, resizable=yes');
		});
	</script>
</header>

