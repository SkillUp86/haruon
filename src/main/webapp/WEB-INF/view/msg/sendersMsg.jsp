<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<sec:authentication property="principal" var="principal"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" type="image/png" href="../src/assets/img/favicon.ico" />
    <link href="../layouts/vertical-light-menu/css/light/loader.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/dark/loader.css" rel="stylesheet" type="text/css" />
    <script src="../layouts/vertical-light-menu/loader.js"></script>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
    <link href="../src/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/light/plugins.css" rel="stylesheet" type="text/css" />
    <link href="../layouts/vertical-light-menu/css/dark/plugins.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    
    <!--  BEGIN CUSTOM STYLE FILE  -->
    <link href="../src/plugins/src/notification/snackbar/snackbar.min.css" rel="stylesheet" type="text/css" />
    <link href="../src/plugins/src/sweetalerts2/sweetalerts2.css" rel="stylesheet" type="text/css" />

    <link href="../src/assets/css/light/components/modal.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="../src/plugins/css/light/editors/quill/quill.snow.css">
    <link href="../src/assets/css/light/apps/mailbox.css" rel="stylesheet" type="text/css" />
    <link href="../src/plugins/css/light/sweetalerts2/custom-sweetalert.css" rel="stylesheet" type="text/css" />

    <link href="../src/assets/css/dark/components/modal.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="../src/plugins/css/dark/editors/quill/quill.snow.css">
    <link href="../src/assets/css/dark/apps/mailbox.css" rel="stylesheet" type="text/css" />
    <link href="../src/plugins/css/dark/sweetalerts2/custom-sweetalert.css" rel="stylesheet" type="text/css" />
    
    <!--  END CUSTOM STYLE FILE  -->
    
    <!-- 페이지 제목 입력칸 -->
    <title>보낸 쪽지함</title>
    <!-- 페이지 제목 입력칸 -->
