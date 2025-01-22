<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>HARUON 메신저</title>
    <link rel="icon" type="image/x-icon" href="../src/assets/img/favicon.ico"/>
    <link href="../layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
    <script src="../layouts/vertical-light-menu/loader.js"></script>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="../src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="../src/assets/css/light/apps/chat.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL STYLES -->
    <style>
	    #content-sub {
		  width: 50%;
		  flex-grow: 8;
		  margin-bottom: 0;
		  -webkit-transition: 0.3s ease all;
		  transition: 0.3s ease all;
		}
    </style>
</head>
<body>
    <!-- BEGIN LOADER -->
    <div id="load_screen"> <div class="loader"> <div class="loader-content"> <div class="spinner-grow align-self-center">
    </div></div></div></div>
    <!--  END LOADER -->

    <!--  BEGIN MAIN CONTAINER  -->
    <div class="main-container" id="container">

        <div class="overlay"></div>
        <div class="cs-overlay"></div>
        <div class="search-overlay"></div>

        <!--  BEGIN CONTENT AREA  -->
        <div id="content-sub" class="main-content">
            <div class="chat-section layout-top-spacing">
                <div>
                    <div class="chat-system">
                        <!-- 채팅 내역 시작 -->
                        <div class="chat-box">
                            <div class="chat-box-inner">
                                <div class="chat-meta-user">
                                    <div class="current-chat-user-name">
                                    	<!-- 상대방 정보 -->
                                        <span id="particiant">

                                        </span>
                                    </div>

                                </div>
                                <div class="chat-conversation-box">
                                    <div id="chat-conversation-box-scroll" class="chat-conversation-box-scroll">
                                        <div id="conversation" class="chat active-chat person">
                                        <!--  대화 동적 처리 시작 -->
                                            <div class="conversation-start">
                                                <span>어제</span>
                                            </div>
                                            <div class="bubble you">
                                                Hello,
                                            </div>
                                            <div class="bubble me">
                                                It's me.
                                            </div>
                                            <div class="conversation-start">
                                                <span>오늘</span>
                                            </div>
                                            <div class="bubble you">
                                                Hello,
                                            </div>
                                            <div class="bubble you">
                                                It's me.
                                            </div>
                                            <!--  대화 동적 처리 끝 -->
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="chat-footer">
                                    <div class="chat-input">
                                        <form class="chat-form" action="javascript:void(0);">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-square"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path></svg>
                                            <input type="text" class="mail-write-box form-control" placeholder="Message"/>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 채팅 내역 끝 -->
                        
                    </div>
                </div>
            </div>
            <div class="text-end m-2">
        		<a class="btn btn-warning" onclick="window.close()">창닫기</a>
        	</div>
        </div>
        <!--  END CONTENT AREA  -->
    </div>
    <!-- END MAIN CONTAINER -->
    
    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="../src/plugins/src/global/vendors.min.js"></script>
    <script src="../src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="../src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="../src/plugins/src/waves/waves.min.js"></script>
    <script src="../layouts/vertical-light-menu/app.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->

    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="../src/assets/js/apps/chat.js"></script>
    <!-- END PAGE LEVEL SCRIPTS -->
    <!-- ajax 호출 채팅 상대방 정보 / 이전 대화내역 -->
    <script>
   		showParticiant();
    	
    	function showParticiant() {
    		$.ajax({
    			url: '/chat/room/' + ${roomId} + '/particiant',
    			method: 'GET',
    		}).done(function(result) {
    			let conn = result.connectionStatus;
    			conn = (conn === "J01")? `<span class="badge badge-light-success ms-2">온라인</span>`
   	            	   : (conn === "J02")? `<span class="badge badge-light-secondary ms-2">오프라인</span>` 
  		    	       : (conn === "J03")? `<span class="badge badge-light-info ms-2">자리비움</span>`
  		    	       : (conn === "J04")? `<span class="badge badge-light-warning ms-2">회의중</span>`
  		    	   							: '';
    			
    			let profile = result.fileName + "." + result.ext;
    		  	profile = (profile.trim() === "null.null")? "noProfile.png" : profile;
    		  	
    		  	let particiantHTML = ''
    		  	particiantHTML += ` <img src="${pageContext.request.contextPath}/upload/profile/` + profile + `" alt="dynamic-image">
					                <span>` + result.ename + conn + `</span>
					            	`;
    		  	$("#particiant").append(particiantHTML);
    		}).fail(function() {
    			console.log('showParticiant ajax 호출 실패');
    		});
    	}
    	
    	function showConversation() {
    		$.ajax({
    			url: '/chat/room/' + ${roomId} + '/conversation',
    			method: 'GET',
    		}).done(function(result) {
    			
    		}).fail(function() {
    			console.log('showParticiant ajax 호출 실패');
    		});
    	}
    	
    
    
    </script>
    
</body>
</html>