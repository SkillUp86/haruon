<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>Chat Application | CORK - Multipurpose Bootstrap Dashboard Template </title>
    <link rel="icon" type="image/x-icon" href="../src/assets/img/favicon.ico"/>
    <link href="../layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/dark/loader.css" rel="stylesheet" type="text/css" />
    <script src="../layouts/vertical-light-menu/loader.js"></script>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="../src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/dark/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="../src/assets/css/light/apps/chat.css" rel="stylesheet" type="text/css" />
    <link href="../src/assets/css/dark/apps/chat.css" rel="stylesheet" type="text/css" />
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
                                        <span>
                                            <img src="../src/assets/img/90x90.jpg" alt="dynamic-image">
                                            <span>Sean Freeman</span>
                                        </span>
                                    </div>

                                    <div class="chat-action-btn align-self-center me-2">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-phone  phone-call-screen"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path></svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-video video-call-screen"><polygon points="23 7 16 12 23 17 23 7"></polygon><rect x="1" y="5" width="15" height="14" rx="2" ry="2"></rect></svg>
                                    </div>
                                </div>
                                <div class="chat-conversation-box">
                                    <div id="chat-conversation-box-scroll" class="chat-conversation-box-scroll">
                                        <div class="chat active-chat" data-chat="person">
                                            <div class="conversation-start">
                                                <span>Today, 6:48 AM</span>
                                            </div>
                                            <div class="bubble you">
                                                Hello,
                                            </div>
                                            <div class="bubble you">
                                                It's me.
                                            </div>
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
    
</body>
</html>