</head>
<body class="layout-boxed">

    <!-- BEGIN LOADER -->
    <div id="load_screen"> <div class="loader"> <div class="loader-content">
        <div class="spinner-grow align-self-center"></div>
    </div></div></div>
    <!--  END LOADER -->

    <!--  BEGIN NAVBAR  -->
    <div class="header-container container-xxl">
        <jsp:include page="/WEB-INF/view/inc/header.jsp" />
    </div>
    <!--  END NAVBAR  -->
      
    <!--  BEGIN MAIN CONTAINER 템플릿 직접 끌어와서 사용  -->
    <div class="main-container" id="container">

        <div class="overlay"></div>
        <div class="cs-overlay"></div>
        <div class="search-overlay"></div>

        <!--  BEGIN SIDEBAR  -->
        <div class="sidebar-wrapper sidebar-theme">
            <jsp:include page="/WEB-INF/view/inc/sidebar.jsp" />
        </div>
        <!--  END SIDEBAR  -->

        <!--  BEGIN CONTENT AREA  -->
        <div id="content" class="main-content">
            <div class="layout-px-spacing">

                <div class="middle-content container-xxl p-0">
                    
                    <!--  BEGIN BREADCRUMBS  -->
                    <div class="secondary-nav">
                        <div class="breadcrumbs-container" data-page-heading="Analytics">
                            <header class="header navbar navbar-expand-sm">
                                <a href="javascript:void(0);" class="btn-toggle sidebarCollapse" data-placement="bottom">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu"><line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg>
                                </a>
                                <div class="d-flex breadcrumb-content">
                                    <div class="page-header">

                                        <div class="page-title">
                                        </div>
                        
                                        <nav class="breadcrumb-style-one" aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="#">Message</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">Send</li>
                                            </ol>
                                        </nav>
                        
                                    </div>
                                </div>
                                <ul class="navbar-nav flex-row ms-auto breadcrumb-action-dropdown">
                                    <li class="nav-item more-dropdown">
                                        <div class="dropdown  custom-dropdown-icon">
                                            <a class="dropdown-toggle btn" href="#" role="button" id="customDropdown" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span>Settings</span>
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down custom-dropdown-arrow"><polyline points="6 9 12 15 18 9"></polyline></svg>
                                            </a>
                        
                                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="customDropdown">

                                                <a class="dropdown-item" data-value="Settings" data-icon="<svg xmlns=&quot;http://www.w3.org/2000/svg&quot; width=&quot;24&quot; height=&quot;24&quot; viewBox=&quot;0 0 24 24&quot; fill=&quot;none&quot; stroke=&quot;currentColor&quot; stroke-width=&quot;2&quot; stroke-linecap=&quot;round&quot; stroke-linejoin=&quot;round&quot; class=&quot;feather feather-settings&quot;><circle cx=&quot;12&quot; cy=&quot;12&quot; r=&quot;3&quot;></circle><path d=&quot;M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z&quot;></path></svg>" href="javascript:void(0);">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-settings"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg> Settings
                                                </a>

                                                <a class="dropdown-item" data-value="Mail" data-icon="<svg xmlns=&quot;http://www.w3.org/2000/svg&quot; width=&quot;24&quot; height=&quot;24&quot; viewBox=&quot;0 0 24 24&quot; fill=&quot;none&quot; stroke=&quot;currentColor&quot; stroke-width=&quot;2&quot; stroke-linecap=&quot;round&quot; stroke-linejoin=&quot;round&quot; class=&quot;feather feather-mail&quot;><path d=&quot;M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z&quot;></path><polyline points=&quot;22,6 12,13 2,6&quot;></polyline></svg>" href="javascript:void(0);">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg> Mail
                                                </a>

                                                <a class="dropdown-item" data-value="Print" data-icon="<svg xmlns=&quot;http://www.w3.org/2000/svg&quot; width=&quot;24&quot; height=&quot;24&quot; viewBox=&quot;0 0 24 24&quot; fill=&quot;none&quot; stroke=&quot;currentColor&quot; stroke-width=&quot;2&quot; stroke-linecap=&quot;round&quot; stroke-linejoin=&quot;round&quot; class=&quot;feather feather-printer&quot;><polyline points=&quot;6 9 6 2 18 2 18 9&quot;></polyline><path d=&quot;M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2&quot;></path><rect x=&quot;6&quot; y=&quot;14&quot; width=&quot;12&quot; height=&quot;8&quot;></rect></svg>" href="javascript:void(0);">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-printer"><polyline points="6 9 6 2 18 2 18 9"></polyline><path d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"></path><rect x="6" y="14" width="12" height="8"></rect></svg> Print
                                                </a>

                                                <a class="dropdown-item" data-value="Download" data-icon="<svg xmlns=&quot;http://www.w3.org/2000/svg&quot; width=&quot;24&quot; height=&quot;24&quot; viewBox=&quot;0 0 24 24&quot; fill=&quot;none&quot; stroke=&quot;currentColor&quot; stroke-width=&quot;2&quot; stroke-linecap=&quot;round&quot; stroke-linejoin=&quot;round&quot; class=&quot;feather feather-download&quot;><path d=&quot;M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4&quot;></path><polyline points=&quot;7 10 12 15 17 10&quot;></polyline><line x1=&quot;12&quot; y1=&quot;15&quot; x2=&quot;12&quot; y2=&quot;3&quot;></line></svg>" href="javascript:void(0);">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-download"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path><polyline points="7 10 12 15 17 10"></polyline><line x1="12" y1="15" x2="12" y2="3"></line></svg> Download
                                                </a>

                                                <a class="dropdown-item" data-value="Share" data-icon="<svg xmlns=&quot;http://www.w3.org/2000/svg&quot; width=&quot;24&quot; height=&quot;24&quot; viewBox=&quot;0 0 24 24&quot; fill=&quot;none&quot; stroke=&quot;currentColor&quot; stroke-width=&quot;2&quot; stroke-linecap=&quot;round&quot; stroke-linejoin=&quot;round&quot; class=&quot;feather feather-share-2&quot;><circle cx=&quot;18&quot; cy=&quot;5&quot; r=&quot;3&quot;></circle><circle cx=&quot;6&quot; cy=&quot;12&quot; r=&quot;3&quot;></circle><circle cx=&quot;18&quot; cy=&quot;19&quot; r=&quot;3&quot;></circle><line x1=&quot;8.59&quot; y1=&quot;13.51&quot; x2=&quot;15.42&quot; y2=&quot;17.49&quot;></line><line x1=&quot;15.41&quot; y1=&quot;6.51&quot; x2=&quot;8.59&quot; y2=&quot;10.49&quot;></line></svg>" href="javascript:void(0);">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-share-2"><circle cx="18" cy="5" r="3"></circle><circle cx="6" cy="12" r="3"></circle><circle cx="18" cy="19" r="3"></circle><line x1="8.59" y1="13.51" x2="15.42" y2="17.49"></line><line x1="15.41" y1="6.51" x2="8.59" y2="10.49"></line></svg> Share
                                                </a>
                                                
                                            </div>
                        
                                        </div>
                                    </li>
                                </ul>
                            </header>
                        </div>
                    </div>
                    <!--  END BREADCRUMBS  -->
                
                <!-- 보낸 쪽지함 편집 시작 -->
                
               <div class="row layout-top-spacing">
                        <div class="col-xl-12 col-lg-12 col-md-12">
    
                            <div class="row">
    
                                 <div class="col-xl-12  col-md-12">
                                    <!-- 메세지 박스 시작 -->
                                    <div class="mail-box-container">

                                        <div id="mailbox-inbox" class="accordion mailbox-inbox">

                                            <div class="mail-overlay">
                                                <div class="tab-title">
                                                    <div class="row">

                                                        <div class="col-md-12 col-sm-12 col-12 mail-categories-container">
                                                            <div class="mail-sidebar-scroll"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="action-center">
                                                <div class="d-flex">
                                                    <div class="form-check form-check-primary form-check-inline mt-1" data-bs-toggle="collapse" data-bs-target>
                                                        <input class="form-check-input inbox-chkbox" type="checkbox" id="inboxAll">
                                                    </div>
                                                    <div class="col-md-12 col-sm-12 col-12 text-center mail-btn-container">
                                                        <a id="btn-compose-mail" class="btn btn-block" href="javascript:void(0);">메일 보내기</a>
                                                    </div>
                                                </div>
                                            </div>
                                    
                                            <div class="message-box">
                                                
                                                <div class="message-box-scroll" id="ct">
                                                    <!-- 보낸 쪽지함 시작 -->
                                                    <div class="mail-item">
                                                        <div id="msgSenders" class="mail-item">
                                                        <!-- 메일 리스트 HTML 동적처리할 부분-->
                                                        <!-- 메일 리스트 끝 -->
                                                        </div>
                                                    </div>
                                                </div>
        
                                                <div class="content-box">
                                                    <div class="d-flex msg-close">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left close-message"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
                                                        <h2 class="mail-title" data-selectedMailTitle=""></h2>
                                                    </div>

                                                    <div id="msgSender">
                                                    <!-- 메일 상세보기 시작 - HTML 동적 처리할 부분 -->                                               
                                                    <!-- 메일 상세보기 끝 -->
                                                    </div>
                                                </div>
                                                
                                            </div>
                                        </div>
                                    <!-- 메세지 박스 끝 -->

                                        <!-- 메세지 보내는 Modal 창 시작 -->
                                        <div class="modal fade" id="composeMailModal" tabindex="-1" role="dialog" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title add-title" id="notesMailModalTitleeLabel">발송</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                                                            <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                                                        </button>
                                                    </div>

                                                    <div class="modal-body">
                                                        <!-- <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x close" data-bs-dismiss="modal"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg> -->
                                                        <div class="compose-box">
                                                            <div class="compose-content">
                                                                <form id="m-form" method="post" action="${pageContext.request.contextPath}/insertMsg" enctype="multipart/form-data">
                                                                    <div class="row">
                                                                        <div class="col-md-12">
                                                                            <div class="mb-4 mail-to">
	                                                                            <p><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg> To:</p>
                                                                                <select class="form-control" id="m-to" name="empNoR">
	                                                                                <option value="">직원 선택</option>
	                                                                                <c:forEach items="${empList}" var="el">
		                                                                                <option value="${el.empNo}">${el.ename} &lt;${el.email}&gt;</option>
	                                                                                </c:forEach>
                                                                            	</select>
                                                                        	</div>
                                                                        </div>
                                                                    </div>
                                                                    
                                                                    <div class="row">
                                                                    <div class="col-md-6">
                                                                    	<div class="mb-4 mail-form">
                                                                            <p>From: ${ename}</p>
                                                                            <input type="email" id="m-from" class="form-control" name="emailS" value="${email}" readonly> 
                                                                            <input type="hidden" name="empNoS" value="${empNo}">
                                                                            <input type="hidden" id="stateS" name="stateS" value="E01">
                                                                        </div>
                                                                    </div>

																	<!-- ??? 참조자 어떻게 할건지 ??? -->
                                                                    <div class="col-md-6">
                                                                        <div class="mb-4 mail-cc">
                                                                            <p><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-list"><line x1="8" y1="6" x2="21" y2="6"></line><line x1="8" y1="12" x2="21" y2="12"></line><line x1="8" y1="18" x2="21" y2="18"></line><line x1="3" y1="6" x2="3" y2="6"></line><line x1="3" y1="12" x2="3" y2="12"></line><line x1="3" y1="18" x2="3" y2="18"></line></svg> CC:</p>
                                                                            <div>
                                                                                <input type="text" id="m-cc" class="form-control">
                                                                                <span class="validation-text"></span>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <!-- ??? 참조자 ??? -->
                                                                </div>
                                                                
                                                                    <div class="mb-4">
                                                                        <p><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg> Title:</p>
                                                                        <div class="w-100">
                                                                            <input type="text" id="m-title" name="title" class="form-control">
                                                                            <span class="validation-text"></span>
                                                                        </div>
                                                                    </div>
                                                                    
                                                                    <div class="">
                                                                        <p><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg> File:</p>
                                                                        <!-- <input type="file" class="form-control-file" id="mail_File_attachment" multiple="multiple"> -->
                                                                        <input class="form-control file-upload-input" type="file" id="formFile" multiple="multiple" name="msgFiles">
                                                                    </div>
                                                                    
																	<div id="editor-container">
                                                                	</div>
                                                                    <input type="hidden" id="m-content" name="content">

                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button id="btn-send" class="btn btn-primary"> 발송</button>
                                                        <button id="btn-save" class="btn float-left btn-success"> 저장</button>
                                                        <button class="btn" data-bs-dismiss="modal"> <i class="flaticon-delete-1"></i> 취소</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- 메세지 보내는 Modal 창 끝 -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <!-- 쪽지함 편집 끝 -->
                </div>
            <!--  BEGIN FOOTER  -->
            <jsp:include page="/WEB-INF/view/inc/footer.jsp" />
            <!--  END FOOTER  -->
            </div>
        </div>
	</div>
            
              
           <!--  END CONTENT AREA  -->

    <!-- END MAIN CONTAINER -->
   
    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="${pageContext.request.contextPath}/src/plugins/src/global/vendors.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/mousetrap/mousetrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/waves/waves.min.js"></script>
    <script src="${pageContext.request.contextPath}/layouts/vertical-light-menu/app.js" defer></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->
    <script src="${pageContext.request.contextPath}/src/plugins/src/editors/quill/quill.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/sweetalerts2/sweetalerts2.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/plugins/src/notification/snackbar/snackbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/src/assets/js/apps/mailbox.js"></script>

   <!-- END PAGE LEVEL SCRIPTS -->
   
   <!-- 모달 메일 발송 -->
	<script>
		// 발송 버튼 클릭 시 
		$('#btn-send').click(function() {
			// state 값을 E02로 변경
			$('#stateS').val("E02");
			// content 값 채우기
			$('#m-content').val($('.ql-editor').html());
			
			if($('#m-to').val() == '') {
				alert('수신인을 선택해주세요');
			} else if($('#m-title').val() == '') {
				alert('제목을 입력해주세요');
			} else if($('#m-content').val() == '') {
				alert('내용을 입력해주세요');
			} else {
				$('#m-form').submit(); // 폼 제출
			}
		});
	</script>
	
	<!-- 메일 뷰 -->
	<script>
         $.ajax({
                url: "/MsgSenders/" + "${principal.empNo}",
                method: 'GET', 
            }).done(function(result) {

                let msgSendersHTML = "";
                let msgSenderHTML = "";
                let no = 0;
                
                $(result).each(function(index, item) {
                    msgSendersHTML += `<div class="animated animatedFadeInUp fadeInUp" id="`+ "outNo" + no +`">
                                        <div class="mb-0">
                                            <div class="mail-item-heading work collapsed"  data-bs-toggle="collapse" role="navigation" data-bs-target="#inNo` + no + `" aria-expanded="false"  aria-controls="inNo` + no + `">
                                                <div class="mail-item-inner">
                                                    <div class="d-flex">
                                                        <div class="form-check form-check-primary form-check-inline mt-1 ms-1" data-bs-toggle="collapse" data-bs-target>
                                                            <input class="form-check-input inbox-chkbox" type="checkbox" id="form-check-default2">
                                                        </div>
                                                        <div class="f-head ms-3">
                                                        	<img src="${pageContext.request.contextPath}/upload/profile/` + item.fileNameE + "." + item.extE + `" class="user-profile" alt="avatar">
                                                        </div>
                                                        <div class="f-body">
                                                            <div class="meta-mail-time">
                                                                <p class="user-email">` + item.enameR + "(" + item.descriptR + ")" +` </p>
                                                            </div>
                                                            <div class="meta-title-tag">
                                                                <p class="mail-content-excerpt" data-mailDescription='{"ops":[{"insert":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi pulvinar feugiat consequat. Duis lacus nibh, sagittis id varius vel, aliquet non augue. Vivamus sem ante, ultrices at ex a, rhoncus ullamcorper tellus. Nunc iaculis eu ligula ac consequat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum mattis urna neque, eget posuere lorem tempus non. Suspendisse ac turpis dictum, convallis est ut, posuere sem. Etiam imperdiet aliquam risus, eu commodo urna vestibulum at. Suspendisse malesuada lorem eu sodales aliquam.\n"}]}'>
                                                                <span class="mail-title">` + item.title + `
                                                                <p class="meta-time align-self-center me-3">` + item.sendDate + `</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>`
                                    
                    msgSenderHTML += `<div id="inNo` + no + `" class="collapse" aria-labelledby="#outNo` + no + `" data-bs-parent="#mailbox-inbox">
                                        <div class="mail-content-container sentmail">
                                        
                                        <div class="d-flex justify-content-between mb-3">
                                            <div class="d-flex user-info">
                                                <div class="f-body">
                                                    <div class="meta-mail-time">
                                                        <div class="">
                                                            <p class="user-email"><span>To.</span>` + item.enameR + `</p>
                                                        </div>
                                                        <p class="mail-content-meta-date current-recent-mail">` + item.sendDate.substr(0, 10) + `</p>
                                                        <p class="meta-time align-self-center">` + item.sendDate.substr(11) + `</p>
                                                    </div>
                                                </div>
                                            </div>
                    
                                            <div class="action-btns">
                                                <a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" data-original-title="Reply">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-corner-up-left reply"><polyline points="9 14 4 9 9 4"></polyline><path d="M20 20v-7a4 4 0 0 0-4-4H4"></path></svg>
                                                </a>
                                                <a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" data-original-title="Forward">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-corner-up-right forward"><polyline points="15 14 20 9 15 4"></polyline><path d="M4 20v-7a4 4 0 0 1 4-4h12"></path></svg>
                                                </a>
                                            </div>
                                        </div>
                                        <p class="mail-content"> 
                                        ` + item.content + ` </p>
                                        <p> From.` + item.enameS + ` </p>
                    
                                        <div class="attachments">
                                            <h6 class="attachments-section-title">Attachments</h6>
                    
                                            <div class="attachment file-folder">
                                                <div class="media">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-folder"><path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z"></path></svg>
                                                    <div class="media-body">
                                                        <p>`;
                                                        
                                                        
                    msgSenderHTML += ((item.originNameM != null)?  
                              		           `<a href="${pageContext.request.contextPath}/upload/msg/` + item.fileNameM + "." + item.extM + `" download="` + item.originNameM + "." + item.extM + `"> ` + item.originNameM + "." + item.extM 
                              				  : `첨부파일없음`) 
                              		
                  
                    msgSenderHTML += `</p>
                                                    </div>
                                                </div>
                                            </div>
                    
                                        </div>
                                    </div>
                                </div>`
                                    
                    no++;
                                
                                
                });
                
                const script = document.createElement("script");
                script.src = `${pageContext.request.contextPath}/layouts/vertical-light-menu/app.js`;
                script.type = "text/javascript";
                script.async = true;
                document.body.appendChild(script);
                
                
                $('#msgSenders').append(msgSendersHTML);
                $('#msgSender').append(msgSenderHTML);

                
            }).fail(function() {
                console.log("senderMsg fail");
            });
            

         // 동적 바인딩을 위해 아래 내용으로 변경
         /* $('.content-box .collapse').on('show.bs.collapse', function(event) {
            var getCollpaseElementId = this.id;
            var getSelectedMailTitleElement = $('.content-box').find('.mail-title');
            var getSelectedMailContentTitle = $(this).find('.mail-content').attr('data-mailTitle');
            $(this).parent('.content-box').css({
               width: '100%',
               left: '0',
               right: '100%'
            });
            $(this).parents('#mailbox-inbox').find('.message-box [data-target="#'+getCollpaseElementId+'"]').parents('.mail-item').removeAttr('id');
            getSelectedMailTitleElement.text(getSelectedMailContentTitle);
            getSelectedMailTitleElement.attr('data-selectedMailTitle', getSelectedMailContentTitle);
            dynamicBadgeNotification('mailInbox');
         }) */
         
         // 동적바인딩 이벤트 적용
         $(document).on("show.bs.collapse", ".content-box .collapse", function(){
            var getCollpaseElementId = this.id;
            var getSelectedMailTitleElement = $('.content-box').find('.mail-title');
            var getSelectedMailContentTitle = $(this).find('.mail-content').attr('data-mailTitle');
            $(this).parent('#msgSender').parent('.content-box').css({
               width: '100%',
               left: '0',
               right: '100%'
            });
            $(this).parents('#mailbox-inbox').find('.message-box [data-target="#'+getCollpaseElementId+'"]').parents('.mail-item').removeAttr('id');
            getSelectedMailTitleElement.text(getSelectedMailContentTitle);
            getSelectedMailTitleElement.attr('data-selectedMailTitle', getSelectedMailContentTitle);
            dynamicBadgeNotification('mailInbox');
         });
            
         function dynamicBadgeNotification( setMailCategoryCount ) {
            var mailCategoryCount = setMailCategoryCount;

            // Get Parents Div(s)
            var get_ParentsDiv = $('.mail-item');
            var get_MailInboxParentsDiv = $('.mail-item.mailInbox');
            var get_UnreadMailInboxParentsDiv = $('[id*="unread-"]');
            var get_DraftParentsDiv = $('.mail-item.draft');

            // Get Parents Div(s) Counts
            var get_MailInboxElementsCount = get_MailInboxParentsDiv.length;
            var get_UnreadMailInboxElementsCount = get_UnreadMailInboxParentsDiv.length;
            var get_DraftElementsCount = get_DraftParentsDiv.length;

            // Get Badge Div(s)
            var getBadgeMailInboxDiv = $('#mailInbox .mail-badge');
            var getBadgeDraftMailDiv = $('#draft .mail-badge');

            if (mailCategoryCount === 'mailInbox') {
               if (get_UnreadMailInboxElementsCount === 0) {
                  getBadgeMailInboxDiv.text('');
                  return;
               }
               getBadgeMailInboxDiv.text(get_UnreadMailInboxElementsCount);
            } else if (mailCategoryCount === 'draftmail') {
               if (get_DraftElementsCount === 0) {
                  getBadgeDraftMailDiv.text('');
                  return;
               }
               getBadgeDraftMailDiv.text(get_DraftElementsCount);
            }
         }
   </script>
</body>
</html>